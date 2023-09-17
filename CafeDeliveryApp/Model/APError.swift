//
//  APError.swift
//  CafeDeliveryApp
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
