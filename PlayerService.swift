//
//  PlayerService.swift
//  JungleChat
//
//  Created by Theodora on 4/2/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import Foundation
import AVFoundation

struct PlayerService {
    
    private static var player = AVAudioPlayer()
    
    static func getPlayer() -> AVAudioPlayer {
        return player
    }
    
    static func playSound(song: String, loopsCount: Int) {
        let url = Bundle.main.url(forResource: song, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.numberOfLoops = loopsCount
        player.play()
    }
}
