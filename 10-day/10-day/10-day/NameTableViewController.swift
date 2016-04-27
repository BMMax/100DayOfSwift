//
//  NameTableViewController.swift
//  10-day
//
//  Created by user on 16/4/27.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

class NameTableViewController: UITableViewController {
    
    var dataDictionary: NSDictionary?
    var sectionArray: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()

        creatData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    private func creatData(){
        let path = NSBundle.mainBundle().pathForResource("NameList", ofType: "plist")
        guard let realPath = path else{ return }
        let tempDic = NSDictionary(contentsOfFile: realPath)
        guard let realDic = tempDic else { return }
        
        dataDictionary = realDic["Persons"] as! [String : [String]]
        sectionArray = dataDictionary?.allKeys as? [String]
        sectionArray = sectionArray?.sort()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        guard let tempSection = sectionArray else { return 0 }
        return tempSection.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let tempData = dataDictionary else { return  0 }
        guard let tempSection = sectionArray else { return 0 }
        guard let tempStr = tempSection[section] as String? else { return 0 }
        guard let tempRowArray = tempData[tempStr] else {return 0 }
        return tempRowArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        let tempKey = sectionArray![indexPath.section] as String
        let tempTitles = dataDictionary![tempKey] as! [String]
        
        cell.textLabel?.text = tempTitles[indexPath.row] as String
        
        return cell
    
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray![section]
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return sectionArray
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
