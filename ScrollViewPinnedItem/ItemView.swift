//
//  ItemView.swift
//  ScrollViewPinnedItem
//
//  Created by GipsySh on 05.01.2024.
//

import SwiftUI

/// Struct that defines view for ScrollView item.
struct ItemView: View {
    let index: Int
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            if isSelected {
                Rectangle()
                    .clipShape(
                        RoundedCorner(radius: 8, corners: [.bottomLeft, .bottomRight])
                    )
                    .foregroundColor(Color.white)
            }
            
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(isSelected ? Color.green : Color.gray)
                .overlay(
                    Text("Item \(index)")
                        .foregroundColor(Color.white)
                )
        }
        .frame(height: 50)
    }
}

#Preview {
    ItemView(index: 0, isSelected: true)
}
