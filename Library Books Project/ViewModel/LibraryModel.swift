//
//  LibraryModel.swift
//  Library Books Project
//
//  Created by Colstin Donaldson on 4/6/23.
//

import Foundation

class LibraryModel:ObservableObject {
    
    @Published var library = [Book]()
    
    init(){
        
        self.library = DataParser.getLocalData()
        
    }
    
    func updateFavourite(forId: Int){
        
        if let index = library.firstIndex(where: { $0.id == forId}){
            library[index].isFavourite.toggle()
        }
    }
    
    func updateRating(forId: Int, rating: Int) {
            if let index = library.firstIndex(where: { $0.id == forId }) {
                library[index].rating = rating
            }
        }
    
    func updatePage(forId: Int, page: Int) {
           if let index = library.firstIndex(where: { $0.id == forId }) {
               library[index].currentPage = page
           }
       }
}
