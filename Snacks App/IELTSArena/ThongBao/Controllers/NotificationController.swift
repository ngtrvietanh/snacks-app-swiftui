//
//  NotificationController.swift
//  Snacks App
//
//  Created by Việt Anh on 5/5/25.
//

import Foundation

class NotificationController {
    func getUnreadNotifications(completion: @escaping (Result<[NotificationModel], Error>) -> Void) {
        guard let token = TokenManager.shared.getToken() else {
            completion(.failure(NSError(domain: "No token", code: 401)))
            return
        }

        NotificationService.shared.fetchNotifications(token: token, completion: completion)
    }
}
