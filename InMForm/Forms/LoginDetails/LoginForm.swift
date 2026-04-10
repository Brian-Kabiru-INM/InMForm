//
//  LoginForm.swift
//  InMForm
//
//  Created by Brian Kabiru on 08/04/2026.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Username field
            TextField("Username", text: $username)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            // Password field
            if isSecure {
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
            } else {
                TextField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
            }
            
            // Toggle secure entry
            Button(action: {
                isSecure.toggle()
            }) {
                Text(isSecure ? "Show Password" : "Hide Password")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            
            // Login button
            Button(action: {
                // Handle login logic here
                print("Logging in with \(username) / \(password)")
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
