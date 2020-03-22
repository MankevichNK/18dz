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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "album")
       
    }
    

}
