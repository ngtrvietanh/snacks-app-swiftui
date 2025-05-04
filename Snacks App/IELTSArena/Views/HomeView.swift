import SwiftUI

struct HomeView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = true
    @AppStorage("savedUserName") private var savedUserName: String?

    var body: some View {
        VStack(spacing: 20) {
            Text("Chào mừng đến trang chủ!")
                .font(.largeTitle)

            Button(action: {
                isLoggedIn = false
            }) {
                Text("Đăng xuất")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 32)
        }
        .navigationBarBackButtonHidden(true) // Ẩn nút Back của NavigationStack
    }
}
