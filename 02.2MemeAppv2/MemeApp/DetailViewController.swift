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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // we hide tabbar
        tabBarController?.tabBar.hidden = true
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // we show tabbar before leave
        tabBarController?.tabBar.hidden = false
    }

}
