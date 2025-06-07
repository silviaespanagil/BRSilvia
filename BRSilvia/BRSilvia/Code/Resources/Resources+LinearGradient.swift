//
//  Resources+LinearGradient.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI

extension LinearGradient {
    
    static let beRealUnseen = LinearGradient(
        colors: [Color.green, Color.orange],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let beRealSeen = LinearGradient(
        colors: [Color.white, Color.gray],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
