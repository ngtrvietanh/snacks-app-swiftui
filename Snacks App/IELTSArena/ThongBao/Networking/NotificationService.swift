//
//  Untitled.swift
//  Snacks App
//
//  Created by Việt Anh on 5/5/25.
//

import Foundation

class NotificationService {
    static let shared = NotificationService()

    func fetchNotifications(token: String, completion: @escaping (Result<[NotificationModel], Error>) -> Void) {
        guard let url = URL(string: "https://erp.ieltsarena.edu.vn/api/notification?page=1&perPage=99999&size=99999") else {
            completion(.failure(NSError(domain: "", code: -1)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error {
                completion(.failure(err))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }
            do {
                let result = try JSONDecoder().decode(NotificationResponse.self, from: data)
                completion(.success(result.items))  // Trả về mảng items từ kết quả
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
