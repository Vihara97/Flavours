//
//  TabBar.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/26/23.
//

import SwiftUI

struct TabBar: View {
    
    
    @EnvironmentObject var model : HomeViewModel
    @EnvironmentObject var favModel : FavouritesViewModel
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.environmentObject(model)
            
            FavouritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                }.environmentObject(favModel)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(HomeViewModel())
            .environmentObject(FavouritesViewModel())
    }
}

