//
//  MemeGalleryGridViewController+CollectionView.swift
//  MemeMe
//
//  Created by Jase-Omeileo West on 1/1/18.
//  Copyright © 2018 Omeileo. All rights reserved.
//

import UIKit

extension MemeGalleryGridViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return appDelegate.memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: MemeGalleryGridCollectionViewCell = self.memeGalleryGridCollectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! MemeGalleryGridCollectionViewCell
        let meme = appDelegate.memes[indexPath.row]
        
        cell.completedMemeImageView.image = meme.memeImage
        cell.memeCaptionTopText.text = meme.topCaption
        cell.memeCaptionBottomText.text = meme.bottomCaption
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: memeViewerSegue, sender: appDelegate.memes[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == memeViewerSegue
        {
            if let memeViewerViewController = segue.destination as? MemeViewerViewController, let meme = sender as? Meme
            {
                memeViewerViewController.meme = meme
            }
        }
    }
}
