//
//  StarView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 3/28/26.
//

import SwiftUI

struct StarView: View {
    
    let rating: Int

    var body: some View {
        HStack(spacing: 5) {
            ForEach(1...5, id: \.self) { number in
                Image(systemName: number <= self.rating ? "star.fill" : "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview("StarView Examples") {
    VStack(alignment: .leading, spacing: 12) {
        HStack { StarView(rating: 3) }
    }
    .padding()
}

