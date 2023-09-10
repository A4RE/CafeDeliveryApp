//
//  OrderModel.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 10.09.2023.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [ItemModel] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ item: ItemModel) {
        items.append(item)
    }
    
    func deleteItems(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}
