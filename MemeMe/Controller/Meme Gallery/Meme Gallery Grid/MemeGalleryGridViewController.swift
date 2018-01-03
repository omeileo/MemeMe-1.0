//
//  MemeGalleryGridViewController.swift
//  MemeMe
//
//  Created by Jase-Omeileo West on 12/21/17.
//  Copyright © 2017 Omeileo. All rights reserved.
//

import UIKit

class MemeGalleryGridViewController: UIViewController
{
    @IBOutlet weak var memeGalleryGridCollectionView: UICollectionView!    
    @IBOutlet weak var emptyGalleryText: UIStackView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let cellReuseIdentifier = "GridCell"
    let memeViewerSegue = "memeViewerSegue"

    override func viewDidLoad()
    {
        super.viewDidLoad()

        memeGalleryGridCollectionView.delegate = self
        memeGalleryGridCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) 
    {
        emptyGalleryText.isHidden = appDelegate.memes.count > 0 ? true : false
        memeGalleryGridCollectionView.reloadData()
    }
}
