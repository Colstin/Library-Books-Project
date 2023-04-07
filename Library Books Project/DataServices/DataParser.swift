//
//  dataParser.swift
//  Library Books Project
//
//  Created by Colstin Donaldson on 4/6/23.
//

import Foundation

class DataParser{
    
    static func getLocalData() -> [Book]{
        
        //1. get the path to the json file
        //2. checks it's not nil
        //3. Create url object
        //4. create a data object with the data at the url
        //5. Decode data with JSONDecoder()
        //6. parse the data using the decoder
        //7. OPIONAL: set unique ID's for each instance ( IF NEEDED)
        
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        guard pathString != nil else{
            return [Book]()
        }
        
        let url = URL(filePath: pathString!)
        
        do{
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do{
                let libraryData = try decoder.decode([Book].self, from: data)
                
                return libraryData
                

            } catch{
                // if it cant decode the json data
                print(error)
            }
            
        }catch{
            //cant find json
            print(error)
        }

        return [Book]()
    }
    
}
