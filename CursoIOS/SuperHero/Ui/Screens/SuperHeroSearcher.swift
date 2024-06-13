//
//  SuperHeroSearcher.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 12/6/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {
    @State var superheroname: String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
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
                    loading = true
                    print(superheroname)
                    Task{
                        do{
                            wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroname)
                        }
                        catch{
                            print("ERROR")
                        }
                        loading = false
                    }
                }
            if loading{
                ProgressView().tint(.white)
            }
            NavigationStack{
                List(wrapper?.results ?? []){ superhero in
                    ZStack{
                        SuperHeroItem(superhero: superhero)
                        NavigationLink(destination: {}){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
                Spacer()
        }.frame(maxWidth:.infinity,maxHeight:.infinity).background(.backgroundApp)
    }
}

struct SuperHeroItem: View {
    let superhero: ApiNetwork.SuperHero
    var body: some View {
        ZStack{
            WebImage(url:URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack{
                Spacer()
                Text(superhero.name).foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(32)
        
    }
}

#Preview {
    SuperHeroSearcher()
}
