//
//  LoginView.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 13/6/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var loginVM = LoginViewModel()
    //@Environment(LoginViewModel.self) private var loginVM
    
    @State private var email:String = ""
    @State private var password:String = ""
    
    var body: some View {
        
        let result:String = loginVM.result
        
        VStack{
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal,32)
                .onChange(of: email) { oldValue, newValue in
                    email = newValue
                }
            SecureField("Escribe tu password", text: $password)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal,32)
                .onChange(of: password) { oldValue, newValue in
                    password = newValue
                }
            Button(action: {
                loginVM.userLogin(email: email.lowercased(), password: password)
            }, label: {
                Text("Login")
                    .frame(width: 100,height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            })
            Text("Result: \(result)")
        }
    }
}

#Preview {
    LoginView()
}
