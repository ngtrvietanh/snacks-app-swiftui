//
//  LoginResponse.swift
//  Snacks App
//
//  Created by Việt Anh on 3/5/25.
//

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let expiresIn: Int
    let refreshExpiresIn: Int
}
