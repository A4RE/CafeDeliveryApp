//
//  CartView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(MockData.orderItems) { orderItem in
                        ListItemView(item: orderItem)
                    }
                }
            }
            .navigationTitle("Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
