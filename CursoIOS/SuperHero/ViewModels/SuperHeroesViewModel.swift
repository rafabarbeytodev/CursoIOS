//
//  SuperHeroesViewModel.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 17/6/24.
//

import SwiftUI

@Observable
final class SuperHeroesViewModel {
    
    var superHeroes: SuperHeroesEntity.Wrapper
    private var getHeroesByQueryUseCase: GetHeroesByQueryUseCase
    
    init(getHeroesByQueryUseCase: GetHeroesByQueryUseCase){
        self.getHeroesByQueryUseCase = getHeroesByQueryUseCase
        self.superHeroes = SuperHeroesEntity.Wrapper(response: "", results: [])
    }
    
    var loading:Bool = false
    
    func getHeroesByQuery(query: String) {
        Task{
            loading = true
            do{
                superHeroes = try await getHeroesByQueryUseCase.getHeroesByQuery(query: query)
            }
            catch{
                print("ERROR LISTADO")
            }
            loading = false
        }
    }
}

