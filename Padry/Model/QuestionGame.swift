//
//  QuestionGame.swift
//  Padry
//
//  Created by Eduardo Ceron on 29/07/21.
//

import Foundation
import SwiftUI
import GoogleMobileAds


struct QuestionGame {
    var quiz = [
        Question(q: "¿Los Koalas duermen 5 horas al día?", a: "f"),
        Question(q: "Alemania es el equipo que ha ganado más copas en el mundo", a: "f"),
        Question(q: "Justin Timberlake fue novio de Britney Spears", a: "c"),
        Question(q: "El beach tennis es un deporte muy jugado en Europa", a: "c"),
        Question(q: "Los Niños Héroes defendieron Chapultepec contra los Españoles", a: "f"),
        Question(q: "La pintura “La Última Cena” fue creada por Dalí", a: "f"),
        Question(q: "Arquimides es un físico, inventor y matemático griego", a: "c"),
        Question(q: "Saludar de beso es mas sano que saludar con la mano", a: "c"),
        Question(q: "Un billón de segundos son 20 años", a: "f"),
        Question(q: "Ningún trozo de papel cuadrado se puede doblar por la mitad más de 7 veces", a: "f"),//: Pregunta 10
        Question(q: "El 100 por ciento de las culturas que se conocen comen insectos", a: "f"),
        Question(q: "Rihanna fue cadete del ejército", a: "c"),
        Question(q: "El triángulo escaleno tiene dos lados iguales y uno distinto", a: "f"),
        Question(q: "México jugó 52 partidos en el mundial del 86", a: "c"),
        Question(q: "Gabriel García Márquez escribió “el cantar de los cantares”", a: "f"),
        Question(q: "La bandera de Italia lleva los colores azul y blanco", a: "f"),
        Question(q: "Hernan Cortes tuvo hijos con La Malinche", a: "c"),
        Question(q: "Tesla solo construye autos eléctricos", a: "c"),
        Question(q: "Los anime son de procedencia China", a: "f"),
        Question(q: "El río Volga es el más largo de Europa", a: "c"),//: Pregunta 20
        Question(q: "Europa es el continente con más desiertos en el mundo", a: "f"),
        Question(q: "Los Iniut son indígenas que viven bajo el rayo del sol", a: "f"),
        Question(q: "En el zodiaco Acuario es un signo de aire", a: "c"),
        Question(q: "El club América es un equipo de fútbol soccer Mexicano", a: "c"),
        Question(q: "La película “Birdman” es dirigida por Alejandro Gonzalez Iñárritu", a: "c"),
        Question(q: "Leonardo da Vinci es el creador de la obra “La última cena”", a: "c"),
        Question(q: "Miroslav Klose metió 16 goles en el mundial 2014", a: "c"),
        Question(q: "Fiódor Dostoyevski es un famoso pintor ruso", a: "f"),
        Question(q: "Una frecuencia cardiaca normal es de 150 a 200 latidos por minuto", a: "f"),
        Question(q: "No existe el centro del universo", a: "c"),//: Pregunta 30
        Question(q: "Compartimos un 97% de nuestros genes con los orangutanes", a: "c"),
        Question(q: "Los hermanos Grimm escribieron cuentos infantiles", a: "c"),
        Question(q: "La luna es 500 veces más grande que el sol", a: "f"),
        Question(q: "Brasil e Italia son los dos equipos en ganar dos mundiales consecutivos", a: "c"),
        Question(q: "Álvaro Obregon fue presidente de México", a: "c"),
        Question(q: "Beethoven fue un escritor y pintor", a: "f"),
        Question(q: "Rafael Osuna “el pelón” es un futbolista famoso", a: "f"),
        Question(q: "Pocahontas fue una nativa americana real", a: "c"),
        Question(q: "El Perbuatan es un río ubicado en Indonesia", a: "f"),
        Question(q: "''Libertad bajo palabra'' fue escrito por Octavio  Paz", a: "c"),//: Pregunta 40
        Question(q: "Alonso Quijano es mejor conocido como Don Quijote de la Mancha", a: "c"),
        Question(q: "La astronomía estudia el cuerpo humano", a: "f"),
        Question(q: "La melanina se encarga de dar color al pelo, los ojos y la piel", a: "c"),
        Question(q: "¡Tierra a la vista! Fue dicho por Cristóbal Colón", a: "c"),
        Question(q: "El tenista Novak Djokovic ha ganado 19 torneos de Grand Slam", a: "c"),
        Question(q: "Las primeras bombas atómicas fueron creadas por México", a: "f"),
        Question(q: "Alfa Centauri es la estrella más cercana al sistema solar", a: "c"),
        Question(q: "En 1859 se empezaron a descubrir los primeros diamantes", a: "c"),
        Question(q: "Brasil nunca ha faltado a una copa del mundo", a: "c"),
        Question(q: "El monte Olimpo es una montaña en Grecia", a: "c"),//: Pregunta 50
        Question(q: "Homero es el poeta griego que escribió la Ilíada y la Odisea", a: "c"),
        Question(q: "Sandro Botticelli es un famoso cantante y escritor", a: "f"),
        Question(q: "Justin Bieber nacio en Canada", a: "c"),
        Question(q: "La batalla de Lepanto fue la más importante del siglo XXI", a: "f"),
        Question(q: "100 kilos equivale a una tonelada", a: "f"),
        Question(q: "Bill Gates es el fundador de Google", a: "f"),
        Question(q: "La combinacion entre el color amarillo y azul da como resultado color verde", a: "c"),
        Question(q: "El río Danubio es uno de los más  importantes de Europa", a: "c"),
        Question(q: "Aconcagua es el río más largo de Argentina", a: "f"),
        Question(q: "El mejor amigo de Bob Esponja es un calamar", a: "f"),//: Pregunta 60
        Question(q: "''El señor de los anillos'' fue escrita por J.R.R. Tolkien", a: "c"),
        Question(q: "Galileo fue un famoso pintor Estadounidense", a: "f"),
        Question(q: "Brasil fue el campeón en el mundial México 1970", a: "c"),
        Question(q: "El triángulo de las bermudas y el triángulo del diablo son lo mismo", a: "c"),
        Question(q: "La flama de una vela a gravedad cero es color amarilla", a: "f"),
        Question(q: "Mariah Carey fue novia de Luis Miguel durante 3 años", a: "c"),
        Question(q: "Los juegos Olímpicos se realizan cada año", a: "f"),
        Question(q: "El macaco Moro se alimenta solo de frutas", a: "c"),
        Question(q: "Cristóbal Colón realizó cuatro viajes desde Europa a América", a: "c"),
        Question(q: "Emma Watson protagonizó ''El diario de la princesa''", a: "f"),//: Pregunta 70
        Question(q: "Los invidentes carecen del habla", a: "f"),
        Question(q: "Blaise Pascal creo el juego de la ruleta", a: "c"),
        Question(q: "La tauromaquia es un arte que nació en España", a: "c"),
        Question(q: "El oro es un elemento químico", a: "c"),
        Question(q: "El estribo es el hueso más pequeño del cuerpo humano", a: "c"),
        Question(q: "América del Norte es el continente más poblado del mundo", a: "f"),
        Question(q: "Las orcas son ballenas asesinas", a: "c"),
        Question(q: "Edwin Hubble fue un importante astrónomo del siglo XX", a: "c"),
        Question(q: "El campeonato de wimbledon se lleva a cabo desde el año 1877", a: "c"),
        Question(q: "Colón llegó al nuevo mundo un 15 de septiembre", a: "f"),//: Pregunta 80
        Question(q: "Quemas calorías al dormir", a: "c"),
        Question(q: "El sol te ayuda a equilibrar el colesterol", a: "c"),
        Question(q: "El monte Rushmore se encuentra en Alemania", a: "f"),
        Question(q: "La Mostaza es el aderezo con más carbohidratos", a: "f"),
        Question(q: "U2 es el grupo musical con menos premios Grammy", a: "f"),
        Question(q: "La artista más joven en ganar un Grammy es Belinda", a: "f"),
        Question(q: "Le Tour de france es un recorrido por la torre Eiffel", a: "f"),
        Question(q: "Aretha Franklin era una famosa escritora", a: "f"),
        Question(q: "Freddie Mercury formó parte del grupo The Beatles", a: "f"),
        Question(q: "Un polígono es una figura geométrica plana", a: "c"),//: Pregunta 90
        Question(q: "La trompeta pertenece a la familia de los instrumentos de viento", a: "c"),
        Question(q: "El Monte Everest es el volcán más alto del mundo", a: "f"),
        Question(q: "Las iniciales EDT corresponden a agua de tocador", a: "c"),
        Question(q: "El virreinato en México dura 300 años", a: "c"),
        Question(q: "El centro Olmeca más antiguo es de San Lorenzo", a: "c"),
        Question(q: "El Cocodrilo Morelet fue descubierto en México", a: "c"),
        Question(q: "Hugo Sanchez fue declarado como el mejor futbolista del siglo XX", a: "c"),
        Question(q: "Babilonia se encontraba en el actual Irak", a: "c"),
        Question(q: "El Murciélago Abejorro es más pequeño que una uña", a: "c"),
        Question(q: "Existen 10 millones de insectos por cada ser humano", a: "f")//: Pregunta 100
    ].shuffled()
    let retos = [
        "No puedes decir malas palabras durante 2 rondas, si lo haces bebes 3 tragos",
        "Mezcla un poco de la bebida de todos y bébetela",
        "Tómate una turbochela",
        "No puedes decir la palabra 'si' durante 2 rondas, si lo haces bebes 2 tragos",
        "¿Qué edad tenías cuando diste tu primer beso?, bebe el mismo número de tragos",
        "Piedra, papel o tijera… escoge a un jugador el que pierda bebe un trago",
        "Bebe un trago por cada jugador mayor que tu",
        "Bebe 3 tragos del jugador de la izquierda",
        "Acábate la copa del jugador de la derecha",
        "Sin excusas, ¡Terminate tu trago!",// reto #10
        "Bebe un trago por cada jugador menor que tu",
        "El jugador de tu izquierda te indica cada cuando tomar durante 3 rondas",
        "No puedes hablar durante 2 rondas, ¡Si lo haces, bebes la cantidad de palabras que digas!",
        "Bebe la cantidad de cigarros que estén prendidos",
        "Bebe la cantidad de focos prendidos en la habitación en la que estás",
        "Bebe un trago directo de la botella",
        "Bebe un shot por cada botella que hay sobre la mesa",
        "Menciona la edad de cada jugador, por cada incorrecto bebe un trago",
        "Bebe la cantidad de tragos del último dígito de tu número celular",
        "Toma un shot por cada hermana o hermano que tengas",// reto #20
        "Toma la cantidad de tragos como vasos haya en la mesa",
    ]
    
    var questionNumber = 0
    var questionAnswer = 0
    var alerta: Bool = false
    private var fullScreenAd: Interstitial?
    init() {
        fullScreenAd = Interstitial()
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[questionAnswer].answer{
            return true
        }else{
            return false
        }
    }
    func getQuestionText() -> String{
        return quiz[questionNumber].text
    }
    func getQuestionNumber () -> Int{
        return questionNumber
    }
    mutating func nextQuestion(){
        if questionNumber + 1 < quiz.count {
            questionAnswer = questionNumber
            questionNumber += 1
            if questionNumber % 8 == 0 {
                print("\(questionNumber % 8)")
                self.fullScreenAd?.showAd()
            }
        } else {
            quiz.shuffle()
            questionNumber = 0
            questionAnswer += 1
            alerta = true
        }
    }
}
