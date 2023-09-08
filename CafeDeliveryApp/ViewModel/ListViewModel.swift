//
//  ListViewModel.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 09.09.2023.
//

import SwiftUI

final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    func getData() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let items):
                    self.items = items
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
