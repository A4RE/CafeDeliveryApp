//
//  HomeView.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: ListViewModel = ListViewModel()
//    @State private var isShowDetailView: Bool = false
//    @State private var selectedItem: ItemModel?
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                List(viewModel.items) { item in
                    ListItemView(item: item)
//                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedItem = item
                            viewModel.isShowDetailView = true
                        }
                }
                .disabled(viewModel.isShowDetailView ? true : false)
                .navigationTitle("Cafe List")
                .listStyle(.plain)
                .task {
                    viewModel.getData()
                }
                .blur(radius: viewModel.isShowDetailView ? 50 : 0)
                
                if viewModel.isShowDetailView {
                    DetailItemView(isShowDetailView: $viewModel.isShowDetailView, item: viewModel.selectedItem ?? MockData.sampleItem)
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}

