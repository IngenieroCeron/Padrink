//
//  SettingsView.swift
//  Padry
//
//  Created by Eduardo Ceron on 23/08/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isPremium") var isPremium: Bool = false
    @AppStorage("sonidoToggle") var sonidoToggle: Bool = true
    @AppStorage("notificationToggle") var notificationToggle: Bool = true
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    // MARK: - SECTION 1
                    
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "PaDrink", labelImage: "info.circle")
                    ) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("PaDrink es una apliación de entretenimiento para personas mayores de 18 años que quieran divertirse en cualquier tipo de reunión. La App no se responsabiliza de cualquier consecuencia que la app pueda generar.")
                                .font(.footnote)
                        }
                    }
                    
                    // MARK: - SECTION 2
                    
                    GroupBox(
                        label: SettingsLabelView(labelText: "Hazte Premium", labelImage: "burst")
                    ) {
                        Divider().padding(.vertical, 4)
                        Text("'PROXIMAMENTE'  Por solo $69.00 MXN podras disfrutar los beneficios Premium los cuales son:\n1. Desbloquear 250 cartas en CiertOfalso.\n2. Desbloquear 100 cartas en 6segundos.\n3. Eliminar todos los molestos anuncios.\nAsí como tener acceso premium a todos los futuros juegos que se irán agregando a la aplicación.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Toggle(isOn: $isPremium){
                            if isPremium {
                                Text("Ya eres Premium".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Premium".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    
                    // MARK: - SECTION 3
                    
                    GroupBox(
                        label: SettingsLabelView(labelText: "Personaliza", labelImage: "slider.horizontal.3")
                    ) {
                        Divider().padding(.vertical, 4)
                
                        Toggle(isOn: $sonidoToggle){
                            if sonidoToggle {
                                Text("Sonido Encendido".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Sonido Apagado".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                        Toggle(isOn: $notificationToggle){
                            if notificationToggle {
                                Text("Notificaciones".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Notificaciones".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    
                    // MARK: - SECTION 4
                    
                    GroupBox(
                        label: SettingsLabelView(labelText: "App", labelImage: "apps.iphone")
                    ) {
                        SettingsRowView(name: "Desarrollo y Diseño", content: "Ing. Ceron")
                        
                        // Califícanos
                        VStack {
                            Divider().padding(.vertical, 4)
                            HStack {
                                Text("Califícanos").foregroundColor(.gray)
                                Spacer()
                                //Poner el link de mi app cuando la suba
                                    Link("App Store", destination: URL(string: "http://itunes.apple.com/us/app/id323229106")!)
                                    Image(systemName: "star.square").foregroundColor(.blue)
                            }//: HStack
                        }//: VStack
                        //: Califícanos
                        
                        
                        // Contáctame
                        VStack {
                            Divider().padding(.vertical, 4)
                            Button(action: {
                                let whatsLink = "https://wa.me/525562036344"
                                let whatsUrl = URL(string: whatsLink)!
                                if UIApplication.shared.canOpenURL(whatsUrl)
                                {
                                    UIApplication.shared.open(whatsUrl)
                                } else {
                                   return
                                }
                            }, label: {
                                HStack{
                                Text("Contáctame")
                                    .foregroundColor(.gray)
                                    Spacer()
                                    Text("WhatsApp")
                                Image(systemName: "message")
                                    .foregroundColor(.green)
                                }
                        })
                        }//: Contáctame
                        
                        //SettingsRowView(name: "Website", linkLabel: "Satelapps.com", linkDestination: "swiftuimasterclass.com")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.0")
                    }
                    
                }//: VStack
                .navigationBarTitle(Text("Ajustes"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            }//: ScrollView
        }//: NavigationView
    }
}
// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
