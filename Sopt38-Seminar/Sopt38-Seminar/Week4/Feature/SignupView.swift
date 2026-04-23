//
//  SignupView.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/19/26.
//

import UIKit

import SnapKit
import Then

final class SignupView: UIView {
    let idTextField = UITextField()
    let passwordTextField = UITextField()
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let ageTextField = UITextField()
    let partTextField = UITextField()
    lazy var signupButton = UIButton()
    lazy var loginButton = UIButton()
    lazy var getUsersButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(
            idTextField, passwordTextField, nameTextField, emailTextField, ageTextField, partTextField,
            signupButton, loginButton, getUsersButton
        )
    }
    
    private func setStyle() {
        backgroundColor = .white
        
        let placeholder = ["아이디", "비밀번호", "이름", "이메일", "나이", "iOS, 안드로이드, 웹 중 하나를 입력해주세요."]
        
        [idTextField, passwordTextField, nameTextField, emailTextField, ageTextField, partTextField]
            .enumerated()
            .forEach { index, textField in
                textField.do {
                    $0.addLeftPadding()
                    $0.placeholder = placeholder[index]
                    $0.borderStyle = .roundedRect
                }
            }
        
        signupButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
        
        getUsersButton.do {
            $0.setTitle("유저 리스트 조회", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(signupButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        getUsersButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
}
