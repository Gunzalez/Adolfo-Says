//
//  ListMeansTableViewController.swift
//  Adolfo Says
//
//  Created by Segun Konibire on 17/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    @IBOutlet var tableList: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        
        longPress.minimumPressDuration = 0.5
        
        tableList.addGestureRecognizer(longPress)
    
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        if ( gestureRecognizer.state == UIGestureRecognizerState.Began ){
            
            var touchPoint = gestureRecognizer.locationInView(self.tableList)
            
            var indexPath = tableList.indexPathForRowAtPoint(touchPoint)
            
            for var index:Int=0; index < adolfoMeans.count; index++ {
                
                if index != indexPath!.row {
                    
                   adolfoMeans[index][1] = "no"
                    
                }
        
            }
            
            if adolfoMeans[indexPath!.row][1] == "yes" {
                
                adolfoMeans[indexPath!.row][1] = "no"
                
            } else {
                
                adolfoMeans[indexPath!.row][1] = "yes"
                
            }
            
            NSUserDefaults.standardUserDefaults().setObject(adolfoMeans, forKey: "adolfoMeans");
            
            tableList.reloadData()

        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return adolfoMeans.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = adolfoMeans[indexPath.row][0]
        
        if adolfoMeans[indexPath.row][1] == "yes" {
            
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            
        } else {
            
            cell.accessoryType = UITableViewCellAccessoryType.None
            
        }

        return cell
        
    }

    
    override func viewDidAppear(animated: Bool) {
        
        tableList.reloadData()
        
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            adolfoMeans.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(adolfoMeans, forKey: "adolfoMeans");
            
            tableList.reloadData()
            
        }
    }
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "edit") {
        
            var navController = segue.destinationViewController as! UINavigationController
            
            var viewController = navController.topViewController as! AddViewController
            
            var selectedIndex = self.tableList.indexPathForCell(sender as! UITableViewCell)
            
            viewController.meaningIndex = selectedIndex!.row
            
            viewController.navigationItem.title = "Edit Meaning"
            
        }
        
    }
    
}
