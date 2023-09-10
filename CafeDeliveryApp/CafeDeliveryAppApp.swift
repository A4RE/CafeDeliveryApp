//
//  CafeDeliveryAppApp.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

@main
struct CafeDeliveryAppApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(order)
        }
    }
}
