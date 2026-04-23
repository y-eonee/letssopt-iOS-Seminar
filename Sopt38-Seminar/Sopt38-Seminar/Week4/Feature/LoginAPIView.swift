//
//  LoginAPIView.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/20/26.
//

import UIKit

final class LoginAPIView: UIView {
    let idTextField = UITextField()
    let passwordTextField = UITextField()
    lazy var loginButton = UIButton()
    
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
        addSubviews(idTextField, passwordTextField, loginButton)
    }
    
    private func setStyle() {
        backgroundColor = .white
        
        idTextField.do {
            $0.addLeftPadding()
            $0.placeholder = "아이디"
            $0.borderStyle = .roundedRect
        }
        
        passwordTextField.do {
            $0.addLeftPadding()
            $0.placeholder = "비밀번호"
            $0.borderStyle = .roundedRect
        }
        
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
}
