//
//  GetHeroeByIDUseCase.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 17/6/24.
//

import SwiftUI

protocol GetHeroeByIdUseCase{
    func getHeroeById(id:String) async throws -> SuperHeroeDetailEntity.SuperHeroDetail
}

final class MockGetHeroeByIDUseCase:GetHeroeByIdUseCase{
    
    func getHeroeById(id:String) async throws -> SuperHeroeDetailEntity.SuperHeroDetail {
        let url = URL(string: "https://superheroapi.com/api/79c99fda9894cf4017793cdb40721cb6/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let superheroDetail = try JSONDecoder().decode(SuperHeroeDetailEntity.SuperHeroDetail.self, from: data)
        return superheroDetail
    }
}
