//
//  InfoViewController.swift
//  18dz
//
//  Created by Пользователь on 3/20/20.
//  Copyright © 2020 Пользователь. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var executorName: UILabel!
    
    @IBOutlet weak var genre: UILabel!
    var name: String?
    var executor: String?
    var genreMusic: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "album")
        nameLabel.text = name
        executorName.text = executor
        genre.text = genreMusic
    }
    

}
