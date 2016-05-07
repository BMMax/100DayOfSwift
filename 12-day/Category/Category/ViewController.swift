//
//  ViewController.swift
//  Category
//
//  Created by user on 16/5/6.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        view.addGestureRecognizer(UITapGestureRecognizer.init(trailingClosure: { 
//            print(000000)
//        }))

        view.addGestureRecognizer(UITapGestureRecognizer.init(gestureClosure:{
        
           _ in print(999999)
            
        }))
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

