//
//  ViewController.swift
//  Insecurity
//
//  Created by Kevin Fernando on 18/05/19.
//  Copyright © 2019 Kevin Fernando. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var balonCokelat: UIButton!
    @IBOutlet weak var balonBiru: UIButton!
    @IBOutlet weak var balonMerah: UIButton!
    @IBOutlet weak var balonAbuAbu: UIButton!
    @IBOutlet weak var headPhone: UIImageView!
    @IBOutlet weak var background2: UIImageView!
    @IBOutlet weak var quote: UILabel!
    
    
    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headPhone.alpha = 0
        quote.alpha = 0
        quote.textColor = UIColor.white
        
        guard let url = Bundle.main.url(forResource: "talkingpeople", withExtension: "wav") else {return}
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            if let player = player {
                
                player.numberOfLoops = -1
                player.play()
            }
            
        }
        
        catch let error {
            print(error.localizedDescription)
        }
        
        guard let url2 = Bundle.main.url(forResource: "Flickering", withExtension: "mp3") else {return}
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player2 = try AVAudioPlayer(contentsOf: url2, fileTypeHint: AVFileType.mp3.rawValue)
            if let player = player2 {
                
                player.numberOfLoops = -1
            }
            
        }
            
        catch let error {
            print(error.localizedDescription)
        }
        
        // Do any additional setup after loading the view.
    }

 
    @IBAction func balonCokelatAction(_ sender: Any) {
        headPhone.alpha = 1
        player?.stop()
        balonCokelat.alpha = 0
    }
    
    
    @IBAction func balonBiruAction(_ sender: Any) {
        background2.image = UIImage(named: "background2")
        balonBiru.alpha = 0
    }
    
    
    @IBAction func balonMerahAction(_ sender: Any) {
        player2?.play()
        balonMerah.alpha = 0
    }
    
    
    @IBAction func balonAbuAbuAction(_ sender: Any) {
        quote.alpha = 1
        balonAbuAbu.alpha = 0
    }
    
}

