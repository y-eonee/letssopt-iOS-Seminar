//
//  GetUsersListResponseDTO.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/20/26.
//

import Foundation

struct GetUsersListResponseDTO: Decodable {
    let status: Int
    let message: String
    let data: [UserData]
}

struct UserData: Decodable {
    let name: String
    let part: String
}
