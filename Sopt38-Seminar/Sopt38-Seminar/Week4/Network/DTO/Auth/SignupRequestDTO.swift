//
//  SignupRequestDTO.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/19/26.
//

import Foundation

struct SignupRequestDTO: Encodable {
    let loginId: String
    let password: String
    let name: String
    let email: String
    let age: Int
    let part: String
}
