//
//  LoginRequestDTO.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/21/26.
//

import Foundation

struct LoginRequestDTO: Encodable {
    let loginId: String
    let password: String
}
