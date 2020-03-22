//
//  SecondViewController.swift
//  18dz
//
//  Created by Пользователь on 3/20/20.
//  Copyright © 2020 Пользователь. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldExecuter: UITextField!
    @IBOutlet weak var textFieldGenre: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var addTracks: ((Tracks) -> Void)?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Library"
        imageView.image = UIImage(named: "album")
    }
  
   
    @IBAction func addTrackButtonDidClick(_ sender: Any) {
        guard let nameMusic = textFieldName.text, nameMusic != "" else { return }
        guard let nameExecuter = textFieldExecuter.text, nameExecuter != "" else { return }
        guard let genre = textFieldGenre.text, genre != "" else { return }
        let track = Tracks(nameTrack: nameMusic, nameExecutor: nameExecuter, genre: genre)
        addTracks?(track)
        navigationController?.popViewController(animated: true)
    }
    
}
