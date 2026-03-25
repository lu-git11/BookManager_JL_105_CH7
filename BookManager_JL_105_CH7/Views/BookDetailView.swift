//
//  BookDetailView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 3/22/26.
//

import SwiftUI
struct BookDetailView: View {
    
    @State private var newReview: Bool = false

    
    @Binding var book: Book
    
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
            VStack(spacing: 10){
                VStack(alignment: .center, spacing: 16){
                        Text("Reviews")
                            .font(.largeTitle.bold())
                        
                        if book.reviewText.isEmpty{
                            Text("No review yet")
                                .foregroundStyle(.secondary)
                        } else {
                            HStack{
                                Text(book.reviewTitle)
                                    .font(.title.bold())
                                Spacer()
                                if let rating = book.rating, rating > 0 {
                                    HStack(spacing: 5){
                                        Text("\(rating)")
                                        Image(systemName: "star.fill")
                                    }
                                }
                            }
                            Text(book.reviewText)
                                .font(.body)
                        }
                    }
                }
            }//end Vstack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 30)
            .font(.title3)
            .navigationTitle(book.title)
            .navigationBarTitleDisplayMode(.inline)
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

