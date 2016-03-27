//
//  CollectionMemeViewController.swift
//  MemeApp
//
//  Created by Antonio Sejas on 27/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class CollectionMemeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collection: UICollectionView!
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        initFlowLayout()
        collection.dataSource = self
        collection.delegate = self
    }
    func initFlowLayout() {
        let space:CGFloat = 3.0
        let dimension = (self.view.frame.size.width - ( 2 * space )) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension*1.5)
    }
    override func viewWillAppear(animated: Bool) {
        collection.reloadData()
    }
    
    
    //MARK: Collection
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCellWithReuseIdentifier("memeCollectionCell", forIndexPath: indexPath) as! CollectionMemeCollectionViewCell
        cell.imgMeme.image = memes[indexPath.row].img
        cell.lblTop.text = memes[indexPath.row].textTop
        cell.lblBottom.text = memes[indexPath.row].textBottom
        return cell
    }
    //MARK: Segues
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("toMemeDetail", sender: indexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if("toMemeDetail" == segue.identifier){
            let detail = segue.destinationViewController as! DetailViewController
            detail.meme = memes[sender as! Int]
        }
    }
    
}