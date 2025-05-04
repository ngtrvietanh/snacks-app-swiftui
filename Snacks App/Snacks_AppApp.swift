//
//  Snacks_AppApp.swift
//  Snacks App
//
//  Created by Việt Anh on 2/12/24.
//

import SwiftUI

@main
struct Snacks_AppApp: App {
    // đồng bộ với UserDefaults.standard.bool(forKey: "isLoggedIn")
      @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

      var body: some Scene {
          WindowGroup {
              if isLoggedIn {
                  // Nếu đã login → hiện HomeView
                  HomeView()
              } else {
                  // Nếu chưa login → hiện LoginView
                  LoginView()
              }
          }
      }
}
