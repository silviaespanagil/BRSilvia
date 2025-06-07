//
//  CircularIconButtonView.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI

struct CircularIconButtonView: View {
    let systemName: String
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void
    let size: CGFloat

    init(systemName: String,
         foregroundColor: Color = .white,
         backgroundColor: Color = .beRealLightGray.opacity(0.5),
         size: CGFloat = 44,
         action: @escaping () -> Void) {
        self.systemName = systemName
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.size = size
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.title2)
                .foregroundColor(foregroundColor)
                .frame(width: size, height: size)
                .background(
                    Circle()
                        .fill(backgroundColor)
                )
        }
    }
}
