//
//  MoviesTableViewController.swift
//  09-day
//
//  Created by user on 16/4/25.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit



class MoviesTableViewController: UITableViewController {
    private var movieArray: [String] = ["Iron Man", "Ratatouille", "The Matrix", "Office Space", "Shaolin Soccer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBAction func addMovies(sender: UIBarButtonItem) {
        
        let addMovies = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("addMoviesVC") as! ViewController

        
        /*
         
         当闭包和捕获的实例总是互相引用时并且总是同时销毁时，将闭包内的捕获定义为无主引用。
         当捕获引用有时可能会是  nil  时，则定义为弱引用。弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为  nil  。这使我们可以在闭包内检查它们是否存在。
         
         
         */
        addMovies.addNewMovies { [weak self](string) in
            if let weakSelf = self{
                weakSelf.movieArray.append(string)
                weakSelf.tableView.reloadData()
            
            }
    
        }
        self.navigationController?.pushViewController(addMovies, animated: true)
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movieArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("momo", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = movieArray[indexPath.row]
        return cell
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
