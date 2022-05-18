//
//  S6conds.swift
//  Padry
//
//  Created by Eduardo Ceron on 03/02/22.
//

import Foundation
import SwiftUI
import GoogleMobileAds

struct S6conds {
    var carta = ["Menciona 3 signos zodiacales",
                 "Menciona 3 muebles de recámara",
                 "Menciona 3 ciudades de México",
                 "Menciona 3 tipos de mediciones",
                 "Menciona 3 marcas de autos",
                 "Menciona 3 nombres con la letra U",
                 "Menciona 3 princesas de Disney",
                 "Menciona 3 Marcas de cigarros",
                 "Menciona 3 presidentes",
                 "Menciona 3 medicamentos",//: 10
                 "Menciona 3 cócteles con alcohol",
                 "Menciona 3 estados de México con playa",
                 "Menciona 3 maravillas del mundo",
                 "Menciona 3 planetas",
                 "Menciona 3 razas de perros",
                 "Menciona 3 tipos de flores",
                 "Menciona 3 órganos del cuerpo",
                 "Menciona 3 marcas de celulares",
                 "Menciona 3 medios de transporte terrestre",
                 "Menciona 3 accesorios para hombre",//: 20
                 "Menciona 3 utensilios de cocina",
                 "Menciona 3 tipos de chile",
                 "Menciona 3 frutas amarillas",
                 "Menciona 3 marcas de condones",
                 "Menciona 3 posiciones sexuales",
                 "Menciona 3 marcas de llantas para carro",
                 "Menciona 3 superhéroes con capa",
                 "Menciona 3 películas de terror",
                 "Menciona 3 universidades",
                 "Menciona 3 películas de Disney",//: 30
                 "Menciona 3 apodos de personas",
                 "Menciona 3 actores Mexicanos",
                 "Menciona 3 huesos del cuerpo humano",
                 "Menciona 3 videojuegos",
                 "Menciona 3 equipos de futbol soccer",
                 "Menciona 3 personajes mitológicos",
                 "Menciona 3 océanos",
                 "Menciona 3 deportistas famosos",
                 "Menciona 3 deportes con raqueta",
                 "Menciona 3 metodos anticonceptivos",//: 40
                 "Menciona 3 países europeos",
                 "Menciona 3 elementos de la tabla periódica",
                 "Menciona 3 animales acuáticos",
                 "Menciona 3 accesorios para mujer",
                 "Menciona 3 asignaturas",
                 "Menciona 3 anfibios",
                 "Menciona 3 cosas que haces cuando nadie te ve",
                 "Menciona 3 museos",
                 "Menciona 3 películas románticas ",
                 "Menciona 3 alimentos típicos para el desayuno",//: 50
                 "Menciona 3 tipos de quesos",
                 "Menciona 3 canciones de Michael Jackson",
                 "Menciona 3 animales que ponen huevos",
                 "Menciona 3 tipos de galletas",
                 "Menciona 3 marcas de comidas para mascotas",
                 "Menciona 3 disfraces de halloween",
                 "Menciona 3 productos que se obtienen de los cerdos",
                 "Menciona 3 géneros musicales",
                 "Menciona 3 equipos profesionales de fútbol americano",
                 "Menciona 3 países colindantes con el Océano Pacífico",//: 60
                 "Menciona 3 automóviles Chrysler",
                 "Menciona 3 platillos de mariscos",
                 "Menciona 3 calles en tu ciudad",
                 "Menciona 3 caricaturas actuales",
                 "Menciona 3 hierbas",
                 "Menciona 3 actividades del invierno al aire libre",
                 "Menciona 3 gimnasios",
                 "Menciona 3 formas de comunicarse",
                 "Menciona 3 sabores de helado",
                 "Menciona 3 marcas de computadoras",//: 70
                 "Menciona 3 equipos profesionales de fútbol soccer",
                 "Menciona 3 palabras que riman con rojo",
                 "Menciona 3 inventores",
                 "Menciona 3 famoso que sean calvos",
                 "Menciona 3 amigos de Winnie Pooh",
                 "Menciona 3 aderezos para ensalada",
                 "Menciona 3 cosas para pasar el tiempo mientras viajas",
                 "Menciona 3 comediantes",
                 "Menciona 3 electrodomésticos",
                 "Menciona 3 “Migueles/Michaels” famosos",//: 80
                 "Menciona 3 cosas para rasurarse",
                 "Menciona 3 marcas de desodorante",
                 "Menciona 3 personajes de la serie de TV “Los Simpsons”",
                 "Menciona 3 cantantes masculinos de música actual",
                 "Menciona 3 de los enanitos de Blanca Nieves",
                 "Menciona 3 cosas para acampar",
                 "Menciona 3 tipos de desastres Naturales",
                 "Menciona 3 tiendas departamentales",
                 "Menciona 3 cosas que puedes encontrar en un baño",
                 "Menciona 3 instrumentos de viento de madera",//: 90
                 "Menciona 3 presidentes",
                 "Menciona 3 series de TV",
                 "Menciona 3 capitales de estados de la República Mexicana",
                 "Menciona 3 marcas de pasta de dientes",
                 "Menciona 3 libros",
                 "Menciona 3 formas de decir 'tengo que ir al baño'",
                 "Menciona 3 cosas con botones",
                 "Menciona 3 productos para el cabello"//: 98
    ]//.shuffled()
    
    var numeroCarta = 0
    private var fullScreenAd: Interstitial?
    init() {
        fullScreenAd = Interstitial()
    }
    
    func getTextoCarta() -> String{
        return carta[numeroCarta]
    }
    mutating func siguienteCarta(){
        if numeroCarta + 1 < carta.count{
            numeroCarta += 1
            if numeroCarta % 8 == 0 {
                print("\(numeroCarta % 8)")
                self.fullScreenAd?.showAd()
            }
        } else {
            numeroCarta = 0
            carta.shuffle()
        }
    }
    
}
