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
    
    static let orderItem = ItemModel(id: 0001, name: "Test Item 1",
                                      description: "This is description for my app",
                                      price: 100.0,
                                      imageURL: "ExampleImage",
                                      calories: 99,
                                      protein: 99,
                                      carbs: 99)
    
    static let orderItem1 = ItemModel(id: 0002, name: "Test Item 2",
                                      description: "This is description for my app",
                                      price: 100.0,
                                      imageURL: "ExampleImage",
                                      calories: 99,
                                      protein: 99,
                                      carbs: 99)
    static let orderItem2 = ItemModel(id: 0003, name: "Test Item 3",
                                      description: "This is description for my app",
                                      price: 100.0,
                                      imageURL: "ExampleImage",
                                      calories: 99,
                                      protein: 99,
                                      carbs: 99)
    static let orderItem3 = ItemModel(id: 0004, name: "Test Item 4",
                                      description: "This is description for my app",
                                      price: 100.0,
                                      imageURL: "ExampleImage",
                                      calories: 99,
                                      protein: 99,
                                      carbs: 99)
    
    static let orderItems = [orderItem, orderItem1, orderItem2, orderItem3]
}
