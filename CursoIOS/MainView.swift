//
//  ContentView.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 10/6/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name:"Pickachu"),
    Pokemon(name:"Pickachu2"),
    Pokemon(name:"Pickachu3"),
    Pokemon(name:"Pickachu4"),
    Pokemon(name:"Pickachu5")
]

struct MainView: View {
    
    @State var pulsaciones = 0
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Image("Airea")
                .imageScale(.small)
                .foregroundStyle(.tint)
            Image(systemName: "hand.thumbsup.fill")
                .imageScale(.large)
            Text("AIREA DEVELOPMENTS")
            Button(action: {
                pulsaciones += 1
            }, label: {
                Text(" Has pulsado \(pulsaciones) veces ")
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            })
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal,32)
                .onChange(of: email) { oldValue, newValue in
                    print("El antiguo valor es \(oldValue) y el nuevo es \(newValue)")
                }
            SecureField("Escribe tu password", text: $password)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal,32)
                .onChange(of: password) { oldValue, newValue in
                    print("El antiguo valor es \(oldValue) y el nuevo es \(newValue)")
                }
            List{
                Section(header: Text("Pokemons del tipo A")) {
                    //Listado con forEach
                    List{
                        ForEach(pokemons){ pokemon in
                            Text(pokemon.name)
                        }
                    }
                }
                Section(header: Text("Pokemons del tipo B")) {
                    //Listado sin ForEach
                    List(pokemons){ pokemon in
                        Text(pokemon.name)
                    }
                }
            }.listStyle(.grouped)
        }
        .padding()
    }
}

struct Pokemon: Identifiable{
    var id = UUID()
    let name:String
}

#Preview {
    MainView()
}
