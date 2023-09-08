//
//  ItemModel.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import Foundation

struct ItemModel: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct ItemResponse: Decodable {
    let request: [ItemModel]
}

struct MockData {
    
    static let sampleItem = ItemModel(id: 0001, name: "Test Item",
                                      description: "This is description for my app",
                                      price: 100.0,
                                      imageURL: "ExampleImage",
                                      calories: 99,
                                      protein: 99,
                                      carbs: 99)
    
    static let items = [sampleItem, sampleItem, sampleItem, sampleItem]
}
