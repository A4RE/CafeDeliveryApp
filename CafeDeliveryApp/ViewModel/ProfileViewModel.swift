//
//  ProfileViewModel.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 10.09.2023.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user: UserModel = UserModel()
    @Published var alertItem: AlertModel?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
            
        }
        
        guard user.email.isValid() else {
            alertItem = AlertContext.invalidEmail
            return false
            
        }
        return true
        
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        do {
            user = try JSONDecoder().decode(UserModel.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}
