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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("AppDelegate meme count: \(appDelegate.memes.count)")
        return appDelegate.memes.count
    }
    
    // Create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MemeGalleryCardsTableViewCell = self.memeGalleryCardsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MemeGalleryCardsTableViewCell
        let meme = appDelegate.memes[indexPath.row]
        
        cell.completedMemeImageView.image = meme.memeImage
        cell.memeCaptionTopText.text = meme.topCaption
        cell.memeCaptionBottomText.text = meme.bottomCaption
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: viewMemeSegue, sender: appDelegate.memes[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == viewMemeSegue
        {
            if let memeViewerViewController = segue.destination as? MemeViewerViewController, let meme = sender as? Meme
            {
                memeViewerViewController.meme = meme
            }
        }
    }
}
