//
//  TokenManager.swift
//  Snacks App
//
//  Created by Việt Anh on 5/5/25.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()

    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "userToken")
    }

    func getToken() -> String? {
        UserDefaults.standard.string(forKey: "userToken")
    }

    func clearToken() {
        UserDefaults.standard.removeObject(forKey: "userToken")
    }
}
