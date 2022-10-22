//
//  MakeNoize.swift
//  DissolveSedentaryWithSquat
//
//  Created by arakawaLab on 2022/10/22.
//

import Foundation
import AVFoundation

class MakeNoize {
    let audioEngine = AVAudioEngine()
    let player = AVAudioPlayerNode()

    func play() {
        if let url = Bundle.main.url(forResource: "noiseFile", withExtension: "mp3") {
            do {
                let audioFile = try! AVAudioFile(forReading: url)
                let loopBuffer = AVAudioPCMBuffer(pcmFormat: audioFile.processingFormat, frameCapacity: AVAudioFrameCount(audioFile.length-1000))
                try! audioFile.read(into: loopBuffer!, frameCount: AVAudioFrameCount(audioFile.length-1000))
                
                audioEngine.attach(player)
                
                let mixer = audioEngine.mainMixerNode
                audioEngine.connect(player, to: mixer, format: audioFile.processingFormat)
                player.scheduleBuffer(loopBuffer!, at: nil, options: .loops) {
                    print("complete")
                }
                
                try audioEngine.start()
                player.play()
                
            } catch let error {
                  print(error)
            }
        } else {
            print("File not found")
        }
    }
    
    func stop() {
        player.stop()
    }
}
