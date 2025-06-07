//
//  LoadingState.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import Foundation

enum LoadingState {
    case idle
    case loading
    case success
    case failure(Error)
    
    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
    
    var error: Error? {
        if case .failure(let error) = self { return error }
        return nil
    }
}
