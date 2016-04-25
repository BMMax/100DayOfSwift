//
//  ViewController.swift
//  09-day
//
//  Created by user on 16/4/25.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit

protocol newProtocol: NSObjectProtocol {
    func addMovie(movieName: String)
}
typealias addMoviesValue = (string: String)->Void
class ViewController: UIViewController {
    weak var delegate: newProtocol?
    @IBOutlet weak var textField: UITextField!
    var movie:addMoviesValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.becomeFirstResponder()
    }
    func addNewMovies(movies:addMoviesValue) {
        movie = movies
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITextFieldDelegate{

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        delegate?.addMovie(textField.text!)
        if (movie != nil) {
            movie!(string:textField.text!)
        }
        self.navigationController?.popViewControllerAnimated(true)
        return true
    }
    


}
