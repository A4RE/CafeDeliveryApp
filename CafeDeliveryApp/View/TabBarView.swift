//
//  TabView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .tint(Color("TabBarColor"))
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
