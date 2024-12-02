//
//  CartView.swift
//  Snacks App
//
//  Created by Việt Anh on 2/12/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Cart")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        Spacer()
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("3")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height: 90)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(30)
                    
                }
            }
        }
    }
}

#Preview {
    CartView()
}
