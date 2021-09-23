//
//  ViewController.swift
//  PaymentConfirmationApp
//
//  Created by mizoz on 2021/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var costField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemField.placeholder = "ex) iPad air 4"
        costField.placeholder = "ex) 100000"
    }

    @IBAction func registerButtonAction(_ sender: Any) {
    }
    
}

