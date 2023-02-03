//
//  ContentView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = HomeViewModel()
    @StateObject var favModel = FavouritesViewModel()
    
    var body: some View {
        VStack {
            TabBar()
                .environmentObject(model)
                .environmentObject(favModel)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

