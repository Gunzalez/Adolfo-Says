//
//  CardViewController.swift
//  Adolfo Says
//
//  Created by Segun Konibire on 18/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    var card :String!

    @IBOutlet var cardLabel: UILabel!
    
    @IBOutlet var meansLabel: UILabel!

    @IBAction func donePressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {});
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        modalTransitionStyle = .FlipHorizontal
        
        cardLabel.text = card
        
        if adolfoMeans.count > 0 {
            
            var randomNumber = Int(arc4random_uniform(UInt32(adolfoMeans.count)))
            
            meansLabel.text = adolfoMeans[randomNumber]
            
        } else {
                
            meansLabel.text = defaultMeans
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }

}
