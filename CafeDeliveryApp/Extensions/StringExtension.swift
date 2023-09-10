//
//  StringExtension.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 10.09.2023.
//

import Foundation

extension String {
    func isValid() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
                return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
            }
    }
//    var isValidEmail: Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPredicate.evaluate(with: self)
//    }
//}
