//
//  VistaPregunta.swift
//  Padry
//
//  Created by Eduardo Ceron on 29/07/21.
//

import SwiftUI

//esto es parte del codigo para agregar diferentes sheets a la pantalla
enum ResponseSheet: Identifiable{
    var id: Int{
        hashValue
    }
    case incorrect
    case correct
}

struct VistaPregunta: View {
    
    // MARK: - Properties
    
    @State private var questionText = "¡Empieza la bebedera! Toca el botón NEXT para iniciar"
    @State var questionGame = QuestionGame()
    @State private var nPregunta = "Pregunta 0 de 100"
    @State private var responseSheet: ResponseSheet?
    @State private var alertaState: Bool = false
    @AppStorage("sonidoToggle") var sonidoToggle: Bool = true
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack{// este vstack es el de toda la pantalla
                    VStack{// este vstack solo contiene no. de pregunta y pregunta
                        Text(nPregunta)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                            .padding(.bottom, 8)
                        
                        //: MARK: - TEXTO PREGUNTA
                        
                        Text(questionText)
                            .font(.custom("Chalkboard", size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(red: 0.322, green: 0.182, blue: 0.429))
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                            .multilineTextAlignment(.leading)
                            .animation(.default)
                            .padding(.horizontal, 8)
                            .padding(.bottom, 10)
                        
                        Text("¿ Cierto o Falso ?")
                            .font(.custom("Chalkboard", size: 25))
                            .foregroundColor(.white)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    }
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    Spacer()
                    
                    //: MARK: - BOTON CIERTO-FALSO
                    
                    ZStack(alignment: .top){
                        Image("ciertofalso")
                            .resizable()
                            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        HStack(spacing: 80){
                            
                            //: MARK: - Boton Cierto
                            
                            Button(action: {
                                let userAnswer = "c"
                                let userGotItRight = questionGame.checkAnswer(userAnswer)
                                if userGotItRight{
                                    responseSheet = .correct
                                    if sonidoToggle {
                                        playSound(sound: "winquestion3", type: "mpeg")
                                    }else{
                                        print("el sonidoToggle es \(sonidoToggle)")
                                    }
                                } else{
                                    responseSheet = .incorrect
                                    if sonidoToggle {
                                        playSound(sound: "losequestion1", type: "mpeg")
                                    } else {
                                        print("el sonidoToggle es \(sonidoToggle)")
                                    }
                                    
                                }
                            }, label: {
                                Text("")
                                    .fontWeight(.bold)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                                    .padding()
                                    .frame(width: 100, height: 80)
                            })
                            //       AQUI TERMINA BOTON CIERTO
                            
                            //: MARK: - Boton Falso
                            
                            Button(action: {
                                let userAnswer = "f"
                                let userGotItRight = questionGame.checkAnswer(userAnswer)
                                if userGotItRight{
                                    responseSheet = .correct
                                    if sonidoToggle {
                                        playSound(sound: "winquestion3", type: "mpeg")
                                    }else{
                                        print("el sonidoToggle es \(sonidoToggle)")
                                    }
                                    
                                } else{
                                    responseSheet = .incorrect
                                    if sonidoToggle {
                                        playSound(sound: "losequestion1", type: "mpeg")
                                    } else {
                                        print("el sonidoToggle es \(sonidoToggle)")
                                    }
                                    
                                }
                            }, label: {
                                Text("")
                                    .fontWeight(.bold)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                                    .padding()
                                    .frame(width: 100, height: 80)
                            })
                            
                            //      AQUI TERMINA EL BOTON DE FALSO
                            
                        }
                    }
                    Divider()
                        .padding(.top, 10.0)
                    
                    //: MARK: - BOTON NEXT
                    
                    Button(action: {
                        nPregunta = "Pregunta \(questionGame.questionNumber+1) de \(questionGame.quiz.count)"
                        questionText = questionGame.getQuestionText()
                        questionGame.nextQuestion()
                        if sonidoToggle {
                            playSound(sound: "nextQuestion1", type: "mpeg")
                        } else {
                            print("el sonidoToggle es \(sonidoToggle)")
                        }
                        
                        alertaState = questionGame.alerta
                    }, label: {
                        HStack {
                            Text("NEXT")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Image(systemName: "arrow.right.circle")
                                .imageScale(.large)
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .background(
                            Capsule().strokeBorder(Color.white, lineWidth: 1.9)
                        )
                    })
                        Spacer()
                }//: VStack
            }//: ZStack
            .navigationBarHidden(true)
            .ignoresSafeArea()
            //: MARK: - SHEET
            .sheet(item: $responseSheet) { item in
                switch item{
                case .correct:
                    CorrectSheet()
                case .incorrect:
                    IncorrectSheet()
                }
                
                
                //Image(systemName: "bubble.middle.bottom.fill")
                //Image(systemName: "envelope.open")
                //Image(systemName: "cross.circle.fill")
                //face.smiling.fill
                //hand.point.down.fill
            }
            //: MARK: - ALERT
            .alert(isPresented: $alertaState, content: {
                Alert(title: Text("Hazte Premium"),
                      message: Text("Se terminaron las preguntas en modo gratuito, si quieres desbloquear mas preguntas, cámbiate a Premium"),
                      primaryButton: .default(Text("Premium"),
                                                          action: {
                                                            print("Premium")
                                                          }),
                      secondaryButton: .destructive(Text("Cancelar")))
        })
        }
    }
}
//: MARK: - CORRECTSHEET
struct CorrectSheet: View {
    var body: some View{
        ZStack(alignment: .top){
            Color(#colorLiteral(red: 0.007016293239, green: 0.947532475, blue: 0.6293538213, alpha: 1))
                .ignoresSafeArea()
            VStack{
                Capsule()
                    .fill()
                    .frame(width: 50, height: 5)
                    .padding(.top, 10.0)
                Divider().padding()
                Text("¡Has Acertado!")
                    .font(.custom("Chalkboard", size: 40))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Text("🥳")
                    .font(.system(size: 150))
                Image(systemName: "bubble.middle.bottom.fill")
                    .resizable()
                    .frame(width: 300, height: 230)
                    .foregroundColor(.white)
                    .overlay(Text("¡Puedes repartir un tragote a tu peor enemigo!")
                                .font(.custom("Chalkboard", size: 30))
                                .font(.system(size: 30))
                                .multilineTextAlignment(.center)
                                .shadow(color: .gray, radius: 10)
                                .padding()
                             , alignment: .top)
                
                Image(systemName: "envelope.open")
                    .resizable()
                    .frame(width: 70, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }
        }
    }
}
//: MARK: - INCORRECTSHEET
struct IncorrectSheet: View {
    @State var questionGame = QuestionGame()
    var body: some View{
        ZStack(alignment: .top){
            Color(#colorLiteral(red: 0.9856187701, green: 0.3193172514, blue: 0.5197512507, alpha: 1))
                .ignoresSafeArea()
            VStack{
                Capsule()
                    .fill()
                    .frame(width: 50, height: 5)
                    .padding(.top, 10.0)
                Divider().padding()
                Text("¡Fallaste!")
                    .font(.custom("Chalkboard", size: 40))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Text("😒")
                    .font(.system(size: 150))
                
                Image(systemName: "bubble.middle.bottom.fill")
                    .resizable()
                    .frame(width: 300, height: 265)
                    .foregroundColor(.white)
                    .overlay(Text(questionGame.retos.randomElement()!)
                                .font(.custom("Chalkboard", size: 30))
                                .font(.system(size: 30))
                                .multilineTextAlignment(.center)
                                .shadow(color: .gray, radius: 10)
                                .padding()
                             , alignment: .top)
                
                Image(systemName: "envelope.open")
                    .resizable()
                    .frame(width: 70, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }
        }
    }
}
//: MARK: - PREVIEW
struct VistaPregunta_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VistaPregunta()
        }
        
        
    }
}


