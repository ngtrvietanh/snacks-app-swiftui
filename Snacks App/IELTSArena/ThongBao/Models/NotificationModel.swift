//
//  NotificationModel.swift
//  Snacks App
//
//  Created by Việt Anh on 5/5/25.
//

// Notification.swift
struct NotificationModel: Identifiable, Codable {
    let id: String  // Sử dụng id làm thuộc tính duy nhất
    let user: String
    let event: String
    let message: String
    let status: String
    let reference: String
    let createdAt: String

    var title: String { // Tạo thuộc tính title nếu cần
        return message // Hoặc bất kỳ thông tin nào bạn muốn làm tiêu đề
    }
}

struct NotificationResponse: Codable {
    let items: [NotificationModel]
    let unreadCount: Int
    let total: Int
}
