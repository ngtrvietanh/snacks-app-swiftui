//
//  LoginService.swift
//  Snacks App
//
//  Created by Việt Anh on 3/5/25.
//

import Foundation

class LoginService {
    static let shared = LoginService()

    func login(request: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        guard let url = URL(string: "https://develop-crm.ieltsarena.edu.vn/api/authentication/createSession") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error)); return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -2))); return
            }

            // Nếu status code không phải là 2xx, parse lỗi
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorResponse.message])))
                } else {
                    completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])))
                }
                return
            }

            do {
                let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

}
