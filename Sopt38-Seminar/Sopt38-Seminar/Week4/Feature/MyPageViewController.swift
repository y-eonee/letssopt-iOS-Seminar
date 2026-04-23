//
//  MyPageViewController.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/21/26.
//

import UIKit

final class MyPageViewController: UIViewController {
    private let rootView = MyPageView()
    
    private var id: String = ""
    private var name: String = ""
    private var email: String = ""
    private var age: Int = 0
    private var part: String = ""
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
        getUserInfo()
    }
    
    private func setAddTarget() {
        rootView.nameTextField.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        rootView.emailTextField.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        rootView.partTextField.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        rootView.editButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
    }
}

extension MyPageViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case rootView.idTextField:
            id = textField.text ?? ""
        case rootView.nameTextField:
            name = textField.text ?? ""
        case rootView.emailTextField:
            email = textField.text ?? ""
        case rootView.ageTextField:
            age = Int(textField.text ?? "") ?? 0
        case rootView.partTextField:
            part = textField.text ?? ""
        default:
            return
        }
    }
    
    private func getUserInfo() {
        Task {
            do {
                let response = try await DefaultUserService.shared.getUserInfo()
                id = response.loginID
                name = response.name
                email = response.email
                age = response.age
                part = response.part
                print("유저 정보 조회 \(response)")
                rootView.updateUI(id: id, name: name, email: email, age: age, part: part)
            } catch {
                let alert = UIAlertController()
                alert.showAlert(title: "유저 정보 조회 실패", subMessage: error.localizedDescription)
                self.present(alert, animated: true)
                
                print("유저 정보 조회 실패", error)
            }
        }
    }
    
    @objc
    private func editButtonDidTap() {
        patchUserInfo(name: name, email: email, age: age)
    }
    
    private func patchUserInfo(name: String, email: String, age: Int) {
        Task {
            do {
                let _ = try await DefaultUserService.shared.patchUserInfo(name: name, email: email, age: age)
                rootView.updateUI(name: name, email: email, age: age)
                let alert = UIAlertController()
                alert.showAlert(title: "유저 정보를 수정했습니다", subMessage: "수정 완료")
                self.present(alert, animated: true)
                
                print("유저 정보 수정 완료")
            } catch {
                let alert = UIAlertController()
                alert.showAlert(title: "수정 실패", subMessage: error.localizedDescription)
                self.present(alert, animated: true)
                
                print("유저 정보 수정 실패", error)
            }
        }
    }
}
