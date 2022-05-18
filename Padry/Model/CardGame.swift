//
//  CardGame.swift
//  Padry
//
//  Created by Eduardo Ceron on 29/07/21.
//

import Foundation
import SwiftUI
import GoogleMobileAds

struct CardGame {
    var cartas = [
        Card(c: "card14", g: "Todos Toman", r: "Todos los jugadores deberán beber un trago"),
        Card(c: "card2", g:"Cascada", r: "Todos a beber!! Tu puedes parar cuando quieras. Los demás no pueden parar de beber hasta que el jugador de la derecha pare"),
        Card(c: "card3", g:"Palabra Prohibida", r: "Elije una palabra y nadie podrá decirla durante 2 rondas, el/los jugador/es que la digan deberán beber un trago. "),
        Card(c: "card4", g:"Dedo Master", r: "Tu eres el dedo maestro! Pon el dedo sobre la mesa cuando tu quieras, el utimo en ponerlo bebe"),
        Card(c: "card5", g:"Caricachupas", r: "Di una categoría (ejemplo: películas) y todos por turnos deben decir una palabra de dicha categoría. Quien tarde o repita debe beber"),
        Card(c: "card6", g:"Yo Nunca Nunca", r: "Di una frase que empiece con yo nunca nunca... El que lo haya hecho, bebe!"),
        Card(c: "card7", g:"7 Loco", r: "Hacia la derecha, los jugadores deben ir contando (1,2,3...) Si el número contiene un 7 o es multiplo de 7, el jugador debe aplaudir y cambiará el sentido del conteo. El que se equivoca debe tomar. Parte el que sacó la carta"),
        Card(c: "card8", g:"Historia", r: "El jugador en turno debe decir una palabra, el siguiente jugador debe copiar la palabra y agregar una palabra nueva. Esto continua de la misma manera hasta que alguien no recuerde alguna de las palabras mencionadas."),
        Card(c: "card9", g:"Espejo", r: "Elije a un jugador para que sea tu espejo, y por el resto del juego esa persona beberá cuando tu bebas"),
        Card(c: "card10", g:"Pregunta Pregunta", r: "Haz una pregunta a un jugador, y este debe responder a alguien más con otra pregunta, el primero en fallar bebe"),
        Card(c: "card11", g:"Juego de Rimas", r: "Di una palabra y por turnos todos deben decir otra que rime con la anterior, quien tarde o repita debe beber"),
        Card(c: "card12", g:"Regla", r: "Si se rompe bebes! Las normas anteriores se pueden eliminar o acumular, la elección es tuya. Ejemplo: beber con la mano izquierda"),
        Card(c: "card13", g:"Rey", r: "Agrega en un vaso cualquier líquido de tu elección, el cuarto rey deberá beberse lo que se acumuló en el vaso, suerte!")
    ]
    
    var positionArray = [0,1,2,3,4,5,6,7,8,9,10,11,12].shuffled()
    var position = 0
    private var fullScreenAd: Interstitial?
    init() {
        fullScreenAd = Interstitial()
    }
    
    func getCard() -> String{
        return cartas[positionArray[position]].card
    }
    func getGame() -> String{
        return cartas[positionArray[position]].game
    }
    func getRule() -> String{
        return cartas[positionArray[position]].rule
    }
    mutating func nextCard(){
        if position + 1 < cartas.count{
            position += 1
        } else {
            position = 0
            positionArray.shuffle()
            self.fullScreenAd?.showAd()
            //score = 0
        }
    }
}
