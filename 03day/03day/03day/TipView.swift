//
//  TipView.swift
//  03day
//
//  Created by user on 16/4/22.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

class TipView: UIView {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipMoneyLabel: UILabel!
    @IBOutlet weak var totalMoenyLabel: UILabel!
    
    var tipModel: TipModel?{
    
    
        didSet{
            guard let newModel = tipModel else { return }
            self.tipLabel.text = newModel.tip
            self.tipMoneyLabel.text = newModel.topPrice
            self.totalMoenyLabel.text = newModel.bottomPrice

        }
    
    }
}
