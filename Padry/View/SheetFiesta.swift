//
//  SheetFiesta.swift
//  Padry
//
//  Created by Eduardo Ceron on 08/09/21.
//

import SwiftUI

struct SheetFiesta: View {
    
    @State private var verdadReto = "¿?"
    @State var verdadRetoData = VerdadRetoData()
    @AppStorage("sonidoToggle") var sonidoToggle: Bool = true
    
    var body: some View {
        // MARK: - BOTON VERDAD
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Capsule()
                    .fill()
                    .frame(width: 50, height: 5)
                    .padding(.top, 10.0)
                Text("¡Fiesta!")
                    .font(.custom("Chalkboard", size: 35))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                Text("🥳")
                    .font(.system(size: 120))
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                Image(systemName: "bubble.middle.top.fill")
                    .resizable()
                    .frame(width: 280, height: 80)
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
                    .overlay(Text("¿Verdad o Reto?")
                                .font(.custom("Chalkboard", size: 30))
                                .shadow(color: .gray, radius: 10))
                             //, alignment: .center)
                Divider()
                HStack{
                    Button(action: {
                        verdadReto = (verdadRetoData.verdadFiesta.randomElement()!)
                        if sonidoToggle {
                            playSound(sound: "sound-tap", type: "mp3")
                        }
                    }, label: {
                        HStack {
                            Text("VERDAD")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            /*Image(systemName: "arrow.right.circle")
                             .imageScale(.large)
                             .font(.title)
                             .foregroundColor(.white)*/
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .background(
                            Capsule().strokeBorder(Color.white, lineWidth: 3)
                        )
                    })//: BOTON VERDAD
                    
                    // MARK: - BOTON RETO
                    
                    Button(action: {
                        verdadReto = (verdadRetoData.retoFiesta.randomElement()!)
                        if sonidoToggle {
                            playSound(sound: "sound-tap", type: "mp3")
                        }
                    }, label: {
                        HStack {
                            Text("RETO")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            /*Image(systemName: "arrow.right.circle")
                             .imageScale(.large)
                             .font(.title)
                             .foregroundColor(.white)*/
                        }
                        .padding(.horizontal, 45)
                        .padding(.vertical, 10)
                        .background(
                            Capsule().strokeBorder(Color.white, lineWidth: 3)
                        )
                    })//: BOTON RETO
                }//: HStack Botones
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .padding()
                        .foregroundColor(.black).opacity(0.4)
                    Text(verdadReto)
                        .font(.custom("Chalkboard", size: 27))
                        .fontWeight(.heavy)
                        .padding(45)
                        .foregroundColor(.white)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        .multilineTextAlignment(.center)
                        
                        .animation(.default)
                }
                Spacer()
                
            }//: VStack
        }//: ZStack
        
    }//: some View
}//: Struct

struct SheetFiesta_Previews: PreviewProvider {
    static var previews: some View {
        SheetFiesta()
    }
}
