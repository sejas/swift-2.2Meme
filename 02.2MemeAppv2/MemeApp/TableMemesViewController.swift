//
//  TableMemesViewController.swift
//  MemeApp
//
//  Created by Antonio Sejas on 26/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class TableMemesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    


}
