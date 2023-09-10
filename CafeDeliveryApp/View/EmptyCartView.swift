//
//  EmptyCartView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 10.09.2023.
//

import SwiftUI

struct EmptyCartView: View {
    
    let systemImageName: String
    let title: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Image(systemName: systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                    .foregroundColor(.secondary)
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y: -70)
        }
    }
}

struct EmptyCartView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCartView(systemImageName: "clipboard", title: "You have no items in your cart!\nPlease add an item")
    }
}
