//
//  BookDetailView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 3/22/26.
//

import SwiftUI
struct BookDetailView: View {
    
    var book: Book
    
    var body: some View {
        Text("Details For:")
            .font(.headline)
            .foregroundStyle(.secondary)
            .padding()
        VStack(spacing: 50){
                HStack(spacing: 40){
                    Image(book.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack{
                        Text(book.title)
                            .font(.largeTitle.bold())
                        Text(book.author)
                            .font(.title)
                    }
                }//edn HStack
                Text(book.summary)
                    .lineSpacing(5)
            }//end Vstack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 30)
            .font(.title3)
            .navigationTitle(book.title)
            .navigationBarTitleDisplayMode(.inline)
    } //end body
} //end view

#Preview("Sample Book") {
    // Provide a sample Book so the preview can render
    let sample = Book(
        title: "Sample Title",
        author: "Sample Author",
        summary: "This is a short summary used only for previewing the layout of BookDetailView.",
        image: "lotr_fellowship"
    )
    BookDetailView(book: sample)
}

