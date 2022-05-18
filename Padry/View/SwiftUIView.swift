//
//  SwiftUIView.swift
//  Padry
//
//  Created by Eduardo Ceron on 01/09/21.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var degrees = 0.0
    

    var body: some View {
        let deg = 360 - degrees.truncatingRemainder(dividingBy: 360)
        VStack {
            VStack{
                
                Button(action: {
                    
                    let d = Double.random(in: 720...2160)
                    let baseAnimation =
                        Animation.easeInOut(duration: 3.5)
                    withAnimation (baseAnimation) {
                        self.degrees += d
                    }
                }, label: {
                    Image(systemName: "arrow.forward.circle.fill")
                        .resizable()
                        .frame(width: 80.0, height: 80.0)
                        .rotationEffect(.degrees(degrees))
                })
                Text("\(deg)")
            }
            
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

