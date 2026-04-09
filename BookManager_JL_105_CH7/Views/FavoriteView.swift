//
//  FavoriteView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/5/26.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var books: [Book]
    var animation: Namespace.ID
    @State private var selectedBook: Book?
    @State var selectedGenre: Genre? = nil
    @State var selectedReadingStatus: ReadingStatus? = nil
    //computed property
    private var favoriteBooks: [Book]{
        filterFavoriteBooks(books: books, genre: selectedGenre, readingStatus: selectedReadingStatus)
    }
    
    private var gridLayout: [GridItem]{
        [GridItem(.flexible()),GridItem(.flexible())]
    }
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                let columns = geometry.size.width > 400 ? 2 : 1
                let gridLayout = Array(repeating: GridItem(.flexible(minimum: 100)), count: columns)
                ScrollView{
                    if favoriteBooks.isEmpty{
                        Text("No Favorite Books").foregroundStyle(.secondary)
                    }else{
                        LazyVGrid(columns:gridLayout){
                            ForEach(favoriteBooks){ book in
                                SquareCardView(book: book, animation: animation)
                                    .onTapGesture {
                                        selectedBook = book
                                    }
                                    .sheet(item: $selectedBook) { book in
                                        BookDetailView(book: .constant(book), animation: animation)
                                    }
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("Favorite Books")
                
            }
            
        }
    }
}
