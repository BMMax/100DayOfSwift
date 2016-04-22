//
//  ViewController.swift
//  03day
//
//  Created by user on 16/4/21.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

private extension Selector{
    
    static let finishTapped = #selector(ViewController.finishTapped(_:))
    
}
class ViewController: UIViewController {

    @IBOutlet weak var tipView: TipView!
    @IBOutlet weak var topField: UITextField!
    private var tipModel:TipModel?
    @IBAction func sliderChange(sender: UISlider) {
        
        let value = Double (sender.value)
        let tempInt = Int(value * 100)
        guard let newTipModel = tipModel else { return }
        guard let topText = topField.text else { return }
        guard let topDouble = Double(topText) else { return }
        let topPrice = Double(topDouble * value)
        let bottomPrice = topDouble + topPrice
        newTipModel.tip = "Tip%\(tempInt)"
        newTipModel.topPrice = String(format: "%.2f", topPrice)
        newTipModel.bottomPrice = String(format: "%.2f", bottomPrice)
        
        print(tipView.tipModel)
        tipView.tipModel = newTipModel


        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tipModel = TipModel.init(tip: "%15", topPrice: "$0.00", bottomPrice: "$0.00")
        
        createTextFieldTopButton()// Do any additional setup after loading the view, typically from a nib.
    }

    @objc private func finishTapped(sender:UIBarButtonItem){
    
        self.view.endEditing(true)
    
    }
    
    private func createTextFieldTopButton(){
    
        let toolbar = UIToolbar()
        let barBtn = UIBarButtonItem.init(title: "完成", style: .Plain, target: self, action: .finishTapped)
        // 完成按钮显示在键盘的右边
        let filexItem = UIBarButtonItem.init(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let items = [filexItem,barBtn]
        toolbar.setItems(items, animated: false)
        toolbar.sizeToFit()
        self.topField.inputAccessoryView = toolbar

    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

