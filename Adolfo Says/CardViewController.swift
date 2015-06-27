//
//  CardViewController.swift
//  Adolfo Says
//
//  Created by Segun Konibire on 18/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    var card: String!
    
    var hideOverride = "Ben Howard is singing, nice cool songs, wish I could play guitar."
    
    var tempMeaning: String!

    @IBOutlet var cardLabel: UILabel!
    
    @IBOutlet var meansLabel: UILabel!
    
    @IBOutlet var hideButton: UIBarButtonItem!
    
    @IBAction func hideButtonPressed(sender: AnyObject) {
        
        if hideButton.title == "Hide" {
            
            meansLabel.text = replaceStoryPoints(hideOverride)
            
            hideButton.title = "Show"
            
            
        } else {
            
            meansLabel.text = replaceStoryPoints(tempMeaning)
            
            hideButton.title = "Hide"
            
        }
        
    }

    @IBAction func donePressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {});
        
    }
    
    
    func replaceStoryPoints(meaning: String) -> String {
        
        var theCard = " " + card + " "
        
        var newString = meaning.stringByReplacingOccurrencesOfString(" # ", withString: theCard)
        
        return newString
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        modalTransitionStyle = .FlipHorizontal
        
        cardLabel.text = card
        
        var favourites = [Array<String>]()
        
        if adolfoMeans.count > 0 {
            
            for singleMeaning in adolfoMeans {
                
                if singleMeaning[1] == "yes" {
                    
                    favourites.append(singleMeaning)
                    
                }
            
            }
            
            if favourites.isEmpty {
                
                favourites = adolfoMeans
                
            }
            
            var randomNumber = Int(arc4random_uniform(UInt32(favourites.count)))
                
            meansLabel.text = replaceStoryPoints(favourites[randomNumber][0])
            
            tempMeaning = favourites[randomNumber][0]
                
            
        } else {
            
            meansLabel.text = replaceStoryPoints(defaultMeans)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }

}
