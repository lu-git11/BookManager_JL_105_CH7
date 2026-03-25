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
    @State private var showAddBook: Bool = false
    @State private var newBook = Book(title:"", author:"", summary:"", image:"lotr_fellowship")
    
    var body: some View {
        NavigationStack {
            List($books){ book in
                NavigationLink(destination: BookDetailView(book: book)){
                    BookListItem(book: book.wrappedValue)
                }
            }
            .navigationTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add Book"){
                showAddBook.toggle()
            })
            .sheet(isPresented: $showAddBook){
                if(!newBook.title.isEmpty){
                    books.append(newBook)
                }
                newBook = Book(title: "", author:"", summary: "", image: "lotr_fellowship", )
            }
            content:{
                    AddEditView(book: $newBook)
            }
       }
    }
}

#Preview {
    ContentView()
}
