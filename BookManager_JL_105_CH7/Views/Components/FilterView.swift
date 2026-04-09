//
//  FiltersView.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/9/26.
//

import SwiftUI

struct FilterView: View {
    @Binding var selectedGenre: Genre?
    @Binding var selectedReadingStatus: ReadingStatus?
    
    var body: some View{
        NavigationStack{
            Form{
                Section(header: Text("Select Genre")){
                    Picker("Genre", selection: $selectedGenre){
                        Text("No genre selected").tag(nil as Genre?)
                        ForEach(Genre.allCases, id:\.self){genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                Section(header: Text("Select Reading Status")){
                    Picker("Reading Status", selection: $selectedReadingStatus){
                        Text("No status selected").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id:\.self){readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                        }
                    }
                }
            }//end Form
            .padding(.top, -20)
            .toolbar{
                ToolbarItem(placement: .principal){
                   Text("Filters")
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Clear"){
                        self.selectedGenre = nil
                        self.selectedReadingStatus = nil
                    }
                }
            }
           
//            .navigationTitle("Apply Filter")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(trailing: Button("Clear"){
//                self.selectedGenre = nil
//                self.selectedReadingStatus = nil
//            })
        }//end NAv Stack
    } //end body
}// end view
