//
//  MemeViewerViewController.swift
//  MemeMe
//
//  Created by Jase-Omeileo West on 12/30/17.
//  Copyright © 2017 Omeileo. All rights reserved.
//

import UIKit

class MemeViewerViewController: UIViewController
{
    @IBOutlet weak var memeImageView: UIImageView!
    
    var meme: Meme!
    var memeEditorSegue = "memeEditorSegue"
    
    override func viewWillAppear(_ animated: Bool)
    {
        navigationController?.setNavigationBarHidden(false, animated: true)
        memeImageView.image = meme.memeImage
    }

    @IBAction func editMeme(_ sender: Any)
    {
        performSegue(withIdentifier: memeEditorSegue, sender: meme)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == memeEditorSegue
        {
            if let memeEditorViewController = segue.destination as? MemeEditorViewController, let meme = sender as? Meme
            {
                memeEditorViewController.meme = meme
            }
        }
    }
}
