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
        table.reloadData()
    }
    
    //MARK: Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeCell") as! TableMemesTableViewCell
        cell.imgMeme.image = memes[indexPath.row].memeImg
        cell.lblTitle.text = memes[indexPath.row].textTop
        return cell
    }
    //MARK: Segues
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        table.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("toMemeDetail", sender: indexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if("toMemeDetail" == segue.identifier){
            let detail = segue.destinationViewController as! DetailViewController
            detail.meme = memes[sender as! Int]
        }
    }

}
