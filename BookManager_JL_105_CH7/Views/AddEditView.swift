//
//  AddEditView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 3/24/26.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var book: Book
    
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var author: String = ""
    @State var summary: String = ""
    @State var rating: Int = 0
    @State var review: String = ""
    
    @State var image: String = "lotr_fellowship"
    @State private var newReview: Bool = false
    
    init(book: Binding<Book>){
        self._book = book
        self._title = .init(wrappedValue:book.wrappedValue.title)
        self._author = .init(wrappedValue:book.wrappedValue.author)
        self._summary = .init(wrappedValue:book.wrappedValue.summary)
        self._rating = .init(wrappedValue:book.wrappedValue.rating != nil ? book.wrappedValue.rating! : 0)
        self._review = .init(wrappedValue:book.wrappedValue.reviewText)
        self._image = .init(wrappedValue:book.wrappedValue.image)
    }
    
    var body: some View{
        NavigationStack{
            Form{
                Section(header: Text("Book Detail")){
                    TextField("Title", text: $book.title)
                    TextField("Author", text: $book.author)
                    TextEditor(text: $book.summary)
                        .frame(height: 150)
                    Picker("Cover", selection: $book.image){
                        Text("Fellowship of the Ring").tag("lotr_fellowship")
                        Text("Two Towers").tag("lotr_towers")
                        Text("Return of the King").tag("lotr_king")
                    }
                }
                Section(header: Text("Review")){
                    Picker("Rating", selection: $book.rating){
                        Text("no rating selected").tag(0)
                        ForEach(1...5, id: \.self){ num in
                            Text(String(num)).tag(num)
                        }
                    }
                }
                .navigationBarItems(trailing: Button("Review"){
                    newReview.toggle()
                })
                .sheet(isPresented: $newReview){
                    NavigationStack {
                        ReviewView(book: $book)
                        Spacer()
                    }
                    .padding()
                }
                .navigationTitle("Review")
                .navigationBarTitleDisplayMode(.inline)
            }//end form
            .navigationTitle(book.title.isEmpty ? "Add Book" : "Edit Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        book.title = title
                        book.author = author
                        book.summary = summary
                        book.rating = rating
                        book.reviewText = review
                        book.image = image
                        dismiss()
                    }.disabled(title.isEmpty)
                }
            }
        }
    }
}
