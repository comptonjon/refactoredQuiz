//
//  GameSound.swift
//  Fuckery
//
//  Created by Jonathan Compton on 8/13/16.
//  Copyright © 2016 Jonathan Compton. All rights reserved.
//

import AudioToolbox

struct Sounds {
    
    var gameSound:SystemSoundID = 0
    
    mutating func resultSound(correct: Bool){
        //Sound file name
        var soundFile:String
        //Assign value for soundfile
        if correct {
            soundFile = "correctDing"
        } else {
            soundFile = "wrongBuzzer"
        }
        
        let pathToSoundFile = NSBundle.mainBundle().pathForResource(soundFile, ofType: "mp3")
        
        
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
        AudioServicesPlaySystemSound(gameSound)
        
    }
    //Play intro sound
    mutating func playIntro(){
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
        AudioServicesPlaySystemSound(gameSound)
        
    }
    //Play timer beep
    mutating func playLightningBeep(){
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("beep5", ofType: "mp3")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
        AudioServicesPlaySystemSound(gameSound)
    }
    
}