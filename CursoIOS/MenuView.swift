//
//  MenuView.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 11/6/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: IMCView()){
                    Text("IMC Calculator")
                }
                Text("Aplicación 2")
                Text("Aplicación 3")
                Text("App 4")
                Text("App 5")
            }
        }
    }
}

#Preview {
    MenuView()
}
