//
//  ViewController.swift
//  05-day
//
//  Created by user on 16/4/23.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondVC = segue.destinationViewController as! SecondViewController
        
        secondVC.dataString = self.textField.text
    }

}

