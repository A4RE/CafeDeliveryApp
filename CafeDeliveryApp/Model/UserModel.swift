//
//  UserModel.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 10.09.2023.
//

import Foundation

struct UserModel: Codable {
    var firstName           = ""
    var lastName            = ""
    var email               = ""
    var birthday            = Date()
    var extraNapkins        = false
    var frequentRefills     = false
}
