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
    
    @State var superhero:ApiNetwork.SuperHeroDetail? = nil
    @State var loading:Bool = true
    
    var body: some View {
        VStack{
            if loading{
                ProgressView().tint(.white)
            }else if let superhero = superhero{
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
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundApp)
            .onAppear{
                Task{
                    do{
                        superhero = try await ApiNetwork().getHeroeByID(id:id)
                    }catch{
                        superhero = nil
                    }
                    loading = false
                }
            }
    }
}

struct PowerSuperHeroStats:View {
    let stats:ApiNetwork.Powerstats
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

#Preview {
    SuperHeroDetail(id:"204")
}

