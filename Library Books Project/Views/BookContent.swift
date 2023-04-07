//
//  BookContent.swift
//  Library Books Project
//
//  Created by Colstin Donaldson on 4/6/23.
//

import SwiftUI

struct BookContent: View {
    
    var book:Book
    @State var page = 0
    @EnvironmentObject var model:LibraryModel
    
    var body: some View {
        TabView(selection: $page) {
            ForEach(book.content.indices, id: \.self){ index in
                VStack{
                    Text(book.title)
                       
                    Text(book.content[index]).tag(index)
                    
                    Text("\(page + 1)")
                    
                }
                .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: page) { newValue in
            model.updatePage(forId: book.id, page: page)
        }
        .onAppear{
            page = book.currentPage
        }
        
    }//b
        
}
//0..<book.content.count

struct BookContent_Previews: PreviewProvider {
    static var previews: some View {
        
     
        let model = LibraryModel()
        BookContent(book: model.library[0])
            .environmentObject(LibraryModel())
         
    }
}
