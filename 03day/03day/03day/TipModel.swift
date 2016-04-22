//
//  TipModel.swift
//  03day
//
//  Created by user on 16/4/22.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

class TipModel: NSObject {
    
    var tip: String?
    var topPrice: String?
    var bottomPrice: String?
    
    init(tip: String,topPrice: String, bottomPrice: String){
        self.tip = tip
        self.topPrice = topPrice
        self.bottomPrice = bottomPrice
    
    }
    

}
