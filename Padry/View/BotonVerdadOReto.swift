//
//  BotonVerdadOReto.swift
//  Padry
//
//  Created by Eduardo Ceron on 31/08/21.
//

import SwiftUI

struct BotonVerdadOReto: View {
    var body: some View {
        NavigationLink(destination: VistaVerdadoReto()){
                HStack(){
                    Image(systemName: "flame")
                        .font(.title)
                        .frame(width: 40, alignment: .center)
                        .foregroundColor(Color.green)
                        .padding(.horizontal, 12)
                        .brightness(/*@START_MENU_TOKEN@*/0.60/*@END_MENU_TOKEN@*/)
                        .shadow(color: .green, radius: 10)
                    Text("Verdad o Reto")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.green)
                        .brightness(/*@START_MENU_TOKEN@*/0.60/*@END_MENU_TOKEN@*/)
                        .shadow(color: .green, radius: 10)
                    Spacer()
                    Image(systemName: "chevron.forward.circle")
                        .font(.title)
                        .foregroundColor(Color.green)
                        .padding(12)
                        .brightness(/*@START_MENU_TOKEN@*/0.60/*@END_MENU_TOKEN@*/)
                        .shadow(color: .green, radius: 10)
                }
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 8).strokeBorder(Color.green, lineWidth: 3)
                ).padding(.horizontal, 18)
            //Analytics.logEvent("Juego Basta", parameters: ["message":"Abrió Basta"])
            /*Analytics.logEvent(AnalyticsEventScreenView,
             parameters: [AnalyticsParameterScreenName: "\(ContentView.self)",
             AnalyticsParameterScreenClass: "\(ContentView.self)"])*/
        }//: NavigationLink
    }
}

struct BotonVerdadOReto_Previews: PreviewProvider {
    static var previews: some View {
        BotonVerdadOReto()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
