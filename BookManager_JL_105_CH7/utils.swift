//
//  utils.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/5/26.
//

func filterFavoriteBooks(books:[Book]) -> [Book]{
    
    return books.filter{
        $0.isFavorite
    }
}
