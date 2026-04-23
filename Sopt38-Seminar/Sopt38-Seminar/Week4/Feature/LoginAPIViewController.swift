//
//  LoginAPIViewController.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/19/26.
//

import UIKit

final class LoginAPIViewController: UIViewController {
    private let rootView = LoginAPIView()
    
    private var id: String = ""
    private var password: String = ""
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    private func setAddTarget() {
        [rootView.idTextField,
         rootView.passwordTextField
        ].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
}

extension LoginAPIViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case rootView.idTextField:
            id = textField.text ?? ""
        case rootView.passwordTextField:
            password = textField.text ?? ""
        default:
            return
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        Task {
            do {
                let response = try await LoginService.shared.postLogin(loginId: id, password: password)
                DefaultUserService.shared.userID = response.userId
                print("로그인 성공. 유저이이디 \(response.userId)")
                navigationController?.pushViewController(MyPageViewController(), animated: true)
            } catch {
                let alert = UIAlertController()
                alert.showAlert(title: "로그인 실패", subMessage: error.localizedDescription)
                self.present(alert, animated: true)
                
                print("로그인 실패", error)
            }
        }
    }
}
