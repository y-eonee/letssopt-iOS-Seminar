//
//  SignupViewController.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/19/26.
//

import UIKit

final class SignupViewController: UIViewController {
    
    private let rootView = SignupView()
    private var id: String = ""
    private var password: String = ""
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
    }
    
    private func setAddTarget() {
        [rootView.idTextField,
         rootView.passwordTextField,
         rootView.nameTextField,
         rootView.emailTextField,
         rootView.ageTextField,
         rootView.partTextField
        ].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        rootView.signupButton.addTarget(self, action: #selector(signupButtonDidTap), for: .touchUpInside)
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        rootView.getUsersButton.addTarget(self, action: #selector(getUsersButtonDidTap), for: .touchUpInside)
    }
}

extension SignupViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case rootView.idTextField:
            id = textField.text ?? ""
        case rootView.passwordTextField:
            password = textField.text ?? ""
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
    
    @objc
    private func signupButtonDidTap() {
        Task {
            do {
                let _ = try await SignupService.shared.postSignup(
                    loginId: id, password: password, name: name, email: email, age: age, part: part
                )
                
                self.navigationController?.pushViewController(LoginAPIViewController(), animated: true)
                print("회원가입 성공")
            } catch {
                let alert = UIAlertController(
                    title: "회원가입 실패",
                    message : error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("회원가입 실패", error)
            }
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        navigationController?.pushViewController(LoginAPIViewController(), animated: true)
    }
    
    @objc
    private func getUsersButtonDidTap() {
        navigationController?.pushViewController(GetUsersListViewController(), animated: true)
    }
}
