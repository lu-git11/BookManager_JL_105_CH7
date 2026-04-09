//
//  api.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 3/22/26.
//

func getBooks() -> [Book] {
    return [
        Book(
            title: "Fellowship of The Ring",
            author: "Jim Martin",
            summary: "Lorem ipsum dolor sit amet, consec adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure  pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: "lotr_fellowship",
            isFavorite: true,
            genre: .horror
            
        ),
        Book(
            title: "Return of The King",
            author: "Jan Martin",
            summary: "Lorem ipsum dolor sit amet, consectetur ascing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure  pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: "lotr_king"
            
        ),
        Book(
            title: "The Two Towers",
            author: "Jon Martin",
            summary: "Lorem ipsum dolor sit amet, adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure  pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: "lotr_towers"
            
        ),
        Book(
            title: "Lord of The Rings",
            author: "Jam Martin",
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure  pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: "theonering"
            
        )
    ]
}
