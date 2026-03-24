//
//  BookListItem.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 3/22/26.
//

import SwiftUI

struct BookListItem: View {
    var book: Book
    
    var body: some View {
        HStack(spacing: 30){
            Image(book.image)
                .resizable()
                .frame(width: 50, height: 70)
                .padding(5)
                .padding(.leading, 10)
                
            VStack(spacing: 3){
                Text(book.title)
                    .font(.title2.bold())
                Text("by: \(book.author)")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
       }
    }
}
