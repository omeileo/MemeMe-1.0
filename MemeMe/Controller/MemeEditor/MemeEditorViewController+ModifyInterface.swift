//
//  MemeEditorViewController+ModifyInterface.swift
//  MemeMe
//
//  Created by Jase-Omeileo West on 11/5/17.
//  Copyright © 2017 Omeileo. All rights reserved.
//

import Foundation
import UIKit

extension MemeEditorViewController
{
    // MARK: Configure Captions for User to Edit
    func setupCaptions()
    {
        let placeholders = ["TOP", "BOTTOM"]
        let texts = [meme.topCaption, meme.bottomCaption]
        
        for index in 0..<memeCaptions.count
        {
            configureCaption(textField: memeCaptions[index], placeholder: placeholders[index], text: texts[index])
        }
    }
    
    func configureCaption(textField: UITextField, placeholder: String?, text: String?)
    {
        configureCaptionText(caption: textField, fontFamily: FontFamily.helvetica.rawValue)
        textField.layer.cornerRadius = 55/2
        
        populateTextField(textField: textField, placeholder: placeholder, text: text)
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func populateTextField(textField: UITextField, placeholder: String?, text: String?)
    {
        textField.placeholder = placeholder
        textField.text = text
    }
    
    @objc func textFieldDidChange (_ textField: UITextField)
    {
        if textField.hasText
        {
            adjustTextFieldVisibility(textField: textField, colorAlpha: 0.0)
        }
        else
        {
            adjustTextFieldVisibility(textField: textField, colorAlpha: 0.15)
        }
        
        if memeTopCaptionTextField.hasText == true && memeBottomCaptionTextField.hasText == true
        {
            enableActionButtons(true)
            
            adjustTextFieldVisibility(textField: memeTopCaptionTextField, colorAlpha: 0.0)
            adjustTextFieldVisibility(textField: memeBottomCaptionTextField, colorAlpha: 0.0)
        }
        else
        {
            enableActionButtons(false)
        }
    }
    
    // MARK: Present Share Options Modally
    func shareMeme(completedMeme: UIImage)
    {
        let shareController = UIActivityViewController(activityItems: [completedMeme], applicationActivities: nil)
        
        present(shareController, animated: true, completion: nil)
        shareController.completionWithItemsHandler = {(activityTypeChosen: UIActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
            if activityTypeChosen != nil && completed
            {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                self.meme.id = UUID().uuidString
                appDelegate.memes.append(self.meme)
                
                print("Navigation controllers: \(self.navigationController?.childViewControllers)")
                
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    func configureMemeImage()
    {
        memeImageView.contentMode = .scaleAspectFit
        memeImageView.image = meme.originalImage
    }
    
    func adjustTextFieldVisibility(textField: UITextField, colorAlpha: CGFloat)
    {
        textField.backgroundColor = UIColor(white: 1.0, alpha: colorAlpha)
        textField.alpha = 1.0
    }
    
    func enableActionButtons(_ enable: Bool)
    {
        downloadMemeButton.isEnabled = enable
        sendButton.isEnabled = enable
    }
}
