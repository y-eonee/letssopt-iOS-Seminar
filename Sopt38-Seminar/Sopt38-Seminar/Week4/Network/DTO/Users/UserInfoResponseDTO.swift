//
//  UserInfoResponseDTO.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/21/26.
//

import Foundation

struct UserInfoResponseDTO: Decodable {
    let id: Int
    let loginId: String
    let name: String
    let email: String
    let age: Int
    let part: String
}

extension UserInfoResponseDTO {
    func toEntity() -> UserInfoEntity {
        .init(
            id: self.id,
            loginID: self.loginId,
            name: self.name,
            email: self.email,
            age: self.age,
            part: self.part
        )
    }
}
