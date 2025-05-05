import SwiftUI

// MARK: - Hex Color Extension
extension Color {
    init(hex string: String) {
        let hex = string.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24 & 0xFF, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Placeholder Extension
fileprivate extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            }
            self
        }
    }
}

struct LoginView: View {
    
    @AppStorage("savedUserName") private var userName: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = true
    @State private var alertMessage = ""
    @State private var showAlert = false
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    private let controller = LoginViewController()

    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()

            VStack(spacing: 30) {
                VStack(spacing: 30) {
                    Image("Logo MMD Holdings")
                        .resizable()
                        .frame(width: 70, height: 36)

                    Image("Logo IELTS Arena")
                        .resizable()
                        .frame(width: 242, height: 166)
                }

                VStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .overlay(
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    Image(systemName: "person.fill")
                                    TextField("Tài khoản", text: $userName)
                                        .font(.system(size: 14, weight: .medium))
                                        .multilineTextAlignment(.leading)
                                        .frame(height: 20)
                                }
                                .padding(.horizontal)
                                .frame(height: 36)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)

                                HStack {
                                    Image(systemName: "lock.fill")
                                    SecureField("Mật khẩu", text: $password)
                                        .font(.system(size: 14, weight: .medium))
                                        .multilineTextAlignment(.leading)
                                        .frame(height: 20)
                                }
                                .padding(.horizontal)
                                .frame(height: 36)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)

                                HStack {
                                    Button(action: {
                                        rememberMe.toggle()
                                    }) {
                                        HStack(spacing: 12) {
                                            Image(systemName: rememberMe ? "checkmark.circle.fill" : "circle")
                                                .foregroundColor(.red)
                                            Text("Ghi nhớ tài khoản")
                                                .font(.system(size: 14))
                                                .foregroundColor(.black)
                                        }
                                    }

                                    Spacer()

                                    Button("Quên mật khẩu") {
                                        // Handle forgot password
                                    }
                                    .font(.system(size: 14))
                                    .foregroundColor(.blue)
                                }
                            }
                            .padding(.horizontal, 12)
                        )
                        .frame(width: 362, height: 202)
                }

                // Nút đăng nhập
                Button(action: {
                    controller.login(userName: userName, password: password) {message, token in
                        alertMessage = message

                        if message.lowercased().contains("success"), let token = token {
                            UserDefaults.standard.set(true, forKey: "isLoggedIn")
                            UserDefaults.standard.set(token, forKey: "userToken") // ✅ Lưu token

                            if rememberMe {
                                UserDefaults.standard.set(userName, forKey: "savedUserName")
                            } else {
                                UserDefaults.standard.removeObject(forKey: "savedUserName")
                            }

                            isLoggedIn = true
                        } else {
                            showAlert = true
                        }
                    }
                }) {
                    Text("Đăng nhập")
                        .frame(width: 206, height: 41)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .font(.system(size: 14, weight: .bold))
                        .cornerRadius(25)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Thông báo"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("Đóng"))
                    )
                }

                Spacer()

                Text("Ngôn ngữ  VN")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .padding(.bottom, 20)
            }
            .padding(.top, 30)

        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
