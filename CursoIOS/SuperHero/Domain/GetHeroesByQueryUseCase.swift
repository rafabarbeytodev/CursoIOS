//
//  GetHeroesByQueryUseCase.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 17/6/24.
//

import SwiftUI

protocol GetHeroesByQueryUseCase{
    func getHeroesByQuery(query:String) async throws -> SuperHeroesEntity.Wrapper
}

final class MockGetHeroesByQueryUseCase: GetHeroesByQueryUseCase{
    
    func getHeroesByQuery(query:String) async throws -> SuperHeroesEntity.Wrapper{
        let url = URL(string: "https://superheroapi.com/api/79c99fda9894cf4017793cdb40721cb6/search/\(query)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let superHeroesEntity = try JSONDecoder().decode(SuperHeroesEntity.Wrapper.self, from: data)
        return superHeroesEntity
    }
    
}

