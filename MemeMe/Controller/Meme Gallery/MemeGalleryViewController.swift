//
//  MemeGalleryViewController.swift
//  MemeMe
//
//  Created by Jase-Omeileo West on 1/1/18.
//  Copyright © 2018 Omeileo. All rights reserved.
//

import UIKit

class MemeGalleryViewController: UITabBarController
{
    let newMemeSegue = "newMemeSegue"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

//        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func createNewMeme(_ sender: Any)
    {
        performSegue(withIdentifier: newMemeSegue, sender: nil)
    }
}
