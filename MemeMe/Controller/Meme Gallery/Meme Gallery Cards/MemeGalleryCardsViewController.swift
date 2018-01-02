//
//  MemeGalleryCardsViewController.swift
//  MemeMe
//
//  Created by Jase-Omeileo West on 12/21/17.
//  Copyright © 2017 Omeileo. All rights reserved.
//

import UIKit

class MemeGalleryCardsViewController: UIViewController
{
    @IBOutlet weak var memeGalleryCardsTableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let cellReuseIdentifier = "CardsCell"
    let memeViewerSegue = "memeViewerSegue"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        memeGalleryCardsTableView.delegate = self
        memeGalleryCardsTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) 
    {
        memeGalleryCardsTableView.reloadData()
    }
}
