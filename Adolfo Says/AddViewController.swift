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
    
    var maxChar: Int = 90
    
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
    
    
    @IBAction func cancelPressed(sender: AnyObject) {
        
        dismissScreen()
        
    }
    
    
    @IBAction func keyboardPressed(sender: AnyObject) {
        
        previewLabel.text = textField.text
        
        charCountLabel.text = String(maxChar - count(textField.text!))
        
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let newLength = count(textField.text.utf16) + count(string.utf16) - range.length
        
        return newLength <= maxChar
        
    }
    
    
    func saveData(){
        
        var newMeaning: String = textField.text!
        
        var newString = newMeaning.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if count(newString) > 1 {
            
            if meaningIndex != nil {
                
                adolfoMeans[meaningIndex] = newMeaning
                
            } else {
                
                adolfoMeans.append(newMeaning)
                
            }
            
            NSUserDefaults.standardUserDefaults().setObject(adolfoMeans, forKey: "adolfoMeans");
            
        }
    
    }
    
    
    func dismissScreen(){
        
        textField.resignFirstResponder()
        
        self.dismissViewControllerAnimated(true, completion: {});
    
    }

    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        saveData();
        
        dismissScreen()
        
        return true
    }

}
