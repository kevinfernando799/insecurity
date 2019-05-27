//
//  ViewController.swift
//  Insecurity
//
//  Created by Kevin Fernando on 18/05/19.
//  Copyright © 2019 Kevin Fernando. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit

class ViewController: UIViewController {
    
    @IBOutlet weak var balonCokelat: UIButton!
    @IBOutlet weak var balonBiru: UIButton!
    @IBOutlet weak var balonMerah: UIButton!
    @IBOutlet weak var balonAbuAbu: UIButton!
    @IBOutlet weak var headPhone: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var starfall1: UIButton!
    @IBOutlet weak var starfall2: UIButton!
    @IBOutlet weak var starfall3: UIButton!
    @IBOutlet weak var starfall4: UIButton!
    @IBOutlet weak var starfall5: UIButton!
    @IBOutlet weak var telunjuk: UIImageView!
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var insecureMan: UIImageView!
    @IBOutlet weak var fog: UIImageView!
    @IBOutlet weak var telunjukKanan: UIImageView!
    @IBOutlet weak var telunjuk2: UIImageView!
    @IBOutlet weak var telunjukKanan2: UIImageView!
    @IBOutlet weak var happyFace: UIImageView!
    @IBOutlet weak var deppressionLine: UIImageView!
    @IBOutlet weak var sadMan: UIImageView!
    @IBOutlet weak var telunjukAtas: UIImageView!
    @IBOutlet weak var circle: UIImageView!
    
    
    
    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     

        headPhone.alpha = 0
        quote.alpha = 0
        fog.alpha = 0
        insecureMan.alpha = 0
        happyFace.alpha = 0
        starfall1.alpha = 0
        starfall2.alpha = 0
        starfall3.alpha = 0
        starfall4.alpha = 0
        starfall5.alpha = 0
        telunjukKanan.alpha = 0
        telunjuk2.alpha = 0
        telunjukKanan2.alpha = 0
        telunjukAtas.alpha = 0
        circle.alpha = 0
        quote.textColor = UIColor.white
        view.sendSubviewToBack(background)
        
        
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
        //headPhone.alpha = 1
        player?.stop()
        balonBiru.isEnabled = true
        UIView.animate(withDuration: 1) {
            self.balonCokelat.alpha = 0
            self.headPhone.alpha = 1
            self.telunjuk.alpha = 0
            self.happyFace.alpha = 1
            self.deppressionLine.alpha = 0
            self.telunjukKanan.alpha = 1
            
            
            
            
        }
    }
    
    
    @IBAction func balonBiruAction(_ sender: Any) {
        background.alpha = 0
        background.image = UIImage(named: "background 4")
        UIView.animate(withDuration: 2) {
            self.background.alpha = 1
        }
        //balonBiru.alpha = 0
        //insecureMan.isHidden = false
        balonMerah.isEnabled = true
        UIView.animate(withDuration: 1) {
            self.fog.alpha = 0.5
            self.balonBiru.alpha = 0
            self.starfall1.alpha = 1
            self.starfall2.alpha = 1
            self.starfall3.alpha = 1
            self.starfall4.alpha = 1
            self.starfall5.alpha = 1
            self.telunjukKanan.alpha = 0
           // self.happyFace.alpha = 0
            self.insecureMan.alpha = 1
//            self.sadMan.alpha = 0
            self.happyFace.alpha = 0
            self.telunjuk2.alpha = 1
           
//            self.background.alpha = 1
            
        }
        
        UIView.animate(withDuration: 0.9) {
            self.sadMan.alpha = 0
        }
        
        UIView.animate(withDuration: 13, delay: 0, options: [.autoreverse, .repeat] , animations: {
            self.fog.transform = CGAffineTransform(translationX: -500, y: 0)
            
        })
        
        
    }
    
    
    @IBAction func balonMerahAction(_ sender: Any) {
        player2?.play()
       // balonMerah.alpha = 0
        balonAbuAbu.isEnabled = true
        
        UIView.animate(withDuration: 1) {
            self.balonMerah.alpha = 0
            self.telunjuk2.alpha = 0
            self.telunjukKanan2.alpha = 1
            
            
            
        }
        
        let skView = SKView()
        skView.frame = view.frame
        skView.allowsTransparency = true
        skView.backgroundColor = UIColor.clear

        
        let skScene = SKScene(size: view.frame.size);
        skScene.scaleMode = .aspectFill;
        skScene.backgroundColor = UIColor.clear
        
        let emitter:SKEmitterNode = SKEmitterNode(fileNamed: "MyParticle.sks")!;
        emitter.position = CGPoint(x: 0.5, y: 0.75)
        
        skScene.addChild(emitter);
        skView.presentScene(skScene);
        view.addSubview(skView);
        view.sendSubviewToBack(skView)
        view.sendSubviewToBack(background)
        
    }
    
    
    @IBAction func balonAbuAbuAction(_ sender: Any) {
        //quote.alpha = 1
       // balonAbuAbu.alpha = 0
        UIView.animate(withDuration: 1) {
            self.balonAbuAbu.alpha = 0
            self.telunjukKanan2.alpha = 0
            self.telunjukAtas.alpha = 1
            self.circle.alpha = 1
           
            
        }
        UIView.animate(withDuration: 3) {
            self.quote.alpha = 1
        }
        
        starfall1.isEnabled = true
        starfall2.isEnabled = true
        starfall3.isEnabled = true
        starfall4.isEnabled = true
        starfall5.isEnabled = true
    }
    
    @IBAction func meteor1(_ sender: UIButton) {
        UIView.animate(withDuration: 5, delay: 0, options: .curveEaseOut, animations: {
            sender.transform = CGAffineTransform (translationX: -500, y: 500)
            sender.alpha = 0
        }){ _ in
            sender.transform = CGAffineTransform (translationX: 0, y: 0)
            UIView.animate(withDuration: 1
                , animations: {
                    
                    sender.alpha = 1
            })
        }
        
        UIView.animate(withDuration: 0.4) {
            self.telunjukAtas.alpha = 0
            self.circle.alpha = 0
        }
    }
    
    
}

