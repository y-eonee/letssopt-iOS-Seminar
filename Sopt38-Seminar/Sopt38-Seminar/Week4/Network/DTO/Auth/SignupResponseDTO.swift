//
//  SignupResponseDTO.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/19/26.
//

import Foundation

struct SignupResponseDTO: Decodable {
    let status: Int
    let message: String
    let data: Int?
}
