//
//  SuperHeroeDetailEntity.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 17/6/24.
//

import SwiftUI

class SuperHeroeDetailEntity: Decodable{
    
    struct SuperHeroDetail:Codable{
        let id:String
        let name:String
        let image:ImageDetail
        let powerstats:Powerstats
        let biography:Biography
    }
    
    struct ImageDetail:Codable{
        let url:String
    }
    
    struct Powerstats:Codable{
        let intelligence:String
        let strength:String
        let speed: String
        let durability:String
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
}
