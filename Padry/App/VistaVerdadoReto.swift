//
//  VistaVerdadoReto.swift
//  Padry
//
//  Created by Eduardo Ceron on 31/08/21.
//

import SwiftUI
enum CategorySheet: Identifiable{
    var id: Int{
        hashValue
    }
    case instruccion
    case fiesta
    case picante
    case atrevido
}
struct VistaVerdadoReto: View {
    
    // MARK: - PROPERTIES
    
    @State private var degrees = 0.0
    @State private var categorySheet: CategorySheet?
    @State private var categoria = "Gira la Ruleta"
    private let comodin = "Comodín: Elije a un jugador y asignale un reto o una verdad"
    private let virus = "¡ VIRUS !\nTodos toman"
    @State var warningAlert = !UserDefaults.standard.bool(forKey: "FirstStart")
    @State private var instruccion: Bool = false
    @AppStorage("sonidoToggle") var sonidoToggle: Bool = true
    
    // MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("dark-cian")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                        Button(action: {
                                instruccion = true
                            }, label: {
                                HStack {
                                    Image(systemName: "info.circle")
                                        .imageScale(.small)
                                     .font(.title)
                                     .foregroundColor(.white)
                                    Text("Instrucciones")
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                }
                                .padding(8)
                                .background(
                                    Capsule().strokeBorder(Color.white, lineWidth: 1.9)
                                )
                        })
                    Text("¿Verdad o Reto?")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        .padding(.bottom, 10)
                    
                    Text("¡Toca la ruleta y mira que categoria te toca!")
                        .font(.system(size: 30))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    
                    Divider()
                    
                    // MARK: - BOTON GIRA
                    
                    ZStack {
                        Image("Ruleta")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 340)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                            .offset(x:0.9,y:17)
                        Button(action: {
                            
                            let d = Double.random(in: 1440...3240)
                            let baseAnimation =
                                Animation.easeInOut(duration: 4)
                            withAnimation (baseAnimation) {
                                self.degrees += d
                            }
                            let deg = 360 - degrees.truncatingRemainder(dividingBy: 360)
                            
                            if sonidoToggle {
                                playSound(sound: "spin", type: "mp3")
                            }
                            
                            switch deg {
                            case 0...45:
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                    categoria = virus
                                }
                            case 45.01...90:
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    categoria = "¡ PICANTE !"
                                    categorySheet = .picante
                                }
                            case 90.01...135:
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    categoria = "¡ ATREVIDO !"
                                    categorySheet = .atrevido
                                }
                            case 13.01...180:
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    categoria = "¡ FIESTA !"
                                    categorySheet = .fiesta
                                }
                            case 180.01...225:
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                categoria = comodin
                                }
                            case 225.01...270:
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    categoria = "Picante"
                                    categorySheet = .picante
                                }
                            case 270.01...315:
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    categoria = "Atrevido"
                                    categorySheet = .atrevido
                                }
                            case 315.01...360:
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    categoria = "Fiesta"
                                    categorySheet = .fiesta
                                }
                            default :
                                print("Error de grados")
                            }
                        }, label: {
                            Image(systemName: "arrow.forward.circle.fill")
                                .resizable()
                                .frame(width: 98.0, height: 98.0)
                                .foregroundColor(Color(#colorLiteral(red: 0.188906461, green: 0.1663666666, blue: 0.5175268054, alpha: 1)))
                                .rotationEffect(.degrees(degrees))
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    })
                    }//: ZStack Ruleta
                    
                    Divider()//.padding()
                    // MARK: - Texto debajo de la ruleta
                    Text(categoria)
                        .font(.system(size: 30))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        .padding(.horizontal, 8)
                    
                    Spacer()
                    // MARK: - BANNER
                    GADBannerViewController()
                        .frame(width: 320, height: 50, alignment: .center)
                        .padding(.bottom, 10)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
            }//: ZSTACK
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .alert(isPresented: $warningAlert, content: {
                
                Alert(title: Text("¡Advertencia!"),
                      message: Text("Este juego puede contener lenguaje sexual y/o ilícito no apto para menores de 18 años de edad. Las preguntas y retos son sugeridos, el juego no te obliga a nada."),
                      dismissButton: Alert.Button.default(
                                              Text("Aceptar"), action: {
                                            }
                                          )
                )
            })//: .alert
        }//: NavigationView
        // MARK: - ALERTA
        
        // MARK: - SHEETS
        .sheet(item: $categorySheet) { item in
            switch item{
            case .instruccion:
                SheetInstruccion()
            case .fiesta:
                SheetFiesta()
            case .picante:
                SheetPicante()
            case .atrevido:
                SheetAtrevido()
            }
            
        }//: Sheet
        .sheet(isPresented: $instruccion, onDismiss: {instruccion = false}, content: {
            SheetInstruccion()
        })
    }//: some View
}//: Struct

// MARK: - PREVIEW

struct VistaVerdadoReto_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                VistaVerdadoReto()
                VistaVerdadoReto()
                .previewDevice("iPhone 8 Plus")
        }
    }
}

/*
 VStack(spacing: -5){
     Text("🤪")
         .font(.system(size: 120))
 Image(systemName: "bubble.middle.top.fill")
     .resizable()
     .frame(width: 300, height: 300)
     .foregroundColor(.white)
     .overlay(Text("Por turnos, cada jugador debe elegir ¿verdad o reto?\n!Que empiece el mas borracho!")
                 .font(.custom("Chalkboard", size: 30))
                 .font(.system(size: 30))
                 .multilineTextAlignment(.center)
                 .shadow(color: .gray, radius: 10)
                 .padding()
              , alignment: .bottom)
 
 }
 */


/*
 // MARK: - BOTON VERDAD
 HStack{
     Button(action: {
         
     }, label: {
         HStack {
             Text("VERDAD")
                 .font(.title)
                 .foregroundColor(.white)
             /*Image(systemName: "arrow.right.circle")
              .imageScale(.large)
              .font(.title)
              .foregroundColor(.white)*/
         }
         .padding(.horizontal, 25)
         .padding(.vertical, 10)
         .background(
             Capsule().strokeBorder(Color.white, lineWidth: 1.9)
         )
     })//: BOTON VERDAD
     
     // MARK: - BOTON RETO
     
     Button(action: {
         
     }, label: {
         HStack {
             Text("RETO")
                 .font(.title)
                 .foregroundColor(.white)
             /*Image(systemName: "arrow.right.circle")
              .imageScale(.large)
              .font(.title)
              .foregroundColor(.white)*/
         }
         .padding(.horizontal, 45)
         .padding(.vertical, 10)
         .background(
             Capsule().strokeBorder(Color.white, lineWidth: 1.9)
         )
     })//: BOTON RETO
 }//: HStack Botones
 */
