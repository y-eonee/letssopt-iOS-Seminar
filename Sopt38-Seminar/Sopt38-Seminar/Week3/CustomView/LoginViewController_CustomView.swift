//
//  LoginViewController_AutoLayout.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 3/19/26.
//

import UIKit

import SnapKit

class LoginViewController_CustomView: UIViewController {

    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        rootView.idTextField.text = ""
        rootView.passwordTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }

    private func setAddTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
    }
    
    @objc
    private func loginButtonDidTapped() {
        pushToWelcomeVC()
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Delegate()
        welcomeViewController.id = rootView.idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
