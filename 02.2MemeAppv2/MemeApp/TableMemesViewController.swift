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
    
    //MARK Init
    override func viewDidLoad() {
        super.viewDidLoad()
        if(0 == memes.count){
            performSegueWithIdentifier("toMemeEditor", sender: nil)
        }
    }
    override func viewWillAppear(animated: Bool) {
        print("memes",memes)
        table.reloadData()
    }
    
    //MARK: Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection\(memes.count)")
        return memes.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.cellForRowAtIndexPath(indexPath) as! TableMemesTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("memeCell") as! TableMemesTableViewCell
        cell.imgMeme.image = memes[indexPath.row].memeImg
        cell.lblTitle.text = memes[indexPath.row].textTop
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        table.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if(""==segue.identifier){
//        }
    }

}
