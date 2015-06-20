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
        
        var adolfloMeans = adolfoMeans[indexPath.row]
        
        cell.textLabel?.text = adolfloMeans;

        return cell
        
    }

    
    override func viewDidAppear(animated: Bool) {
        
        tableList.reloadData()
        
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            //NSUserDefaults.standardUserDefaults().setObject(memorablePlaces, forKey: "memorablePlaces");
            
            adolfoMeans.removeAtIndex(indexPath.row)
            
            tableList.reloadData()
        }
    }
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "edit") {
        
            var navController = segue.destinationViewController as! UINavigationController
            
            var viewController = navController.topViewController as! AddViewController
            
            var selectedIndex = self.tableList.indexPathForCell(sender as! UITableViewCell)
            
            viewController.meaningToEdit = adolfoMeans[selectedIndex!.row]
            
            
//            let backBtn = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
//            navigationItem.leftBarButtonItem = backBtn
//            navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "YourFontName", size: 20)!], forState: UIControlState.Normal)
//            
            
            viewController.navigationItem.leftBarButtonItem?.title = "Dance"
            
            viewController.navigationItem.title = "Edit"
            
        }
        
    }
    
    


}
