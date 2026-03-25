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
    
    @State var selectedCover: String = "lotr_fellowship"
    
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
            }//end form
            .navigationTitle("Add Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                    }
                }
            }
        }
    }
}
