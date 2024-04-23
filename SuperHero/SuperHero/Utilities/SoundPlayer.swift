//
//  SoundPlayer.swift
//  SuperHero
//
//  Created by Mohammad Dawoud on 2024-04-04.
//

import Foundation
import AVFoundation

var audioPlayer : AVAudioPlayer?

func PlaySound(sound : String, type : String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        } catch{
            print("Could not find the sound")
        }
    }
}
