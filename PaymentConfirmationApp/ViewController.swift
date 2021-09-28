//
//  ViewController.swift
//  PaymentConfirmationApp
//
//  Created by mizoz on 2021/09/23.
//

import UIKit
import RealmSwift
import PKHUD

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var costField: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemField.placeholder = "ex) iPad air 4"
        costField.placeholder = "ex) 100000"
        
        // Console
        let paymentData = realm.objects(Payment.self)
        print("すべてのデータ\(paymentData)")
//        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
    }

    // Register
    @IBAction func registerButtonAction(_ sender: Any) {
        // Date Formatting
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        // Save to Realm
        let payment = Payment()
        payment.date = "\(formatter.string(from: datePicker.date))"
        payment.item = itemField.text!
        payment.cost = Int(costField.text!)!
        try! realm.write {
            realm.add(payment)
        }
        
        itemField.text = ""
        costField.text = ""
        
        // Success Animation
        HUD.flash(.success, delay: 1.0)
    }
    
}

