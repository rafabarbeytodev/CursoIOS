//
//  LoginViewModel.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 13/6/24.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var result = ""
    
    private var apiClient = APIClient()
    
    func userLogin(email: String, password:String){
        Task{
            do{
                _ = try await apiClient.login(email: email, password: password)
                result = "Success"
            }catch let error as BackendError {
                print("ERROR: \(error.localizedDescription)")
                result = error.rawValue
            }
        }
    }
}
