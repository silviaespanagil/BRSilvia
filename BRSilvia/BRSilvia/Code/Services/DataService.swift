//
//  DataService.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import Foundation

class DataService: ObservableObject {
    @Published var loadingState: LoadingState = .idle
    private var baseUsers: [User] = []
    
    init() {
        loadUsersFromJSON()
    }
    
    private func loadUsersFromJSON() {
        loadingState = .loading
        
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            loadingState = .failure(DataError.fileNotFound)
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(UserResponse.self, from: data)
            baseUsers = response.pages.flatMap { $0.users }
            loadingState = .success
            print("Loaded \(baseUsers.count) base users")
        } catch {
            loadingState = .failure(DataError.decodingFailed)
        }
    }
}

enum DataError: Error, LocalizedError {
    case fileNotFound, decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound: return "Users data not found"
        case .decodingFailed: return "Failed to parse user data"
        }
    }
}
