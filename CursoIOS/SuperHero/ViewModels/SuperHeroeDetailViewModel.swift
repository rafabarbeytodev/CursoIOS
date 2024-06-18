//
//  SuperHeroeDetailViewModel.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 18/6/24.
//

import SwiftUI

@Observable
final class SuperHeroeDetailViewModel {
    
    var superHeroeDetail: SuperHeroeDetailEntity.SuperHeroDetail
    private var getHeroeByIdUseCase: GetHeroeByIdUseCase
    
    init(getHeroeByIdUseCase: GetHeroeByIdUseCase){
        self.getHeroeByIdUseCase = getHeroeByIdUseCase
        let imageDetail = SuperHeroeDetailEntity.ImageDetail(url: "")
        let powerstats = SuperHeroeDetailEntity.Powerstats(intelligence: "0", strength: "0", speed: "0", durability: "0", power: "0", combat: "0")
        let biography = SuperHeroeDetailEntity.Biography(
            fullName: "",
            alterEgos: "",
            aliases: [""],
            placeOfBirth: "",
            firstAppearance: "",
            publisher: "",
            alignment: ""
        )
        self.superHeroeDetail = SuperHeroeDetailEntity.SuperHeroDetail(
            id: "",
            name: "",
            image: imageDetail,
            powerstats: powerstats,
            biography: biography
        )
    }
    
    var loading:Bool = false
    
    func getHeroeById(id: String) {
        Task{
            loading = true
            do{
                superHeroeDetail = try await getHeroeByIdUseCase.getHeroeById(id: id)
            }catch{
                print("ERROR DETALLE")
            }
            loading = false
        }
    }
}


