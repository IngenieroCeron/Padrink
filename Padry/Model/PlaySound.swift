//
//  PlaySound.swift
//  Padry
//
//  Created by Eduardo Ceron on 04/08/21.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch {
            print("No se pudo reproducir sonido")
        }
    }
}

func stopSound() {
    audioPlayer?.stop()
}

/*
var player: AVAudioPlayer!
func playSound(key: String){
    let url = Bundle.main.url(forResource: key, withExtension: "mpeg")
    guard url != nil else{
        return
    }
    do{
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    } catch{
        print("error")
    }
}
*/
