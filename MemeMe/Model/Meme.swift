//
//  Meme.swift
//  MemeMe
//
//  Created by Jase-Omeileo West on 10/29/17.
//  Copyright © 2017 Omeileo. All rights reserved.
//

import Foundation
import UIKit

struct Meme
{
    var originalImage: UIImage?
    var memeImage: UIImage?
    var topCaption: String?
    var bottomCaption: String?
    var id: String?
    var isEdited: Bool
    
    init(originalImage: UIImage?, memeImage: UIImage?, topCaption: String?, bottomCaption: String?, id: String?, isEdited: Bool)
    {
        self.originalImage = originalImage
        self.memeImage = memeImage
        self.topCaption = topCaption
        self.bottomCaption = bottomCaption
        self.id = id
        self.isEdited = isEdited
    }
}
