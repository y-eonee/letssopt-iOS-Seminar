//
//  LoginView.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 3/24/26.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView {
    
    private let titleLabel = UILabel()
    let idTextField = UITextField()
    let passwordTextField = UITextField()
    lazy var loginButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach{addSubview($0)}
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(169)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(63)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
    }
    
    private func setStyle() {
        backgroundColor = .white
        
        titleLabel.do {
            $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = .boldSystemFont(ofSize: 16)
        }
        
        idTextField.do {
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            $0.leftViewMode = .always
            $0.placeholder = "아이디"
            $0.font = .boldSystemFont(ofSize: 14)
            $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha : 1)
            $0.layer.cornerRadius = 3
        }
        
        passwordTextField.do {
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            $0.leftViewMode = .always
            $0.placeholder = "비밀번호"
            $0.font = .boldSystemFont(ofSize: 14)
            $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha : 1)
            $0.layer.cornerRadius = 3
        }
        
        loginButton.do {
            $0.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
            $0.layer.cornerRadius = 3
        }
    }
    
    
}
