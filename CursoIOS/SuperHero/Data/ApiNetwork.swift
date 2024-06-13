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
    
    func getHeroesByQuery(query: String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/79c99fda9894cf4017793cdb40721cb6/search/\(query)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
}
