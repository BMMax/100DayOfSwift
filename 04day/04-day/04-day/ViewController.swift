//
//  ViewController.swift
//  04-day
//
//  Created by user on 16/4/22.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBAction func updateTime(sender: UIButton) {
        
        updateTime()
        
    }
    private func updateTime(){
    
        let dateFormatter = NSDateFormatter()
        //dateFormatter.dateStyle = .LongStyle
        dateFormatter.locale = NSLocale.init(localeIdentifier: "zh_CN")
        dateFormatter.dateFormat = "yyyy-MM-dd a HH:mm:ss"
      //  dateFormatter.timeStyle = .MediumStyle
        currentTimeLabel.text = dateFormatter.stringFromDate(NSDate())
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

