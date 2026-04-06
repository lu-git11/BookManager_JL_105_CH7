//
//  SquareCardView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/5/26.
//

import SwiftUI

struct SquareCardView: View {
    
    var book: Book
    var animation: Namespace.ID
    
    var body: some View {
        VStack{
            Text(book.title)
                .frame(maxWidth:.infinity)
                .font(.title2.bold())
                .foregroundStyle(.white)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding()
                .background(LinearGradient(
                    colors: [.clear,.black.opacity(0.8)],
                    startPoint: .bottom,
                    endPoint: .top
                ))
            Spacer()
            
            Text(book.author)
                .frame(maxWidth: . infinity)
                .font(.title2)
                .foregroundColor(.white)
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .padding()
                .background(LinearGradient(
                    colors: [.clear, .black.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom))
        }
        .frame(width:.infinity, height: .infinity)
        .background(
            Image(book.image)
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: book.id, in: animation)
        )
        .aspectRatio(1,contentMode: .fit)
        .cornerRadius(12)
    }
}

#Preview {
    let book = getBooks()
    @Namespace var animation
    SquareCardView(book: book[0], animation: animation)
}
