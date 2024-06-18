//
//  CursoIOSApp.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 10/6/24.
//

import SwiftUI

@main
struct CursoIOSApp: App {
    @State var superHeroeVM = SuperHeroesViewModel(getHeroesByQueryUseCase: MockGetHeroesByQueryUseCase())
    @State var superHeroeDetailVM = SuperHeroeDetailViewModel(getHeroeByIdUseCase: MockGetHeroeByIDUseCase())
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environment(superHeroeVM)
                .environment(superHeroeDetailVM)
        }
    }
}
