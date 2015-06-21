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
            
            adolfoMeans.append("I would rather be at home watching Game of Thrones")
            adolfoMeans.append("Actually, I have no idea but I just said that so I don't look stupid")
            adolfoMeans.append("Er, I wasn't actually listening but 8 is as good as any")
            adolfoMeans.append("I've done this many times before, and this is an accurate estimate")
            adolfoMeans.append("Where am I, what am I doing here, who are these people?")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}

