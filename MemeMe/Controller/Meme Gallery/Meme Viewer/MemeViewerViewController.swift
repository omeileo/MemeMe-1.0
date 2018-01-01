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
    var editMemeSegue = "editMemeSegue"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        memeImageView.image = meme.memeImage
    }

    @IBAction func editMeme(_ sender: Any)
    {
        performSegue(withIdentifier: editMemeSegue, sender: meme)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == editMemeSegue
        {
            if let memeEditorViewController = segue.destination as? MemeEditorViewController, let meme = sender as? Meme
            {
                memeEditorViewController.meme = meme
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
