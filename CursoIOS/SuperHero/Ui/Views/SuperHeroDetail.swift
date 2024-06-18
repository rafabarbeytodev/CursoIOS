//
//  SuperHeroDetail.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 13/6/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperHeroDetail: View {
    
    let id:String
    
    @Environment(SuperHeroeDetailViewModel.self) var superHeroDetailVM
    
    var body: some View {
        VStack{
            if superHeroDetailVM.loading{
                ProgressView().tint(.white)
            }else{
                let superhero = superHeroDetailVM.superHeroeDetail
                if superhero.id != ""{
                    WebImage(url:URL(string: superhero.image.url))
                        .resizable()
                        .scaledToFill()
                        .frame(maxHeight: 250)
                        .clipped()
                    Text(superhero.name).bold().font(.title).foregroundColor(.white)
                    ForEach(superhero.biography.aliases,id: \.self){ alias in
                        Text(alias).foregroundColor(.gray).italic()
                    }
                    PowerSuperHeroStats(stats: superhero.powerstats)
                    Spacer()
                    
                }else{
                    Text("ERROR EN LA OBTENCION DE DATOS").bold().font(.title).foregroundColor(.white)
                }
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundApp)
            .onAppear{
                superHeroDetailVM.getHeroeById(id: id)
            }
    }
}

struct PowerSuperHeroStats:View {
    let stats:SuperHeroeDetailEntity.Powerstats
    var body: some View {
        VStack{
            Chart{
                SectorMark(angle:.value("Count",Int(stats.combat) ?? 0),
                           innerRadius: .ratio(0.6), //grosor
                           angularInset: 3 //separacion entre datos
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category","Combat"))
                SectorMark(angle:.value("Count",Int(stats.durability) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 3).cornerRadius(5)
                    .foregroundStyle(by: .value("Category","Durability"))
                SectorMark(angle:.value("Count",Int(stats.power) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 3).cornerRadius(5)
                    .foregroundStyle(by: .value("Category","Power"))
                SectorMark(angle:.value("Count",Int(stats.intelligence) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 3).cornerRadius(5)
                    .foregroundStyle(by: .value("Category","Intelligence"))
                SectorMark(angle:.value("Count",Int(stats.speed) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 3).cornerRadius(5)
                    .foregroundStyle(by: .value("Category","Speed"))
                SectorMark(angle:.value("Count",Int(stats.strength) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 3).cornerRadius(5)
                    .foregroundStyle(by: .value("Category","Strength"))
            }
        }.padding(16).frame(maxWidth: .infinity,maxHeight: 350).background(.white).cornerRadius(16).padding(24)
    }
}

struct SuperHeroDetail_Previews: PreviewProvider {
    static var previews: some View {
        let useCaseDetail = MockGetHeroeByIDUseCase()
        let viewModel = SuperHeroeDetailViewModel(getHeroeByIdUseCase: useCaseDetail) // Aquí inicializas tu viewModel como lo hagas en tu aplicación
        return SuperHeroDetail(id: "130")
            .environment(viewModel)
    }
}



