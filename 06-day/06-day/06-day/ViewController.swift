//
//  ViewController.swift
//  06-day
//
//  Created by user on 16/4/25.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

extension Selector{
    
    static let  swipeToResign =  #selector(ViewController.swipeToResign)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var topTextView: UITextView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        topTextView.becomeFirstResponder()
        creatLeftNavigationItem()
        creatSwipeGes()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func creatLeftNavigationItem(){
        let leftBtn = UIButton(frame: CGRectMake(0,0,25,25))
        leftBtn.setBackgroundImage(UIImage(named: "navigation_back_button"), forState: .Normal)
        let leftItem = UIBarButtonItem(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem
        
    }
    func creatSwipeGes()  {
        let swipeGes = UISwipeGestureRecognizer(target: self, action: .swipeToResign)
        swipeGes.direction = .Down
        view.addGestureRecognizer(swipeGes)
    }
    func swipeToResign()  {
        
        topTextView.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

