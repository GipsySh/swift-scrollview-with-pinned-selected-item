//
//  RoundedCorner.swift
//  ScrollViewPinnedItem
//
//  Created by GipsySh on 05.01.2024.
//

import SwiftUI

/// Struct that is used for selected item background to hide other scrolling views under the selected one.
/// The struct is copied from https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    RoundedCorner()
}
