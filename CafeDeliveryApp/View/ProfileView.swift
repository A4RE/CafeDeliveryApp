//
//  ProfileView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    @FocusState private var focusTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("First name", text: $viewModel.user.firstName)
                        .focused($focusTextField, equals: .firstName)
                        .onSubmit { focusTextField = .lastName }
                        .submitLabel(.next)
                    TextField("Last name", text: $viewModel.user.lastName)
                        .focused($focusTextField, equals: .lastName)
                        .onSubmit { focusTextField = .email }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusTextField, equals: .email)
                        .onSubmit { focusTextField = nil }
                        .submitLabel(.done)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                        .tint(.TabBarColor)
                    Button("Save changes") {
                        viewModel.saveChanges()
                    }
                    .tint(.TabBarColor)
                } header: {
                    Text("Personal info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    
                } header: {
                    Text("Requests")
                }
                .toggleStyle(.switch)
                .tint(.TabBarColor)
                
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusTextField = nil }
                }
            }
        }
        .onAppear{
            viewModel.retrieveUser()
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
