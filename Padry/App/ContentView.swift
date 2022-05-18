//
//  ContentView.swift
//  Padry
//
//  Created by Eduardo Ceron on 29/07/21.
//

import SwiftUI
import Firebase
import GoogleMobileAds

struct ContentView: View {
    
    // esto lo puse para cambiar el color del navigationBarTitle
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
    }
    
    // MARK: - PROPERTIES
    
    @State var questionGame = QuestionGame()
    @State var warningAlert = !UserDefaults.standard.bool(forKey: "FirstStart")
    
    // MARK: - BODY
    
    var body: some View {
        ZStack{
            NavigationView{
                ZStack{
                    Color("ColorFondo")
                        .ignoresSafeArea()
                    VStack(spacing: 0){
                        
                        LogoYAjustes()
                        
                        Text("¡Escoge un juego para tomar!")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(color: .white, radius: 5)
                            .padding(.bottom, 25)
                        
                        ScrollView{
                            
                            BotonHappyKing()
                            BotonPreguntas()
                            BotonBasta()
                            BotonVerdadOReto()
                        }//: ScrollView
                        Spacer()
                        GADBannerViewController()
                            .frame(width: 320, height: 50, alignment: .center)
                    }//: VSTACK
                    .navigationBarTitle("", displayMode: .automatic)
                    .background(Color(red: 0.092, green: 0.106, blue: 0.14))
                    //.navigationBarHidden(true)
                    
                }//: ZStack
            }//: NavigationView
            .navigationViewStyle(StackNavigationViewStyle())
        }//: ZStack
        .alert(isPresented: $warningAlert, content: {
            
            Alert(title: Text("¡Advertencia!"),
                  message: Text("Si continuas aceptas que eres mayor de 18 años así como cualquier consecuencias que el uso del juego pueda ocasionar. El juego solo sugiere los castigos."),
                  dismissButton: Alert.Button.default(
                    Text("Continuar"), action: {
                    }
                  )
            )
        })//: .alert
    }//: some View
}//: struct ContentView

// MARK: - LogoYAjustes()
struct LogoYAjustes: View {
    @State var ajustes: Bool = false
    @State var sonidoToggle: Bool = true
    @State var notificationToggle: Bool = true
    var body: some View{
        HStack{
            Spacer()
                .toolbar{
                    ToolbarItem(placement: .principal){
                        HStack{
                            Image("padrink")
                                .resizable()
                                .scaledToFit()
                            Button(action: {
                                ajustes = true
                            }, label: {
                                Image(systemName: "wrench.and.screwdriver")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing)
                                    .foregroundColor(.green)
                                    .shadow(color: .green, radius: 10)
                            })
                            Button(action: {
                                shareApp()
                            }, label: {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing)
                                    .foregroundColor(.green)
                                    .shadow(color: .green, radius: 10)
                            })
                        }//: HStack
                    }//: ToolBarItem
                }//: ToolBar
            
        }
        // MARK: - SHEET SETTINGS
        .sheet(isPresented: $ajustes){
            SettingsView()
        }
    }
    // MARK: Func shareApp()
    func shareApp(){
        guard let url = URL(string: "http://itunes.apple.com/us/app/id323229106") else {return}
        let av = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}
//: MARK: - BotonHappyKing()
struct BotonHappyKing: View {
    var body: some View{
        NavigationLink(destination: VistaBaraja()){
            HStack{
                Image(systemName: "crown")
                    .font(.title)
                    .frame(width: 40, alignment: .center)
                    .foregroundColor(Color.green)
                    .padding(.horizontal, 12)
                    .brightness(/*@START_MENU_TOKEN@*/0.60/*@END_MENU_TOKEN@*/)
                    .shadow(color: .green, radius: 10)
                Text("Happy King")
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
            
            //Analytics.logEvent("Juego HappyKing", parameters: ["message":"Abrió HappyKing"])
            /*Analytics.logEvent(AnalyticsEventScreenView,
             parameters: [AnalyticsParameterScreenName: "\(ContentView.self)",
             AnalyticsParameterScreenClass: "\(ContentView.self)"])*/
        }//: NavigationLink
    }//: some View
}//: struct BotonHappyKing()

// MARK: - BotonPreguntas()
struct BotonPreguntas: View {
    var body: some View{
        NavigationLink(destination: VistaPregunta()){
            HStack{
                Image(systemName: "graduationcap")
                    .font(.title)
                    .frame(width: 40, alignment: .center)
                    .foregroundColor(Color.green)
                    .padding(.horizontal, 12)
                    .brightness(/*@START_MENU_TOKEN@*/0.60/*@END_MENU_TOKEN@*/)
                    .shadow(color: .green, radius: 10)
                Text("CiertOfalso")
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
            
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

// MARK: - GADBannerViewController

struct GADBannerViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)
        let viewControler = UIViewController()
        let testID = "ca-app-pub-3940256099942544/2934735716"
        //let realID = "ca-app-pub-8276758795635671/6809008515"
        
        // Banner Ad
        view.adUnitID = testID
        view.rootViewController = viewControler
        
        // View Controller
        viewControler.view.addSubview(view)
        viewControler.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        
        // Load an Ad
        view.load(GADRequest())
        
        return viewControler
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}


