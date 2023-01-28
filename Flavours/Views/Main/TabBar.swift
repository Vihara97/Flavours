//
//  TabBar.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/26/23.
//

import SwiftUI

struct TabBar: View {
    
    @EnvironmentObject var model : HomeViewModel
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            DishCardView()
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
            .environmentObject(HomeViewModel())
    }
}

