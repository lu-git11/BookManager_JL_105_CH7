//
//  BookDetailView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 3/22/26.
//

import SwiftUI
struct BookDetailView: View {
    
    @Binding var book: Book
    
    @State private var showEdit: Bool = false
    
    var body: some View {
        Text("Details For:")
            .font(.headline)
            .foregroundStyle(.secondary)
            .padding()
        
        VStack(alignment: .leading, spacing: 55){
            HStack(spacing: 20){
                Image(book.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack{
                    Text(book.title)
                        .font(.largeTitle.bold())
                    Text("By: \(book.author)")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                }
            }//end HStack
            Text(book.summary)
                .lineSpacing(5)
            VStack(spacing: 5){
                VStack(spacing: 10){
                    Text("Reviews")
                        .font(.title.bold())
                    
                        if book.reviewText.isEmpty{
                        Text("No review yet")
                            .foregroundStyle(.secondary)
                        } else {
                    HStack{
                        Text(book.reviewTitle)
                                .font(.title2.bold())
                        Spacer()
                            if let rating = book.rating, rating > 0 {
                                HStack(spacing: 5){
                                    Text("\(rating)")
                                    Image(systemName: "star.fill")
                                }
                            } else {
                                Text("No rating yet")
                                    .foregroundStyle(.secondary)
                                    .opacity(0.5)
                                    .padding(.top, 8)
                           }
                        }
                    Text(book.reviewText)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Edit"){
                showEdit.toggle()
            })
            .sheet(
                isPresented: $showEdit,
                content: {
                    AddEditView(book: $book)
                })
        }//end Vstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 30)
        .font(.title3)
        .navigationTitle(book.title)
        
    } //end body
} //end view

#Preview("Sample Book") {
    //Provide a sample Book so the preview can render
   @State var sample = Book(
        title: "Sample Title",
       author: "Sample Author",
      summary: "This is a short summary used only for previewing the layout of BookDetailView.",
        image: "lotr_fellowship"
)
    BookDetailView(book: $sample)
}

