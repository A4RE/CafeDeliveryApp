//
//  CartView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct CartView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems) { orderItem in
                            ListItemView(item: orderItem)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.plain)
                    Button {
                        print("Order placed")
                    } label: {
                        Text("$99.99 - Place Order")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.TabBarColor)
                            .cornerRadius(15)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)

                }
                if orderItems.isEmpty {
                    EmptyCartView(systemImageName: "clipboard",
                                  title: "You have no items in your cart!\nPlease add an item")
                }
            }
            .navigationTitle("Cart")
        }
    }
    func deleteItems(indexSet: IndexSet) {
        orderItems.remove(atOffsets: indexSet)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
