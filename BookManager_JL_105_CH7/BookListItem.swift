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
        HStack{
            Image(systemName: "person")
            VStack{
                Text(book.title)
                    .font(.headline)
                Text("by \(book.author)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
       }
    }
}
