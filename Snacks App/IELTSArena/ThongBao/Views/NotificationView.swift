//
//  Notification.swift
//  Snacks App
//
//  Created by Việt Anh on 5/5/25.
//

import SwiftUI

struct NotificationView: View {
    @State private var notifications: [NotificationModel] = []
    @State private var isLoading = true
    @State private var errorMessage: String?
    
    private let controller = NotificationController()

    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    ProgressView("Đang tải thông báo...")
                } else if let errorMessage = errorMessage {
                    Text("Lỗi: \(errorMessage)")
                        .foregroundColor(.red)
                } else if notifications.isEmpty {
                    Text("Không có thông báo chưa đọc.")
                        .foregroundColor(.gray)
                } else {
                    List(notifications) { notification in
                        NavigationLink(destination: NotificationDetailView(notification: notification)) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(notification.title)
                                    .font(.headline)
                                Text(notification.message)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(notification.createdAt)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
            .navigationTitle("Thông báo")
        }
        .onAppear {
            loadNotifications()
        }
    }

    func loadNotifications() {
        isLoading = true
        controller.getUnreadNotifications { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let list):
                    self.notifications = list
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}


struct NotificationView_Preview: View {
    var body: some View {
        NotificationView()
    }
}
