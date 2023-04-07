//
//  Library_Books_ProjectApp.swift
//  Library Books Project
//
//  Created by Colstin Donaldson on 4/6/23.
//

import SwiftUI

@main
struct Library_Books_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            LibraryListView()
                .environmentObject(LibraryModel())
           
        }
    }
}
