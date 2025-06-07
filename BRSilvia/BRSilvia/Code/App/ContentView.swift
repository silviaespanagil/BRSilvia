//
//  ContentView.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Test JSON") {
                if let path = Bundle.main.path(forResource: "users", ofType: "json") {
                    print("JSON found at: \(path)")
                } else {
                    print("JSON not found")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
