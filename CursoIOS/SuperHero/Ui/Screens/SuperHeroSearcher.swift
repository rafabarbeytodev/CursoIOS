//
//  SuperHeroSearcher.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 12/6/24.
//

import SwiftUI

struct SuperHeroSearcher: View {
    @State var superheroname: String = ""
    var body: some View {
        VStack{
            TextField("", text: $superheroname, prompt: Text("SuperHero....").font(.title2).bold().foregroundColor(.gray))         .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(16)
                .border(Color.purple, width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    print(superheroname)
                    Task{
                        do{
                            let response = try await ApiNetwork().getHeroesByQuery(query: superheroname)
                            print(response)
                        }
                        catch{
                            print("ERROR")
                        }
                    }
                }
            Spacer()
        }.frame(maxWidth:.infinity,maxHeight:.infinity).background(.backgroundApp)
    }
}

#Preview {
    SuperHeroSearcher()
}
