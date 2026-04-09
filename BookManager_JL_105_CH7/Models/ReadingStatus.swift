//
//  ReadingStatus.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/7/26.
//

enum ReadingStatus: String, CaseIterable {
    case planToRead = "Plan to read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    
    case unknown = "Unknown"
}
