//
//  utils.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/5/26.
//

func filterFavoriteBooks(
    books:[Book],
    genre:Genre? = nil,
    readingStatus:ReadingStatus? = nil
)-> [Book]{
    return books.filter{
        $0.isFavorite
        && (
            genre == nil
            || $0.genre == genre
        ) && (
            readingStatus == nil
            || $0.readingStatus == readingStatus
        )
    }
}
