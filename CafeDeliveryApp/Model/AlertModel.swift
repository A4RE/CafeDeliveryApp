//
//  AlertModel.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 10.09.2023.
//

import SwiftUI

struct AlertModel: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertModel(title: Text("Server Error"),
                                        message: Text("Data from server was invalid. Contact support."),
                                        dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertModel(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Try again later."),
                                            dismissButton: .default(Text("OK")))
        
    
    static let invalidURL       = AlertModel(title: Text("Server Error"),
                                       message: Text("There an issue in connecting to the server. Try again later."),
                                       dismissButton: .default(Text("OK")))
   
    
    static let unableToComplete = AlertModel(title: Text("Server Error"),
                                             message: Text("Unable to complete your request at this time. Check your internet connection."),
                                             dismissButton: .default(Text("OK")))
    
    static let invalidForm = AlertModel(title: Text("Invalid Form"),
                                             message: Text("Please, ensure all fields in the form has been filled out."),
                                             dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertModel(title: Text("Invalid Email"),
                                             message: Text("Please ensure your email is correct."),
                                             dismissButton: .default(Text("OK")))
}
