//
//  IMCView.swift
//  CursoIOS
//
//  Created by Rafael Barbeyto on 11/6/24.
//

import SwiftUI

struct IMCView: View {
    
    //init(){
    //    UINavigationBar.appearance()
    //        .titleTextAttributes = [.foregroundColor:UIColor.white]
    //}
    
    @State var gender: Int = 0
    @State var height: Double = 150
    @State var age: Int = 40
    @State var weight: Int = 50
    
    var body: some View {
        VStack{
            HStack{
                ToogleButton(texto: "Hombre", imageName: "heart.fill",gender: 0,selectedGender: $gender)
                ToogleButton(texto: "Mujer", imageName: "hurricane",gender: 1,selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(text: "Edad", selectedValue: $age)
                CounterButton(text: "Peso", selectedValue: $weight)
            }
            IMCCalculateButton(userWeight: Double(weight), userHeight: height)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
        .background(.backgroundApp)
        //.navigationBarBackButtonHidden()
        //.navigationTitle("IMC Calculator")
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("IMC Calculator").foregroundColor(.white)
            }
        }
    }
}

struct ToogleButton: View{
    
    let texto: String
    let imageName:String
    let gender:Int
    @Binding var selectedGender:Int
    
    var body: some View{
        let color = if(gender == selectedGender){
            Color.backgroundComponentSelected
        }else{
            Color.backgroundComponent
        }
        Button(action:{
            selectedGender = gender
        }){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                InformationText(text: texto)
            }.frame(maxWidth: .infinity,maxHeight: .infinity).background(color)
        }.cornerRadius(16)
    }
}

struct InformationText: View{
    let text:String
    var body: some View{
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleText: View{
    let text:String
    var body: some View{
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator:View {
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight ,in:100...220,step:1).accentColor(.purple).padding(.horizontal,16)
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundComponent).cornerRadius(16)
    }
}

struct CounterButton: View{
    
    let text:String
    @Binding var selectedValue:Int
    
    var body: some View{
        
        VStack{
            TitleText(text: text)
            InformationText(text: "\(selectedValue)")
            HStack{
                Button(action:{if(selectedValue > 0){selectedValue -= 1}}){
                    ZStack{
                        Circle()
                            .frame(width: 70,height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                    }
                }
                Button(action:{if(selectedValue < 400){selectedValue += 1}}){
                    ZStack{
                        Circle()
                            .frame(width: 70,height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                    }
                }
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundComponent).cornerRadius(16)
    }
}

struct IMCCalculateButton:View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        NavigationStack{
            NavigationLink(destination: {IMCResult(userWeight: userWeight, userHeight: userHeight)}){
                Text("Calcular").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.purple).frame(maxWidth: .infinity,maxHeight: 100).background(.backgroundComponent).cornerRadius(16)
            }

        }
    }
}

#Preview {
    IMCView()
}
