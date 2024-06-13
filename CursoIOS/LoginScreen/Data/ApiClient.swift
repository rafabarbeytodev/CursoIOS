//
//  ApiClient.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 13/6/24.
//

import Foundation

enum BackendError: String, Error{
    case invalidEmail = "Comprueba el email"
    case invalidPassword = "Comprueba tu password"
}

final class APIClient{
    func login(withEmail email: String, password:String) async throws -> User{
        //Simulamos la llamada al backend y esperamos 2 sg
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
        return try simulateBackendLogic(email: email, password: password)
    }
}

func simulateBackendLogic(email:String, password:String) throws -> User{
    guard email == "rbartorre@gmail.com" else{
        print("El user no es correcto")
        throw BackendError.invalidEmail
    }
    guard password == "1234" else{
        print("La password no es correcto")
        throw BackendError.invalidPassword
    }
    print("Success")
    return .init(name: "rbartorre",token: "token_1234",sessionStart: .now)
}
