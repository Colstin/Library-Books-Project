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
        
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Text("My Library")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                GeometryReader { geo in
                    ScrollView {
                        ForEach(model.library) { item in
                            
                            NavigationLink {
                                BookRatingView(book: item)
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color.white)
                                        .frame(width: geo.size.width - 30, height: geo.size.height - 200, alignment: .center)
                                        .cornerRadius(20)
                                        .shadow(color: .black.opacity(0.5), radius: 5, x: -5, y: 5)
                                        .padding()
                                    
                                    VStack(alignment: .center) {
                                        HStack {
                                            Spacer()
                                            Text(item.title)
                                                .font(.title)
                                                .fontWeight(.bold)
                                            Spacer()
                                            
                                            if item.isFavourite == true{
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 18, height: 18)
                                                    .foregroundColor(Color.yellow)
                                            }
                                            Spacer()
                                        }
                                            
                                        Text(item.author)
                                            .font(.subheadline)
                                            .italic()
                                        Image(photos[item.id - 1])
                                            .resizable()
                                            .frame(width: geo.size.width - 70, height: geo.size.height - 300, alignment: .center)
                                        
                                    }
                                   
                                }
                            }
                        }
                        Text("By Colstin Donaldson")
                    }
                }
               
            }
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
