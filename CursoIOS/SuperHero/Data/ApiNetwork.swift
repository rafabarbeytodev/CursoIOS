//
//  ApiNetwork.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 12/6/24.
//

import Foundation

class ApiNetwork{
    
    struct Wrapper:Codable{
        let response:String
        let results:[SuperHero]
    }
    struct SuperHero:Codable, Identifiable{
        let id:String
        let name:String
        let image:Image
    }
    struct Image:Codable{
        let url:String
    }
    
    struct SuperHeroDetail:Codable{
        let id:String
        let name:String
        let image:Image
        let powerstats:Powerstats
        let biography:Biography
    }
    
    struct Powerstats:Codable{
        let intelligence:String
        let strength:String
        let speed: String
        let durbility:String
        let power:String
        let combat:String
    }
    
    struct Biography:Codable{
        let fullName:String
        let alterEgos:String
        let aliases:[String]
        let placeOfBirth:String
        let firstAppearance:String
        let publisher:String
        let alignment:String
        
        //Para salvar el problema del guion en el nombre
        enum CodingKeys:String, CodingKey{
            case fullName = "full-name"
            case alterEgos = "alter-egos"
            case placeOfBirth = "place-of-birth"
            case firstAppearance = "first-appearance"
            case aliases = "aliases"
            case publisher = "publisher"
            case alignment = "alignment"
        }
    }
    
    func getHeroesByQuery(query:String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/79c99fda9894cf4017793cdb40721cb6/search/\(query)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    
    func getHeroeByID(id:String) async throws -> SuperHeroDetail {
        let url = URL(string: "https://superheroapi.com/api/79c99fda9894cf4017793cdb40721cb6/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let superhero = try JSONDecoder().decode(SuperHeroDetail.self, from: data)
        return superhero
    }
}
