//
//  GetUsersListView.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/20/26.
//

import UIKit

import SnapKit
import Then

final class GetUsersListView: UIView {
    private let usersListTextView = UITextView()
    
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
        addSubview(usersListTextView)
    }
    
    private func setStyle() {
        backgroundColor = .white
        
        usersListTextView.do {
            $0.font = .systemFont(ofSize: 15)
            $0.isEditable = false
        }
    }
    
    private func setLayout() {
        usersListTextView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
}

extension GetUsersListView {
    func updateUI(usersList: [UserData]) {
        usersListTextView.text = usersList
            .map { "\($0.name) / \($0.part)" }
            .joined(separator: "\n")
    }
}
