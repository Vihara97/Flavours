//
//  HomeView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/26/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                DishesListView(dishModel : model)
            }
            .navigationTitle("Flavours")
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
