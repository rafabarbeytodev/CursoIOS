//
//  SuperHeroDetail.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 13/6/24.
//

import SwiftUI

struct SuperHeroDetail: View {
    let id:String
    
    @State var superhero:ApiNetwork.SuperHeroDetail? = nil
    @State var loading:Bool = true
    
    var body: some View {
        VStack{
            if loading{
                ProgressView().tint(.white)
            }else if let superhero = superhero{
                Text(superhero.name).bold().font(.title).foregroundColor(.white)
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

#Preview {
    SuperHeroDetail(id:"202")
}
