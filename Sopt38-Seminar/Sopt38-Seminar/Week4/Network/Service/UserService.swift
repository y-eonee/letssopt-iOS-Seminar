//
//  UserService.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/21/26.
//

import Foundation

enum UserAPI {
    case getUserInfo(userID: Int)
    case patchUserInfo(userID: Int, dto: PatchUserInfoRequestDTO)
    
    var path: String {
        switch self {
        case .getUserInfo(let userID):
            return "/api/v1/users/\(userID)"
        case .patchUserInfo(let userID, _):
            return "/api/v1/users/\(userID)"
        }
    }
    
    var method: String {
        switch self {
        case .getUserInfo:
            return "GET"
        case .patchUserInfo:
            return "PATCH"
        }
    }
    
    var requestBody: Data? {
        switch self {
        case .getUserInfo(_):
            return nil
        case .patchUserInfo(_, let dto):
            return try? JSONEncoder().encode(dto)
        }
    }
}

protocol UserService {
    var userID: Int { get set }
    func getUserInfo() async throws -> UserInfoEntity
    func patchUserInfo(name: String, email: String, age: Int) async throws
}

final class DefaultUserService: UserService {
    static var shared = DefaultUserService()
    private init() {}
    
    var userID: Int = 0

    private func makeRequest(endPoint: UserAPI) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let baseUrl = baseURL
        print(baseUrl)
        let path = endPoint.path
        let url = baseUrl + path
        print(url)
        guard let encodedurl = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodedurl)
        
        request.httpMethod = endPoint.method
        
        
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let body = endPoint.requestBody {
            request.httpBody = body
        }
        
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("Request Body: \(str)")
        }
        
        return request
    }
    
    func getUserInfo() async throws-> UserInfoEntity {
        let request = try makeRequest(endPoint: .getUserInfo(userID: userID))
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(request)")
        
        guard let httpRespones = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response \(response)")
        
        guard(200...299).contains(httpRespones.statusCode) else {
            throw configureHTTPError(errorCode: httpRespones.statusCode)
        }
        
        do{
            let decoded = try JSONDecoder().decode(BaseResponseDTO<UserInfoResponseDTO>.self, from: data)
            guard let data = decoded.data else {  throw NetworkError.responseError }
            return data.toEntity()
        } catch {
            throw error
        }
    }
    
    func patchUserInfo(name: String, email: String, age: Int) async throws {
        let request = try makeRequest(endPoint: .patchUserInfo(
            userID: userID,
            dto: .init(name: name, email: email, age: age)
        ))
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(request)")
        
        guard let httpRespones = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response \(response)")
        
        guard(200...299).contains(httpRespones.statusCode) else {
            throw configureHTTPError(errorCode: httpRespones.statusCode)
        }
        
        do{
            let decoded = try JSONDecoder().decode(BaseResponseDTO<UserInfoResponseDTO>.self, from: data)
            guard let data = decoded.data else {  throw NetworkError.responseError }
        } catch {
            throw error
        }
    }
    
    
    private func configureHTTPError(errorCode: Int) -> Error{
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
