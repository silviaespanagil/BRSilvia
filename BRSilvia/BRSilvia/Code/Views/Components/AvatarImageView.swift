//
//  AvatarImageView.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI
struct AvatarImageView: View {
    let url: URL?
    let size: CGFloat

    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable().aspectRatio(contentMode: .fill)
        } placeholder: {
            Circle().fill(Color.beRealLightGray.opacity(0.3))
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}
