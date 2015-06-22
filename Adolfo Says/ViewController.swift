//
//  ViewController.swift
//  Adolfo Says
//
//  Created by Segun Konibire on 17/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

var adolfoMeans = [Dictionary<String, Bool>]()

let defaultMeans = "I really feel this is the correct estimate"

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
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey("adolfoMeans") // TODO REMOVE
        
        if NSUserDefaults.standardUserDefaults().objectForKey("adolfoMeans") != nil {
            
            adolfoMeans = NSUserDefaults.standardUserDefaults().objectForKey("adolfoMeans") as! [Dictionary<String, Bool>];
            
        } else {
            
            var singleMeaning: Dictionary = [String: Bool]()
            singleMeaning["I would rather be at home watching Game of Thrones"] = false
            adolfoMeans.append(singleMeaning)
            
            singleMeaning["Actually, I have no idea but I just said that so I don't look stupid"] = false
            adolfoMeans.append(singleMeaning)
            
            singleMeaning["Er, I wasn't actually listening but 8 is as good as any"] = false
            adolfoMeans.append(singleMeaning)
            
            singleMeaning["I've done this many times before, and this is an accurate estimate"] = false
            adolfoMeans.append(singleMeaning)
            
            singleMeaning["Where am I, what am I doing here, who are these people?"] = false
            adolfoMeans.append(singleMeaning)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}

