//
//  ListViewModel.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 09.09.2023.
//

import SwiftUI

@MainActor final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    @Published var alertItem: AlertModel?
    @Published var isLoading: Bool = false
    @Published var isShowDetailView: Bool = false
    @Published var selectedItem: ItemModel?
    
    //    func getData() {
    //        isLoading = true
    //        NetworkManager.shared.getAppetizers { [self] result in
    //            DispatchQueue.main.async {
    //                isLoading = false
    //                switch result {
    //                case .success(let items):
    //
    //                    self.items = items
    //
    //                case .failure(let error):
    //                    switch error {
    //                    case .invalidResponse:
    //                        alertItem = AlertContext.invalidResponse
    //
    //                    case .invalidData:
    //                        alertItem = AlertContext.invalidData
    //
    //                    case .invalidURL:
    //                        alertItem = AlertContext.invalidURL
    //
    //                    case .unableToComplete:
    //                        alertItem = AlertContext.unableToComplete
    //                    }
    //                }
    //            }
    //        }
    //    }
    func getData() {
        isLoading = true
        Task {
            do {
                items = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.genericError
                }
                isLoading = false
            }
        }
    }
}
