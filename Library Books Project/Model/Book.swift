//
//  Book.swift
//  Library Books Project
//
//  Created by Colstin Donaldson on 4/6/23.
//

import Foundation

class Book:Identifiable,Decodable {
    
    var id:Int
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    //var id:Int
    var content:[String]
}
