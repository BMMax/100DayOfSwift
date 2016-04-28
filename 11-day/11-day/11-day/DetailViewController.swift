//
//  DetailViewController.swift
//  11-day
//
//  Created by user on 16/4/28.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailPerson: Person! = Person()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named: detailPerson.icon!)
        self.nameLabel.text = detailPerson.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
