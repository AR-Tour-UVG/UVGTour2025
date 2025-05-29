//
//  TourAudioPlayer.swift
//  UVGTour
//
//  Created by LEIVA PEREZ, DIEGO ALBERTO on 28/05/25.
//

import AVFoundation

// Define the class
class TourAudioPlayer {
    static var player: AVAudioPlayer?

    // paly audio function even in silent mode
    static func play(audioNamed name: String) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error setting AVAudioSession: \(error)")
        }
        
        // Retrieve the audio file
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Audio File not Found \(name).mp3")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error while playing audio: \(error.localizedDescription)")
        }
    }
}
