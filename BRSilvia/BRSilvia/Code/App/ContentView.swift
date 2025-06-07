//
//  ContentView.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Stories")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.beRealDark)
                        .padding(.horizontal)
                    
                    StoryListView()
                        .frame(height: 100)
                }
                
                Divider()
                    .background(Color.beRealLightGray)
            }
            .background(Color.beRealBackground)
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(0..<5) { index in
                        PostListCard(index: index)
                    }
                }
                .padding(.vertical)
            }
            .background(Color.beRealBackground)
        }
        .background(Color.beRealBackground)
    }
}

#Preview {
    ContentView()
}
