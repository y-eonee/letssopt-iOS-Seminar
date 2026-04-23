//
//  BaseResponseDTO.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/21/26.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: T?
}
