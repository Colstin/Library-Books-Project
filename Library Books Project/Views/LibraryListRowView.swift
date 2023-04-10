//
//  LibraryListRowView.swift
//  Library Books Project
//
//  Created by Colstin Donaldson on 4/8/23.
//

import SwiftUI

struct LibraryListRowView: View {
    
    var model:Book
    @State var photos = ["cover1","cover2","cover3","cover4","cover5"]
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                //.aspectRatio(CGSize(width: 300, height: 400), contentMode: .fit)
                .frame(width: 335, height: 440)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.5), radius: 5, x: -5, y: 5)
                .padding()
            
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Text(model.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    
                    if model.isFavourite == true{
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color.yellow)
                    }
                    Spacer()
                }
                    
                Text(model.author)
                    .font(.subheadline)
                    .italic()
                Image(photos[model.id - 1])
                    .resizable()
                    //.aspectRatio(CGSize(width: 50, height: 50), contentMode: .fill)
                    .frame(width: 270, height: 340)
            }
        }
        
    }
}

struct LibraryListRowView_Previews: PreviewProvider {
    static var previews: some View {
      
        
        let model = LibraryModel()
        LibraryListRowView(model: model.library[0])
    }
}

