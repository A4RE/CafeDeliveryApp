//
//  DetailItemView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 10.09.2023.
//

import SwiftUI

struct DetailItemView: View {
    
    @EnvironmentObject var order: Order
    
    @Binding var isShowDetailView: Bool
    
    let item: ItemModel
    
    var body: some View {
        VStack {
            ItemRemoteImage(urlString: item.imageURL)
                .aspectRatio(contentMode: .fit)
            VStack {
                Text(item.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(item.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    VStack(spacing: 10) {
                        Text("Calories")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("\(item.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 10) {
                        Text("Carbs")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("\(item.carbs) g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 10) {
                        Text("Protein")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("\(item.protein) g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            Spacer()
            Button {
                order.add(item)
                isShowDetailView = false
            } label: {
                Text("$\(item.price, specifier: "%.2f") - Add to cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.TabBarColor)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 20)

        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowDetailView = false
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(Color.white.opacity(0.6))

                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
            }
            .padding(.all, 7)
        }
    }
}

struct DetailItemView_Previews: PreviewProvider {
    static var previews: some View {
        DetailItemView(isShowDetailView: .constant(true), item: MockData.sampleItem)
    }
}
