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
    
    @Namespace private var animation
    
    var body: some View {
        TabView{
            BookListView(books: $books, animation: animation)
                .tabItem{
                    Label("Books", systemImage: "books.vertical.fill")
                }
            Spacer()
            FavoriteView(books: $books, animation: animation)
                .tabItem{
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}//end struct

#Preview {
    ContentView()
}
