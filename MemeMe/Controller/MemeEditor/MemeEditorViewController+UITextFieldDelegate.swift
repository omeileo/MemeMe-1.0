//
//  MemeEditorViewController+UITextFieldDelegate.swift
//  MemeMe
//
//  Created by Jase-Omeileo West on 11/6/17.
//  Copyright © 2017 Omeileo. All rights reserved.
//

import UIKit

extension MemeEditorViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField
        {
            nextField.becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
        }
        
        return false
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
//    {
//        guard let text = textField.text else { return true }
//        let newLength = text.count + string.count - range.length
//        
//        return newLength <= maxLength
//    }
}
