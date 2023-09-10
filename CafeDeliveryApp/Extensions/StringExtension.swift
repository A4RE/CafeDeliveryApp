//
//  StringExtension.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 10.09.2023.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailFormat = "[A-ZO-9a-z. _%+-]+@[A-Za-20-9.-]+\\. [A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
