//
//  CollectionMemeViewController.swift
//  MemeApp
//
//  Created by Antonio Sejas on 27/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class CollectionMemeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collection.deselectItemAtIndexPath(indexPath, animated: true)
    }
}
