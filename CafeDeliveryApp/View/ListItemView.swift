//
//  ListItemView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct ListItemView: View {
    
    
    let item: ItemModel
    
    var body: some View {
        HStack(spacing: 20) {
            Image(item.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 30) {
                Text(item.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("$\(item.price, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.leading, 5)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(item: MockData.sampleItem)
    }
}
