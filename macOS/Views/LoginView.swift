//
//  LoginView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 12/4/2023.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Header()
            
            VStack(alignment: .trailing) {
                UsernameField(username: $username)
                PasswordField(password: $password)
            }
            .frame(maxWidth: 300)
            
            Spacer()
            
            HStack {
                Spacer()
                LoginButton()
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
            }
        }
        .frame(width: 400, height: 200)
    }
}

struct Header: View {
    var body: some View {
        Text("Login to Jellyfin Server")
            .bold()
    }
}

struct UsernameField: View {
    @Binding var username: String
    
    var body: some View {
        HStack {
            Text("Username:")
            TextField("Nemo", text: $username)
                .frame(maxWidth: 200)
        }
    }
}

struct PasswordField: View {
    @Binding var password: String
    
    var body: some View {
        HStack {
            Text("Password:")
            SecureField("Required", text: $password)
                .frame(maxWidth: 200)
        }
    }
}

struct LoginButton: View {
    var body: some View {
        Button("Login") {
            
        }
        .keyboardShortcut(.defaultAction)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
