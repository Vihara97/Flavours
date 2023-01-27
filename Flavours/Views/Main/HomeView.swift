//
//  HomeView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/26/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var model = HomeViewModel()
    
    var body: some View {
        NavigationView {
            
            List(model.list){ dish in
                Text(dish.name)
            }
                .navigationTitle("Flavours")
        }
    }
    
    init() {
        model.getDishDetails()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
