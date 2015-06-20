//
//  ViewController.swift
//  Adolfo Says
//
//  Created by Segun Konibire on 17/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

var adolfoMeans = [String]()

class ViewController: UIViewController {
    
    var card: String!

    @IBAction func cardPressed(sender: AnyObject) {
        
        var button = sender as! UIButton
        
        card = button.titleLabel?.text;
        
        performSegueWithIdentifier("showCard", sender: sender)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showCard") {
            
            var navController = segue.destinationViewController as! UINavigationController
            
            var viewController = navController.topViewController as! CardViewController
            
            viewController.card = card
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if adolfoMeans.count < 1 {
            
            adolfoMeans.append("I would rather wathing True Detective")
            adolfoMeans.append("Actually, I have no idea but I just said that so I don't look stupid")
            adolfoMeans.append("What, what did you say? Aww, fuck it, why not!")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}

