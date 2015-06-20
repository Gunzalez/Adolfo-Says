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
    
    var meaningToEdit: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.textField.delegate = self
        
        textField.becomeFirstResponder()
        
        if meaningToEdit != nil {
        
            textField.text = meaningToEdit
            
        }
        
    }
    
    func saveAndDismissView(){
        
        var newMeaning: String = textField.text
        
        adolfoMeans.append(newMeaning)
    
        self.navigationController?.popViewControllerAnimated(true)
        
        println("Governor")
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
