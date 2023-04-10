//
//  ContentView.swift
//  Library Books Project
//
//  Created by Colstin Donaldson on 4/6/23.
//

import SwiftUI

struct LibraryListView: View {
    
    @EnvironmentObject var model:LibraryModel
    @State var photos = ["cover1","cover2","cover3","cover4","cover5"]
    @State var buttonSelectionIndex = 0
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
               // GeometryReader { geo in
                    ScrollView {
                        ForEach(model.library) { item in
                            NavigationLink {
                                BookRatingView(book: item)
                               // BookContent(book: item)
                            } label: {
                                LibraryListRowView(model: item)
                            }
                        }
                        Text("By Colstin Donaldson")
                    }
               // }//geo
                
            }
            .navigationTitle("My Library")
            .padding()
        }
        .foregroundColor(Color.black) 
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryListView()
            .environmentObject(LibraryModel())
    }
}
