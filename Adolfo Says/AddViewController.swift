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
            
            var textToShow = adolfoMeans[meaningIndex][0]
        
            textField.text = textToShow
            
            previewLabel.text = textToShow
            
            charCountLabel.text = String(maxChar - count(textToShow))
            
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
            
            var singleMeaning: Array = [String]()
            
            singleMeaning.append(newString)
            
            if meaningIndex != nil {
                
                singleMeaning.append(adolfoMeans[meaningIndex][1])
                
                adolfoMeans[meaningIndex] = singleMeaning
                
            } else {
                
                
                singleMeaning.append("no")
                
                adolfoMeans.append(singleMeaning)
                
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
