//
//  AddViewController.swift
//  Adolfo Says
//
//  Created by Segun Konibire on 20/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var previewLabel: UILabel!
    
    @IBOutlet var charCountLabel: UILabel!
    
    var maxChar: Int = 50
    
    var meaningIndex: Int!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.textField.delegate = self
        
        textField.becomeFirstResponder()
        
        charCountLabel.text = String(maxChar)
        
        if meaningIndex != nil {
        
            textField.text = adolfoMeans[meaningIndex]
            
            previewLabel.text = adolfoMeans[meaningIndex]
            
            charCountLabel.text = String(maxChar - count(adolfoMeans[meaningIndex]))
            
        }
        
    }
    
    
    @IBAction func keyboardPressed(sender: AnyObject) {
        
        previewLabel.text = textField.text
        
        charCountLabel.text = String(maxChar - count(textField.text!))
        
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let newLength = count(textField.text.utf16) + count(string.utf16) - range.length
        
        return newLength <= maxChar
        
    }
    
    
    func saveAndDismissView(){
        
        var newMeaning: String = textField.text
        
        if meaningIndex != nil {
            
            adolfoMeans[meaningIndex] = newMeaning
            
        } else {
            
            adolfoMeans.append(newMeaning)
            
        }
        
    
        self.navigationController?.popViewControllerAnimated(true)
        
        println("Not dismissing")
    }

    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        saveAndDismissView();
        
        return true
    }

}
