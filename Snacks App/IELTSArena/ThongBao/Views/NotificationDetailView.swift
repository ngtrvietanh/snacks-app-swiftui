//
//  NotificationDetailView.swift
//  Snacks App
//
//  Created by Việt Anh on 7/5/25.
//

import SwiftUI

struct NotificationDetailView: View {
    let notification: NotificationModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(notification.title)
                .font(.title2)
                .bold()

            Text(notification.message)
                .font(.body)

            Text("Thời gian: \(notification.createdAt)")
                .font(.footnote)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle("Chi tiết")
    }
}
