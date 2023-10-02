//
//  ContentView.swift
//  IMC
//
//  Created by StudentBackup01 on 21/09/23.
//

import SwiftUI

struct ContentView: View {
        @State private var peso: String = ""
        @State private var alt: String = ""
        @State private var status: String = ""
        @State private var colores: String = "blue"
        var body: some View {
            VStack{
                Text("Calculadora de IMC")
                Spacer().frame(height: 20)
                
                VStack{
                    TextField("Peso (kg)",text: $peso).frame(width: 100)
                }.frame(width: 350).background(Color.white).cornerRadius(4)
                
                Spacer().frame(height: 20)
                
                VStack{
                    TextField("Altura (m)",text: $alt).frame(width: 100)
                }.frame(width:350).background(Color.white).cornerRadius(4)
                
                Spacer().frame(height: 20)
                
                Button("Calcular"){
                    var peso = Double(peso) ?? 0
                    var alt = Double(alt) ?? 0
                    
                    var imc = peso / (alt*alt)
                    
                    if imc<=18.5 {
                        status="Abaixo do peso"
                        colores="verde1"
                    }else if imc>18.5 && imc<=24.9{
                        status="Normal"
                        colores="verde2"
                    }else if imc>25 && imc<=29.9{
                        status="Sobrepeso"
                        colores="amarelo"
                    }else{
                        status="Obesidade"
                        colores="laranja"
                    }
                    
                }.padding(8).background(Color.blue).foregroundColor(Color.white).cornerRadius(4)
                Spacer()
                
                Text(status).foregroundColor(Color.white).bold()
                
                
                VStack{
                    Spacer().frame(height: 170)
                    Image("tabela-IMC").resizable().scaledToFit()
                }
                
            }.background(Color(colores))
            
        }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
