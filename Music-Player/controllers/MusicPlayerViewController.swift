//
//  MusicPlayerViewController.swift
//  Music-Player
//
//  Created by Dilshan Harendra Perera on 2021-12-27.
//
import AVFoundation
import UIKit

class MusicPlayerViewController: UIViewController {

    @IBOutlet var playerHolderView:UIView!
    @IBOutlet var coverImageUIImage:UIImageView!
    @IBOutlet var songTitleLabel:UILabel!
    @IBOutlet var songArtistLabel:UILabel!
    
    @IBOutlet var songDurationLable:UILabel!
    @IBOutlet var songCurrentDuration:UILabel!
    
    
    @IBOutlet var playPauseBtn:UIButton!
    
    
    
    
    @IBAction func playPauseSong(sender:UIButton){
        print("call button")
        if player!.isPlaying{
            player?.pause()
            playPauseBtn.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }else{
            player?.play()
            playPauseBtn.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        
    }
    
    var songs:[Song] = []
    var postion:Int = 0
    
    var player:AVAudioPlayer?
    
    var updater: CADisplayLink!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
   
    
    func config() {
      // set up player
        print("call")
        
        let song:Song =  songs[postion]
        
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
      
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            print("plyer \(urlString)")
            
            
            songDurationLable.text = "\(player.duration)"
            
           
            
            player.play()
            playPauseBtn.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
                  
            let playerItem = AVPlayerItem(url: URL(string: urlString)!)
            let metadataList = playerItem.asset.metadata as! [AVMetadataItem]
            
            print(metadataList)
           
           
            
        } catch let error {
            print("Error \(error.localizedDescription)")
        }
        
    // set up user interface
        
        coverImageUIImage.image = UIImage(named: song.imageName)
        songTitleLabel.text = song.name
        songArtistLabel.text = song.artistName
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let player = player{
            player.stop()
        }
    }

  
  
    
    
    
}
