//
//  IMCResult.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 12/6/24.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            Text("Tu resultado").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.white)
            InformationView(result: calculateImc(weight: userWeight, height: userHeight))
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundApp)
    }
}

func calculateImc(weight:Double, height:Double) -> Double{
    let result = weight / ((height/100) * (height/100))
    return result
}

struct InformationView:View {
    let result:Double
    var body: some View {
        let information = getImcResult(result: result)
        VStack{
            Spacer()
            Text(information.0).foregroundColor(information.2).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            Spacer()
            Text("\(result, specifier: "%.2f")").foregroundColor(.white).font(.system(size: 80)).bold()
            Spacer()
            Text(information.1).foregroundColor(.white).font(.title2).padding(8)
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundComponent).cornerRadius(16).padding(16)
    }
}

func getImcResult(result:Double)-> (String,String,Color){
    let title:String
    let description:String
    let color:Color
    
    switch result{
    case 0.00...19.99:
        title = "Peso Bajo"
        description = "Estás por debajo del peso recomendado según el IMC "
        color = Color.yellow
    case 20.00...24.99:
        title = "Peso Normal"
        description = "Estás en el peso recomendado según el IMC"
        color = Color.green
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estás por encima del peso recomendado según el IMC"
        color = Color.orange
    case 30.00...100.00:
        title = "Obesidad"
        description = "Estás muy por encima del peso recomendado según el IMC"
        color = Color.red
    default:
        title = "ERROR"
        description = "Ha ocurrido un error"
        color = Color.gray
    }
    return (title,description,color)
}

#Preview {
    IMCResult(userWeight:80,userHeight:180)
}
