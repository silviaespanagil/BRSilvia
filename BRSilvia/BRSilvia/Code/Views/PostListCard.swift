//
//  PostListCard.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI

struct PostListCard: View {
    let index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            header
            mainImage
            actionBar
        }
        .background(Color.white)
    }
}

private extension PostListCard {
    
    var header: some View {
        HStack {
            avatarImage
            VStack(alignment: .leading, spacing: 2) {
                Text("User \(index + 1)")
                    .font(.headline)
                    .foregroundColor(.beRealDark)
                
                Text("\(index + 1)h ago")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.beRealDark)
            }
        }
        .padding(.horizontal)
    }
    
    var avatarImage: some View {
        AsyncImage(url: URL(string: "https://i.pravatar.cc/40?u=\(index + 100)")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Circle().fill(Color.gray.opacity(0.3))
        }
        .frame(width: 40, height: 40)
        .clipShape(Circle())
    }
    
    var mainImage: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://picsum.photos/400/500?random=\(index)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle().fill(Color.beRealLightGray)
            }
            .frame(height: 500)
            .clipped()

            overlayImage
        }
    }

    var overlayImage: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: "https://picsum.photos/120/160?random=\(index + 50)")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle().fill(Color.gray.opacity(0.3))
                }
                .frame(width: 100, height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 3)
                )
                .shadow(color: .black.opacity(0.3), radius: 5)
                
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.top, 20)
            Spacer()
        }
    }

    var actionBar: some View {
        HStack {
            Button(action: {}) {
                HStack(spacing: 4) {
                    Image(systemName: "bubble.left")
                    Text("Comment")
                }
                .foregroundColor(.beRealDark)
                .font(.caption)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}
