//
//  ViewController.swift
//  01-day
//
//  Created by user on 16/4/21.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numbelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func topToChange(sender: UIButton) {
        if let tempNum =  Int(self.numbelLabel.text!) {
            self.numbelLabel.text = "\(tempNum + 1)"
        }
    }
    @IBAction func resetNumberLabel(sender: UIBarButtonItem) {
        
        self.numbelLabel.text = "0"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

