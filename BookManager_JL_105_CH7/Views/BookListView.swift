//
//  BookListView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/5/26.
//

import SwiftUI
import SwiftData
    
struct BookListView: View {
    
    @Binding var books: [Book]
    var animation: Namespace.ID
    @State private var showAddBook: Bool = false
    @State private var newBook = Book(title:"", author:"", summary:"", image:"lotr_fellowship")
    
    var body: some View {
        NavigationStack {
            List($books){ book in
                NavigationLink(destination: BookDetailView(book: book, animation: animation)){
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
