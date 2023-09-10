//
//  HomeView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: ListViewModel = ListViewModel()
    
    var body: some View {
        
        List {
            ForEach(viewModel.items) { item in
                ListItemView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Cafe List")
        .onAppear{
            viewModel.getData()
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton )
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}

