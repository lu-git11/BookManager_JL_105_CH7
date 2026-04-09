//
//  FavToggle.swift
//  BookManager_JL_105_CH7
//
//  Created by jeffrey lullen on 4/5/26.
//

import SwiftUI
     
struct FavToggle:View {
    
    @Binding var isFavorite: Bool
    
    @State private var offset: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var opacity: CGFloat = 0
    
    var body: some View{
        ZStack{
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.title)
                .opacity(opacity)
                .scaleEffect(scale)
                .offset(y:offset)
            
            Toggle(isOn:$isFavorite){
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(isFavorite ? .red : .secondary)
                    .font(.title)
            }
            .toggleStyle(.button)
            .buttonStyle(.plain)
            .animation(.spring, value: isFavorite)
            .onChange(of: isFavorite){_, newValue in
                guard newValue == true else {
                    return
                }
                withAnimation(.spring(response:0.5, dampingFraction:0.4)){
                    scale = 1.2
                    opacity = 1
                }
                withAnimation(.easeInOut(duration:0.5).delay(0.5)){
                    offset = -100
                    opacity = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline:.now()+1.0){
                    scale = 1
                    offset = 0
                }
            }
        }//end zstack
    }//end body
}//end struct
