//
//  ApiNetwork.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 12/6/24.
//

import SwiftUI

class SuperHeroesEntity{
    
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

}


