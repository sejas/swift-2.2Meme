//
//  DetailViewController.swift
//  MemeApp
//
//  Created by Antonio Sejas on 27/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgMeme: UIImageView!
    var meme = Meme( textTop: "", textBottom: "", img: UIImage(), memeImg: UIImage())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgMeme.image = meme.memeImg
    }

}
