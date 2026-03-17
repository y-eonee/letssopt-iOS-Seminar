//
//  ViewController.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 2/19/26.
//

import UIKit

class ViewController: UIViewController {
    
    private let rect = UIView(frame: CGRect(
        origin: CGPoint(x: 100, y: 100),
        size: (CGSize(width: 200, height: 200))))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        rect.backgroundColor = .systemBlue
        
        view.addSubview(rect)
    }
}

