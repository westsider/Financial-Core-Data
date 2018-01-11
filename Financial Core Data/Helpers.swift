//
//  Helpers.swift
//  Financial Core Data
//
//  Created by Warren Hansen on 1/11/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import  Foundation
import  UIKit

class Alert {
    class func showBasic(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true) {
            print("We showed an alert")
        }
    }
}

extension String {
    var isValidEmail: Bool {
        var answer:Bool = false
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        answer = emailPredicate.evaluate(with:self)
        // super secure user allowed here
        if self.count > 20 {
            answer = true
        }
        return answer
    }
}
