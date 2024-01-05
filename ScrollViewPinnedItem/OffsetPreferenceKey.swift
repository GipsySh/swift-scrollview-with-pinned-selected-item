//
//  OffsetPreferenceKey.swift
//  ScrollViewPinnedItem
//
//  Created by GipsySh on 05.01.2024.
//

import SwiftUI

/// Preference key that is used to define ScrollView item view offset.
struct OffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 0.0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
