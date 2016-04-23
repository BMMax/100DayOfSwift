//
//  SecondViewController.swift
//  05-day
//
//  Created by user on 16/4/23.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondField: UITextField!
    
    /*
     下面的dataStr默认是internal
     一篇关于public internal private的文章  写的很详细
     Swift新特性 -- 访问控制（Access Control）
     http://www.devtalking.com/articles/swift-access-control/
     
     */
    var dataString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondField.text = dataString
        // Do any additional setup after loading the view.
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
