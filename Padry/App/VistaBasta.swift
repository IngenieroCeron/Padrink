//
//  VistaBasta.swift
//  Padry
//
//  Created by Eduardo Ceron on 23/08/21.
//

import SwiftUI

let defaultTimeRemaining: CGFloat = 5
let lineWidth: CGFloat = 30
let radius: CGFloat = 50


struct VistaBasta: View {
    
    // MARK: - PROPERTIES
    
    @State private var imageV: String = "v.circle"
    @State private var isActive = false
    @State private var timeRemaining: CGFloat = defaultTimeRemaining
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var s6conds = S6conds()
    @State var textoCarta = "¡ Contesta en menos de 5 segundos o toma un trago !"
    @State var isReglasActive = false
    @AppStorage("sonidoToggle") var sonidoToggle: Bool = true
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("moradoClaro"), Color("ColorStrawberryDark")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                // MARK: - ENCABEZADO
                VStack{
                    HStack {
                        Image(systemName: "timer")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        Text("5 Segundos")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            isReglasActive = true
                        }, label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(.white)
                                .font(.title2)
                            Text("Reglas")
                             .foregroundColor(.white)
                             .font(.system(size: 22))
                        })
                    }
                    .padding(.top,8)
                    .padding(.horizontal)
                    
                    ZStack{
                        Color.white
                            .frame(height: 170)
                            .cornerRadius(12)
                        Text(textoCarta)
                            .font(.custom("Chalkboard", size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(red: 0.322, green: 0.182, blue: 0.429))
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                            .multilineTextAlignment(.center)
                            .padding(12)
                            .animation(.default)
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 45, trailing: 16))
                    
                    // MARK: - CONTADOR
                    
                    HStack{
                        ZStack {
                            Circle().strokeBorder(isActive ? Color("ColorFiestaLight") : Color("ColorLimeLight"), lineWidth: 1.9)
                                .frame(width: 82, height: 82)
                            VStack{
                                Image(systemName: isActive ? "pause.fill" : "play.fill")
                                    .foregroundColor(isActive ? Color("ColorFiestaLight") : Color("ColorLimeLight"))
                                    .font(.title2)
                                Text("\(isActive ? "Pausa" : "Inicia")")
                                    .foregroundColor(isActive ? Color("ColorFiestaLight") : Color("ColorLimeLight"))
                                    .font(.title2)
                            }
                            .onTapGesture(perform: {
                                isActive.toggle()
                                if sonidoToggle {
                                    if isActive {
                                    playSound(sound: "misc197", type: "mp3")
                                    }else {
                                        stopSound()
                                    }
                                }
                        })
                            
                        }//: ZSTACK INICIA
                        
                        ZStack {
                            Circle()
                                .stroke(Color.black.opacity(0.5), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                            Circle()
                                .trim(from: 0, to: 1 - ((defaultTimeRemaining - timeRemaining) / defaultTimeRemaining))
                                .stroke(timeRemaining > 3 ? Color("ColorLimeLight") : timeRemaining > 1 ? Color("ColorFiestaLight") : Color("ColorPicanteDark"), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                                .rotationEffect(.degrees(-90))
                                .animation(.easeInOut, value: 1)
                            Text("\(Int(timeRemaining))")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }.frame(width: radius * 2, height: radius * 2)
                            .padding()
                        ZStack {
                            Circle().strokeBorder(Color.white, lineWidth: 1.9)
                                .frame(width: 82, height: 82)
                            VStack{
                                Image(systemName: "backward.fill")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                Text("Reset")
                                    .foregroundColor(.white)
                                    .font(.title2)
                            }
                            .onTapGesture(perform: {
                                isActive = false
                                timeRemaining = defaultTimeRemaining
                                if sonidoToggle {
                                    playSound(sound: "sound-tap", type: "mp3")
                                }
                            })
                        }
                    }//: HSTACk de los 3 circulos
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(Color.white, lineWidth: 1.9)
                    )
                    
                    //MARK: - Siguiente pregunta
                    Button(action: {
                        textoCarta = s6conds.getTextoCarta()
                        s6conds.siguienteCarta()
                        if sonidoToggle {
                            playSound(sound: "sound-rise", type: "mp3")
                        }
                    }, label: {
                        
                        HStack {
                            Text("Siguiente carta")
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                            
                            Image(systemName: "chevron.forward")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(
                            Capsule().strokeBorder(Color.white, lineWidth: 1.9)
                        )
                    })
                        .padding(.top, 45)
                    
                    Spacer()
                    GADBannerViewController()
                        .frame(width: 320, height: 50, alignment: .center)
                }//: VStack
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .onAppear(perform: {
                    s6conds.carta.shuffle()
                })
                //MARK: - REGLAS
                if isReglasActive {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.black)
                        .opacity(0.7)
                        .ignoresSafeArea()
                    
                    
                    TabView{
                        
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]), startPoint: .top, endPoint: .bottom)
                                .cornerRadius(12)
                                .ignoresSafeArea()
                            VStack {
                                HStack{
                                    Text("Reglas")
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Button(action: {
                                        isReglasActive = false
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.white)
                                            .font(.title)
                                    })
                                }//: HSTACK
                                .padding(EdgeInsets(top: 12, leading: 12, bottom: 1, trailing: 12))
                                
                                HStack {
                                    Text("😈")
                                        .font(.system(size: 95))
                                        .padding(.leading, 2)
                                        .shadow(color: .white, radius: 8, x: 2, y: 2)
                                        
                                        
                                    Text("El jugador que tenga el celular lee en voz alta a cada jugador una carta.")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                }
                                Spacer()
                            }//: VSTACK
                        }//: ZSTACK
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]), startPoint: .top, endPoint: .bottom)
                                .cornerRadius(12)
                                .ignoresSafeArea()
                            VStack {
                                HStack{
                                    Text("Reglas")
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Button(action: {
                                        isReglasActive = false
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.white)
                                            .font(.title)
                                    })
                                }//: HSTACK
                                .padding(EdgeInsets(top: 12, leading: 12, bottom: 1, trailing: 12))
                                HStack {
                                    Text("😈")
                                        .font(.system(size: 95))
                                        .padding(.leading, 2)
                                        .shadow(color: .white, radius: 8, x: 2, y: 2)
                                        
                                        
                                    Text("Tan pronto como se lea la carta, se debe iniciar el conteo regresivo.")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                }
                                Spacer()
                            }//: VSTACK
                        }//: ZSTACK
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]), startPoint: .top, endPoint: .bottom)
                                .cornerRadius(12)
                                .ignoresSafeArea()
                            VStack {
                                HStack{
                                    Text("Reglas")
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Button(action: {
                                        isReglasActive = false
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.white)
                                            .font(.title)
                                    })
                                }//: HSTACK
                                .padding(EdgeInsets(top: 12, leading: 12, bottom: 1, trailing: 12))
                                HStack {
                                    Text("😈")
                                        .font(.system(size: 95))
                                        .padding(.leading, 2)
                                        .shadow(color: .white, radius: 8, x: 2, y: 2)
                                        
                                        
                                    Text("El jugador a responder tiene 5 segundos para contestar.")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                }
                                Spacer()
                            }//: VSTACK
                        }//: ZSTACK
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]), startPoint: .top, endPoint: .bottom)
                                .cornerRadius(12)
                                .ignoresSafeArea()
                            VStack {
                                HStack{
                                    Text("Reglas")
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Button(action: {
                                        isReglasActive = false
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.white)
                                            .font(.title)
                                    })
                                }//: HSTACK
                                .padding(EdgeInsets(top: 12, leading: 12, bottom: 1, trailing: 12))
                                HStack {
                                    Text("😈")
                                        .font(.system(size: 95))
                                        .padding(.leading, 2)
                                        .shadow(color: .white, radius: 8, x: 2, y: 2)
                                        
                                        
                                    Text("En caso de no contestar correctamente, el jugador deberá beber un trago.")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                }
                                Spacer()
                            }//: VSTACK
                        }//: ZSTACK
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 300)
                    .padding(.horizontal, 16)
                    
                }else{
                    EmptyView()
                }
            }//: ZStack
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
            //.ignoresSafeArea()
            .onReceive(timer, perform: { _ in
                guard isActive else { return }
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }else {
                    isActive = false
                    timeRemaining = defaultTimeRemaining
                }
            })
        }//: NavigationView
    }//: Some View
}//: struct VistaBasta()
// MARK: - PREVIEW
struct VistaBasta_Previews: PreviewProvider {
    static var previews: some View {
                VistaBasta()
    }
}
