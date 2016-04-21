//
//  ViewController.swift
//  02day
//
//  Created by user on 16/4/21.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit
import iAd
class ViewController: UIViewController {

    @IBOutlet weak var adView: ADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: ADBannerViewDelegate{


    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.adView.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        print("failse")
    }



}

