//
//  UIAlertController+.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/23/26.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, subMessage: String) {
        let alert = UIAlertController(
            title: title,
            message : subMessage,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
