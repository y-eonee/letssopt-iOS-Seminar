//
//  GetUsersListViewController.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/20/26.
//

import UIKit

final class GetUsersListViewController: UIViewController {
    private let rootView = GetUsersListView()
    
    private var userList: [UserData] = []
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsersList()
    }
    
    private func getUsersList() {
        Task {
            do {
                let response = try await GetUsersListService.shared.getUsersList()
                userList = response
                print("유저 리스트: \(response)")
                rootView.updateUI(usersList: userList)
            } catch {
                let alert = UIAlertController(
                    title: "유저 조회 실패",
                    message : error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("유저 조회 실패", error)
            }
        }
    }
}
