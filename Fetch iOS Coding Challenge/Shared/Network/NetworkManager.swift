//
//  Endpoints.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/6/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    enum TheMealDBEndpoints: String {
        case dessertCategory = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        case fetchMealDetail = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    }
    
    enum URLError: String, Error {
        case invalidURL = "The URL is not valid"
    }
    
    func loadMealData<T: Decodable>(from url: URL?, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            return completion(.failure(URLError.invalidURL))
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
