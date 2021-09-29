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
        itemField.placeholder = "ex) iPhone"
        costField.placeholder = "ex) 70000"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Console
        let paymentData = realm.objects(Payment.self)
        print("すべてのデータ\(paymentData)")
        //        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
    }
    
    // When the keyboard is displayed
    @objc private func keyboardWillShow(sender: NSNotification) {
        if costField.isFirstResponder {
            guard let userInfo = sender.userInfo else { return }
            let duration: Float = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue
            UIView.animate(withDuration: TimeInterval(duration), animations: { () -> Void in
                let transform = CGAffineTransform(translationX: 0, y: -150)
                self.view.transform = transform
            })
        }
    }
    
    // When the keyboard is closed
    @objc private func keyboardWillHide(sender: NSNotification) {
        guard let userInfo = sender.userInfo else { return }
        let duration: Float = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue
        UIView.animate(withDuration: TimeInterval(duration), animations: { () -> Void in
            self.view.transform = CGAffineTransform.identity
        })
    }
    
    // Tap screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Register
    @IBAction func registerButtonAction(_ sender: Any) {
        // Date formatting
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
        
        // Success animation
        HUD.flash(.success, delay: 1.0)
    }
    
}

