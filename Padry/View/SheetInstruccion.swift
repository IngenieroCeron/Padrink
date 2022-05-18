//
//  SheetInstruccion.swift
//  Padry
//
//  Created by Eduardo Ceron on 10/09/21.
//

import SwiftUI

struct SheetInstruccion: View {
    var body: some View {
        ZStack(alignment: .top){
            LinearGradient(gradient: Gradient(colors: [Color("ColorPomegranateLight"), Color("ColorPomegranateDark")]), startPoint: .top, endPoint: .bottom)
            /*Image("fondoregla")
                .resizable()
                .scaledToFill()*/
            VStack{
                Capsule()
                    .fill()
                    .frame(width: 50, height: 5)
                    .padding(.top, 10.0)
                Divider().padding()
                Text("Instrucciones:")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .padding(.horizontal, 28.0)
                Divider()
                Text("Antes de iniciar, ten en cuenta que la reunión puede ponerse incómoda o rara ya que el contenido puede ser inapropiado, sin embargo te garantizamos diversión al máximo!\n1. Comienza girando la ruleta el jugador con menos edad.\n2. Al girar la ruleta te tocará alguna de las categorias que contiene el juego:\n  😈 'Picante': Contenido sexual.\n  🥳 'Fiesta': Contenido de alcohol.\n  😵‍💫 'Arevido': Contenido extremo.\n  🤡 'Comodín': Elije a un jugador y asignale un castigo.\n  🤢 'Virus': Todos deben beber.\n3. Una vez que giraste la ruleta y caiste en una de las categorias, debes escoger entre verdad o reto.\n4. Si prefieres no responder o no cumplir tu reto, bebe 3 tragos.")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .padding(.horizontal, 28.0)
                
            }//: VStack

        }//: ZStack
    }
}

struct SheetInstruccion_Previews: PreviewProvider {
    static var previews: some View {
        SheetInstruccion()
    }
}
