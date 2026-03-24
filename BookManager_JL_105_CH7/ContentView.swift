//
//  ContentView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 3/22/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var books = getBooks()
    
    var body: some View {
        NavigationStack {
            List($books){ book in
                NavigationLink(destination: BookDetailView(book: book)){
                    BookListItem(book: book.wrappedValue)
                }
            }
       }
    }
}

#Preview {
    ContentView()
}
