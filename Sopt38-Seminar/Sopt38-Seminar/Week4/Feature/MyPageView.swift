//
//  MyPageView.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/21/26.
//

import UIKit

import SnapKit
import Then

final class MyPageView: UIView {
    private let titleLabel = UILabel()
    let idTextField = UITextField()
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let ageTextField = UITextField()
    let partTextField = UITextField()
    lazy var editButton = UIButton()
    
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
        addSubviews(titleLabel, idTextField, nameTextField, emailTextField, ageTextField, partTextField, editButton)
    }
    
    private func setStyle() {
        backgroundColor = .white
        titleLabel.do {
            $0.text = "내 정보 조회 및 수정"
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
        
        [idTextField, partTextField].forEach {
            $0.do {
                $0.isUserInteractionEnabled = false
                $0.backgroundColor = .systemGray6
                $0.textColor = .black
            }
        }
        
        [idTextField, nameTextField, emailTextField, ageTextField, partTextField].forEach {
            $0.do {
                $0.addLeftPadding()
                $0.borderStyle = .roundedRect
            }
        }
        
        editButton.do {
            $0.setTitle("수정하기", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(20)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
}

extension MyPageView {
    func updateUI(
        id: String? = nil,
        name: String,
        email: String,
        age: Int,
        part: String? = nil
    ) {
        if let id = id, let part = part {
            self.idTextField.text = id
            self.partTextField.text = part
        }
        
        self.nameTextField.text = name
        self.emailTextField.text = email
        self.ageTextField.text = "\(age)"
    }
}
