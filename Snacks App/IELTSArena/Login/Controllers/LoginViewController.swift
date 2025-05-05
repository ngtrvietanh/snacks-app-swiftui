//
//  LoginViewController.swift
//  Snacks App
//
//  Created by Việt Anh on 3/5/25.
//

import Foundation

class LoginViewController {
    func login(userName: String, password: String, completion: @escaping (_ message: String, _ token: String?) -> Void) {
        let request = LoginRequest(userName: userName, password: password)
        
        LoginService.shared.login(request: request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    completion("Success", response.accessToken) // ✅ Trả token
                case .failure(let error):
                    print(error)
                    completion(error.localizedDescription, nil) // ❌ Không có token
                }
            }
        }
    }

}
