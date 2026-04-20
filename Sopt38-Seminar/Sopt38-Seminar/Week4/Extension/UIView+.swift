//
//  UIView+.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/19/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
