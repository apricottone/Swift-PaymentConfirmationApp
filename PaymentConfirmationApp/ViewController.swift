//
//  ViewController.swift
//  PaymentConfirmationApp
//
//  Created by mizoz on 2021/09/23.
//

import UIKit
import RealmSwift

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
    }

    // Register
    @IBAction func registerButtonAction(_ sender: Any) {
        let payment = Payment()
        payment.item = itemField.text!
        payment.cost = Int(costField.text!)!
        try! realm.write {
            realm.add(payment)
        }
    }
    
}

