//
//  ProfileView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("First name", text: $viewModel.firstName)
                    TextField("Last name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(false)
                    DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: .date)
                        .tint(.TabBarColor)
                    Button("Save changes") {
                        viewModel.saveChanges()
                    }
                    .tint(.TabBarColor)
                } header: {
                    Text("Personal info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
                        
                } header: {
                    Text("Requests")
                }
                .toggleStyle(.switch)
                .tint(.TabBarColor)

            }
            .navigationTitle("Profile")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}
