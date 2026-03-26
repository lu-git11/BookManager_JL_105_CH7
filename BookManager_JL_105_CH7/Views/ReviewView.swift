//
//  ReviewView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 3/25/26.
//

import SwiftUI

struct ReviewView: View {
    
    @Binding var book: Book
    
    @Environment(\.dismiss) var dismiss
    
    @State private var reviewTitle: String = ""
    @State private var review: String = ""
    @State private var rating: Int = 0
    
    var body: some View{
        NavigationStack{
            Form{
                Section(header: Text("Review")){
                    Stepper(value: $rating, in: 0...5){
                        Text("Rating: \(rating)/5")
                    }
                    TextField("Review title", text:$reviewTitle)
                        .foregroundStyle(.secondary)
                        .opacity(1)
                    ZStack(alignment: .topLeading){
                        TextEditor(text:$review)
                            .frame(height: 100)
                        
                        if review.isEmpty {
                            Text("Write a review here")
                                .foregroundStyle(.secondary)
                                .opacity(0.5)
                                .padding(.top, 8)
                        }
                    }
                }
            }//end form
            .onAppear {
                reviewTitle = book.reviewTitle
                review = book.reviewText
                rating = book.rating ?? 0
            }
            .navigationTitle("Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){ dismiss() }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        book.reviewTitle = reviewTitle.trimmingCharacters(in: .whitespacesAndNewlines)
                        book.reviewText = review.trimmingCharacters(in: .whitespacesAndNewlines)
                        book.rating = rating
                        dismiss()
                    }
                }
            }
            
        }
    }
}

