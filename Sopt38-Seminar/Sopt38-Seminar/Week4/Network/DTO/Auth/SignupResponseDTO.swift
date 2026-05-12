//
//  SignupResponseDTO.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/19/26.
//

import Foundation

struct SignupResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let meta: ErrorResponseDTO?
}

struct ErrorResponseDTO: Decodable {
    let path: String
    let timestamp: String 
}
