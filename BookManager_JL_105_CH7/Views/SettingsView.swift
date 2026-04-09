//
//  Untitled.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/9/26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("SETTINGS_GRID_COLUMNS_KEY") private var gridColumns: Int = 2
    @AppStorage("SETTINGS_APPEARANCE_THEME_KEY") private var theme: Theme = .system
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $theme){
                        ForEach(Theme.allCases, id:\.self){ theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                }
                Section(header: Text("Grid")){
                    Stepper("Columns: \(gridColumns)", value: $gridColumns, in: 1...4)
                    
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
