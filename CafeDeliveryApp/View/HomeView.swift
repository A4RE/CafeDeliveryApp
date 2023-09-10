//
//  HomeView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: ListViewModel = ListViewModel()
    @State private var isShowDetailView: Bool = false
    @State private var selectedItem: ItemModel?
    
    var body: some View {
        
        ZStack {
            List(viewModel.items) { item in
                ListItemView(item: item)
                    .onTapGesture {
                        selectedItem = item
                        isShowDetailView = true
                    }
            }
            .disabled(isShowDetailView ? true : false)
            .navigationTitle("Cafe List")
            .listStyle(.plain)
            .onAppear{
                viewModel.getData()
            }
            .blur(radius: isShowDetailView ? 50 : 0)
            
            if isShowDetailView {
                DetailItemView(isShowDetailView: $isShowDetailView, item: selectedItem ?? MockData.sampleItem)
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(.TabBarColor)
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
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

