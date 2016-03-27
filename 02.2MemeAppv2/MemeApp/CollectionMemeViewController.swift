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
        collection.dataSource = self
        collection.delegate = self
    }
    override func viewWillAppear(animated: Bool) {
        collection.reloadData()
        //Suscribe to orientation change
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "orientationChanged", name: UIDeviceOrientationDidChangeNotification, object: nil)
        initFlowLayout()
    }
    override func viewWillDisappear(animated: Bool) {
        //Unsuscribe to orientation change
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    //Set 3 cells per row
    func initFlowLayout() {
        let space:CGFloat = 3.0
        let dimension = (self.view.bounds.size.width - ( 2 * space )) / 3.0
        print("dimension: \(dimension), orientation: \(UIDevice.currentDevice().orientation.isPortrait), width: \(self.view.bounds.size.width)")
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension*1.2)
    }
    func orientationChanged() {
        initFlowLayout()
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