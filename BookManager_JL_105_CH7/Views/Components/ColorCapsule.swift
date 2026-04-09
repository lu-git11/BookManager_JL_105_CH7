//
//  ColorCapsule.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/7/26.
//

import SwiftUI

struct ColorCapsule: View {
    var text: String
    var color: Color = Color.accentColor
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.2))
            .clipShape(Capsule())
    }
}
