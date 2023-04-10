//
//  BookRatingView.swift
//  Library Books Project
//
//  Created by Colstin Donaldson on 4/6/23.
//

import SwiftUI

struct BookRatingView: View {
    
    var book:Book
    @EnvironmentObject var model:LibraryModel

    @State var photos = ["cover1","cover2","cover3","cover4","cover5"]
    @State var selectedRating = 1
    @State var buttonSelection = false

    
    var body: some View {
        //MARK: NavigationStack fixes the Stacked back buttons 
        NavigationStack {
            VStack(alignment: .leading) {
                VStack(spacing: 20) {
                    NavigationLink {
                        BookContent(book: book)
                    } label: {
                        VStack{
                            Text("Read Now!")
                            Image(photos[book.id - 1])
                                .resizable()
                                .frame(width: 200.0, height: 300.0)
                        }
                    }
                    
                    Text("Mark for Later!")
                    Button {
                        buttonSelection.toggle()
                    } label: {
                        
                        if buttonSelection == false {
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 28, height: 28)
                                
                        } else {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                        }
                    }
                    .foregroundColor(.yellow)
                    
                    
                    
                    Text("Rate \(book.title)")
                    Picker("", selection: $selectedRating){
                        ForEach(1..<6) { index in
                            Text("\(index)").tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 50.0)
                    .onChange(of: selectedRating) { newValue in
                        model.updateRating(forId: book.id, rating: selectedRating)
                    }
                }
                Spacer()
            }
            .navigationTitle(book.title)
            .foregroundColor(Color.black)
            .onAppear{
                selectedRating = book.rating
            }
            .padding()
            
        }
        //.navigationBarBackButtonHidden()
    }
}

struct BookRatingView_Previews: PreviewProvider {
    static var previews: some View {

        let model = LibraryModel()
        BookRatingView(book: model.library[0])
            .environmentObject(LibraryModel())
    }
}


/* MARK: BUTTON toggle Notes:
 1. So this does work to toggle on/off the buton however it cant save the data
 
Button {
    buttonSelection.toggle()
} label: {
    
    if buttonSelection == false {
        Image(systemName: "star")
    } else {
        Image(systemName: "star.fill")
    }
    
}

Toggle(isOn: $buttonSelection) {
    Label("", systemImage: "star.fill")
}
.toggleStyle(.button)

*/
