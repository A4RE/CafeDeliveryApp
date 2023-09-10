//
//  ProfileViewModel.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 10.09.2023.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var birthday: Date = Date()
    @Published var extraNapkins: Bool = false
    @Published var frequentRefills: Bool = false
    
    @Published var alertItem: AlertModel?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
            
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
            
        }
        return true
        
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        print("Changes has been changed successfully")
    }
}
