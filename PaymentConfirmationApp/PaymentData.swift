//
//  PaymentData.swift
//  PaymentConfirmationApp
//
//  Created by mizoz on 2021/09/26.
//

import Foundation
import RealmSwift

class Payment: Object {
    @objc dynamic var date = ""
    @objc dynamic var item = ""
    @objc dynamic var cost = 0
}
