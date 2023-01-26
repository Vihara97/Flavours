//
//  TabBar.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/26/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            FavouritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

