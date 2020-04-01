//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

//AV = Audio Visual
import AVFoundation

    class ViewController: UIViewController {
        
        //We made a variable called player which will be linked to the audio player
        var player: AVAudioPlayer!

        override func viewDidLoad() {
            super.viewDidLoad()
        }

//        We linked a bunch of buttons to this action by dragging it from code to the interface
        @IBAction func keyPressed(_ sender: UIButton) {
       
            
            //Pretty we make a new function name call play sound and it looks for the sound name of the sender "button" and finds the current title so if it is C it plays C
            playSound(soundName:sender.currentTitle!)
            // The ! is there because we are certain that each button on the interface has a title
            
            //Alpha changes the transparency of something  - when pressed it change it to half opaque of the button
              sender.alpha = 0.5
        
            //Dispacth Queue an object that manages tasks to be done on the app as a major part or in the background scenes
            // We then say main because it is the main part of the app and not like background music or something that is in the back scenes
            
            //asyncAfter is a function that executes something after a certain amount of time and it is set for 0.2 seconds as a paramter it then returns back to its normal attribute which is specified in this case the alpha the tint of color of something
            
        //.now means it of right now the time but then + 0.2 seconds
        //Pretty much, wait 0.2 seconds to do the next thing
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
        //Sender is the button returns back to full opaque after it is pressed
            sender.alpha = 1.0
            }
    }
        //This is a function of our playSound function and we use a data type and call the soundName and specify as a string
        func playSound(soundName: String) {
            
            //let url means it is trying to find a audio bundle of the soundname which will be C, D , E , F , G , A , B and then
            // Bundle.main means that playing a sound is crucial in this app and will be the main part of it
            // URL finds the the resource which is the sound file its soundName and is the currentTitle or the what is the word typed on the user interface and aswell its name which is wav in the files
            
            
            let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
            
            //Player is the audio player which will be playing the sound and will use the content of the music file URl which it would have found from looking at the sound name and its name with the string name of wav
            player = try! AVAudioPlayer(contentsOf: url!)
            
            //We then tell the audio player to play the sound that it have found of the url of the specific sound file
            player.play()
                    
        }
    }




 


 


    
//    The Online solution code
//    func playSound() {
//        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//            guard let player = player else { return }
//
//            player.play()
//
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }

