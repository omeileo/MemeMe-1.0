//
//  MemeGalleryCardsViewController+TableView.swift
//  MemeMe
//
//  Created by Jase-Omeileo West on 12/30/17.
//  Copyright © 2017 Omeileo. All rights reserved.
//

import Foundation
import UIKit

extension MemeGalleryCardsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return appDelegate.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: MemeGalleryCardsTableViewCell = self.memeGalleryCardsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MemeGalleryCardsTableViewCell
        let meme = appDelegate.memes[indexPath.row]
        
        cell.completedMemeImageView.image = meme.memeImage
        cell.memeCaptionTopText.text = meme.topCaption
        cell.memeCaptionBottomText.text = meme.bottomCaption
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: memeViewerSegue, sender: appDelegate.memes[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete)
        {
            memeGalleryCardsTableView.beginUpdates()
            
            appDelegate.memes.remove(at: indexPath.row)
            memeGalleryCardsTableView.deleteRows(at: [indexPath], with: .left)
            emptyGalleryText.isHidden = appDelegate.memes.count > 0 ? true : false
            
            memeGalleryCardsTableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == memeViewerSegue
        {
            if let memeViewerViewController = segue.destination as? MemeViewerViewController, let meme = sender as? Meme
            {
                memeViewerViewController.meme = meme
            }
        }
    }
}
