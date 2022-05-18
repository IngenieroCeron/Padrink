//
//  VistaBaraja.swift
//  Padry
//
//  Created by Eduardo Ceron on 29/07/21.
//

import SwiftUI

struct VistaBaraja: View {
    
    // MARK: - PROPERTIES
    
    @State var cardImage = "back"
    @State var cardText = "¡Empieza el juego!"
    @State var ruleText = "Por turnos, cada jugador debe sacar una carta"
    @State private var instruccion: Bool = false
    @State var cardGame = CardGame()
    @AppStorage("sonidoToggle") var sonidoToggle: Bool = true
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
        
        // MARK: - ZSTACK VISTABARAJA
        
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("ColorLimeLight"), Color("ColorLimeDark")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                // MARK: - VSTACK Corona y nombre
                
                VStack{
                    Spacer()
                    HStack(spacing: 20) {
                        
                        Image(systemName: "crown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        Text("HappyKing")
                            .font(.custom("Chalkboard", size: 35))
                            .fontWeight(.heavy)
                            .scaleEffect(1)
                            .foregroundColor(.white)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        //.shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                    }
                    
                    Spacer()
                    
                    // MARK: - VSTACK CARTA, JUEGO E INSTRUCCION
                    
                    VStack(spacing: 15.0){
                        Image(cardImage)
                            .resizable()
                            .frame(width: 160, height: 230, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            //.shadow(color: .white, radius: 10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                            .animation(.interpolatingSpring(stiffness: 100, damping: 1))
                        Text(cardText)
                            .font(.custom("Chalkboard", size: 32))
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                            .padding(25.0)
                            .animation(.default)
                        Button(action: {
                            instruccion = true
                        }, label: {
                            Capsule().stroke(Color.white, lineWidth: 1.9)
                                .frame(width: 160, height: 40)
                                .overlay(Text("¿Cómo se juega?")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white))
                        })
                    }//: VStack (CardImage, cardText y Boton instrucción)
                    Spacer()
                    
                    // MARK: - BOTON NEXT
                    
                    Button(action: {
                        
                        cardImage = cardGame.getCard()
                        cardText = cardGame.getGame()
                        ruleText = cardGame.getRule()
                        cardGame.nextCard()
                        if sonidoToggle {
                            playSound(sound: "nextcard1", type: "mpeg")
                        } else {
                            print("\(sonidoToggle)")
                        }
                        
                    }, label: {
                        Image("Next")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    })
                    Spacer()
                    //MARK: - Anuncio
                    GADBannerViewController()
                        .frame(width: 320, height: 50, alignment: .center)
                }//: VStack
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.top)
                .onAppear(perform: {
                    cardGame.cartas.shuffle()
                })
            }//: ZStack
        }//: NAVIGATIONVIEW
            // MARK: - Sheet INSTRUCCIONES
            .sheet(isPresented: $instruccion,
                   onDismiss: {instruccion = false},
                   content: {
                    ZStack(alignment: .top){
                        LinearGradient(gradient: Gradient(colors: [Color("ColorPomegranateLight"), Color("ColorPomegranateDark")]), startPoint: .top, endPoint: .bottom)
                        VStack{
                            Capsule()
                                .fill()
                                .frame(width: 50, height: 5)
                                .padding(.top, 10.0)
                            Divider().padding()
                            Image(systemName: "paperclip")
                                .resizable()
                                .frame(width: 65, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                            Text(ruleText)
                                .font(.custom("Chalkboard", size: 30))
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(.center)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                                .padding(.horizontal, 28.0)
                            
                        }//: VStack

                    }//: ZStack
               })//: .sheet
        //}//: NavigationView
    }//: Some View
}//: Struct VistaBaraja()

struct VistaBaraja_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        VistaBaraja()
        }
    }
}
