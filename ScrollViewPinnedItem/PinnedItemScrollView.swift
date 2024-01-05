//
//  ContentView.swift
//  ScrollViewPinnedItem
//
//  Created by GipsySh on 29.12.2023.
//

import SwiftUI

/// Struct that defines scroll view which selected item is pinned to the top border when scrolling.
struct PinnedItemScrollView: View {
    @State private var selectedItemIndex: Int?
    @State private var selectedItemOffset: CGFloat?
    
    var body: some View {
        VStack {
            Spacer()
            Text("ScrollView with pinned selected item")
            
            GeometryReader { geometry in
                ZStack {
                    ScrollView {
                        VStack(spacing: 8) {
                            ForEach(1..<21) { index in
                                ItemView(index: index, isSelected: index == selectedItemIndex)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedItemIndex = index
                                            selectedItemOffset = nil
                                        }
                                    }
                                    .background(
                                        GeometryReader { geometry in
                                            Color.clear
                                                .preference(key: OffsetPreferenceKey.self,
                                                            value: geometry.frame(in: .global).minY)
                                        }
                                    )
                                    .onPreferenceChange(OffsetPreferenceKey.self) { value in
                                        if index == selectedItemIndex {
                                            selectedItemOffset = value
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                    .background(Color.white)
                    
                    // Pinned selected item view to the top of ScrollView
                    VStack {
                        if let selectedItemIndex,
                           let selectedItemOffset,
                           selectedItemOffset < geometry.frame(in: .global).minY {
                            withAnimation {
                                ItemView(index: selectedItemIndex, isSelected: true)
                                    .padding([.top], 0.0)
                                    .padding([.leading, .trailing], 16.0)
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    PinnedItemScrollView()
}
