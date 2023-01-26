//
//  FavouritesView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/26/23.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        NavigationView {
            Text("Favourites")
                .padding()
                .navigationTitle("Favourites")
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
