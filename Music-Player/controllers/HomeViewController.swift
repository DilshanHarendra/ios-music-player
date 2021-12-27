//
//  ViewController.swift
//  Music-Player
//
//  Created by Dilshan Harendra Perera on 2021-12-27.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    
    @IBOutlet var table:UITableView!
    
    var songs:[Song]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSongs()
        
        table.delegate=self
        table.dataSource=self
    }
    
    
    
    func loadSongs() {
        songs.append(Song(name: "Ahankara Nagare", album: "Aloke 2", artistName: "Ranidu Iraj", imageName: "smaple", trackName: "smaple"))
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell",for: indexPath)
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artistName
        cell.imageView?.image=UIImage(named: song.imageName)
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 18)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postion = indexPath.row
        
        guard let vc = storyboard?.instantiateViewController(identifier: "musicPlayer") else {
            return
        }
        
        let curentSong:Song = songs[postion]
        
        present(vc, animated: true)
        // navigationController?.pushViewController(vc, animated: true)  // mehema damma ama todo eke wage swipe wenwa
        
        
    }


}

