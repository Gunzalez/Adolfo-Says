//
//  ViewController.swift
//  Adolfo Says
//
//  Created by Segun Konibire on 17/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

var adolfoMeans = [Array<String>]()

let defaultMeans = "I really feel this is the correct estimate."

let maxMeaning: Int = 20

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
        
        //NSUserDefaults.standardUserDefaults().removeObjectForKey("adolfoMeans") // TODO REMOVE
        
        if NSUserDefaults.standardUserDefaults().objectForKey("adolfoMeans") != nil {
            
            adolfoMeans = NSUserDefaults.standardUserDefaults().objectForKey("adolfoMeans") as! [Array<String>];
            
        } else {
            
            var newMeaning = [String]()
            newMeaning.append("I would rather be at home watching Game of Thrones")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
            newMeaning.removeAll()
            newMeaning.append("Actually, I have no idea but I just said that so I don't look stupid")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
            newMeaning.removeAll()
            newMeaning.append("Er, I wasn't actually listening but 8 is as good as any")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
            newMeaning.removeAll()
            newMeaning.append("I've done this many times before, and this is an accurate estimate")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
            newMeaning.removeAll()
            newMeaning.append("Where am I, what am I doing here, who are these people?")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}

