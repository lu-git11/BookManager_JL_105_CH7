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

    @State var genre: Genre = .unknown
    @State var readingStatus: ReadingStatus = .unknown
    
    @State var image: String = "lotr_fellowship"
    @State private var newReview: Bool = false
    
    init(book: Binding<Book>){
        self._book = book
        self._title = .init(wrappedValue:book.wrappedValue.title)
        self._author = .init(wrappedValue:book.wrappedValue.author)
        self._summary = .init(wrappedValue:book.wrappedValue.summary)

        self._genre = .init(wrappedValue:book.wrappedValue.genre)
        self._readingStatus = .init(wrappedValue:book.wrappedValue.readingStatus)
        self._image = .init(wrappedValue:book.wrappedValue.image)
    }
    
    var body: some View{
        NavigationStack{
            Form{
                Section(header: Text("Book Detail")){
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height: 150)

                    Picker("Genre", selection: $genre){
                        ForEach(Genre.allCases, id:\.self){genre in
                            Text(genre.rawValue).tag(genre)}
                    }
                    Picker("Cover", selection: $book.image){
                        Text("Fellowship of the Ring").tag("lotr_fellowship")
                        Text("Two Towers").tag("lotr_towers")
                        Text("Return of the King").tag("lotr_king")
                    }
                }

                Section(header: Text("Status")){
                    Picker("Reading Status", selection: $readingStatus){
                        ForEach(ReadingStatus.allCases, id:\.self){readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)}
                        .padding()
                    }
                    ZStack(alignment: .leading){
                        TextEditor(text:$reviewTitle)
                            .frame(height: 30)
                            .padding(.top, 1)
                        
                        if reviewTitle.isEmpty{
                            Text("Review Title")
                                .foregroundStyle(.secondary)
                                .opacity(0.5)
                        }
                    }
                            
                    ZStack(alignment: .topLeading){
                        TextEditor(text:$reviewText)
                            .frame(height: 100)
                            
                            if reviewText.isEmpty {
                                Text("Write a review here")
                                    .foregroundStyle(.secondary)
                                    .opacity(0.5)
                                    .padding(.top, 5)
                            }
                        }
                    
                    .navigationTitle(book.title.isEmpty ? "Add Book" : "Edit Book")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .confirmationAction){
                            Button("Save"){
                                book.title = title
                                book.author = author
                                book.summary = summary
                                book.rating = rating
                                book.reviewTitle = reviewTitle
                                book.reviewText = reviewText
                                book.image = image
                                dismiss()
                            }.disabled(title.isEmpty)
                        }
                    }
                }

                .navigationTitle("Edit")
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
                        book.genre = genre
                        book.readingStatus = readingStatus
                        book.image = image
                        dismiss()
                    }.disabled(title.isEmpty)
                }
            }
        }
    }
}
