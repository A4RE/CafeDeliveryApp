//
//  TabView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
                .badge(order.items.count)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .tint(.TabBarColor)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        
        TabBarView()
    }
}
