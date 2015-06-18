//
//  ViewController.swift
//  Adolfo Says
//
//  Created by Segun Konibire on 17/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var card: String!

    @IBAction func cardPressed(sender: AnyObject) {
        
        var button = sender as! UIButton
        card = button.titleLabel?.text;
        
        performSegueWithIdentifier("showCard", sender: sender)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showCard") {
            
            let navController = segue.destinationViewController as! UINavigationController
            
            let viewController = navController.topViewController as! CardViewController
            
            viewController.card = card
        }
    }


}

