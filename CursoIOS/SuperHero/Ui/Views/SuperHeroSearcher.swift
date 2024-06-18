//
//  SuperHeroSearcher.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 12/6/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {
    
    @Environment(SuperHeroesViewModel.self) var superHeroVM
    @State var superheroname: String = ""
        
    var body: some View {
        
        VStack{
            TextField("", text: $superheroname, prompt: Text("SuperHero....").font(.title2).bold().foregroundColor(.gray))
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(16)
                .border(Color.purple, width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    superHeroVM.getHeroesByQuery(query: superheroname)
                }
            if superHeroVM.loading{
                ProgressView().tint(.white)
            }
            NavigationStack{
                List{
                    ForEach(superHeroVM.superHeroes.results){ superhero in
                        ZStack{
                            SuperHeroItem(superhero: superhero)
                            NavigationLink(destination: SuperHeroDetail(id:superhero.id)){EmptyView()}.opacity(0)
                        }.listRowBackground(Color.backgroundApp)
                    }.listStyle(.plain)
                }
            }
                Spacer()
        }.frame(maxWidth:.infinity,maxHeight:.infinity).background(.backgroundApp)
    }
}

struct SuperHeroItem: View {
    let superhero: SuperHeroesEntity.SuperHero
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

struct SuperHeroSearcher_Previews: PreviewProvider {
    static var previews: some View {
        let useCase = MockGetHeroesByQueryUseCase()
        let viewModel = SuperHeroesViewModel(getHeroesByQueryUseCase: useCase) // Aquí inicializas tu viewModel como lo hagas en tu aplicación
        return SuperHeroSearcher()
            .environment(viewModel)
    }
}
