//
//  NetworkManager.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let apptizerUrl = baseUrl + "appetizers"
    
    init() {
        
    }
    
    func getAppetizers(completed: @escaping (Result<[ItemModel], APError>) -> Void) {
        guard let url = URL(string: apptizerUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ItemResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
        
    }
}
