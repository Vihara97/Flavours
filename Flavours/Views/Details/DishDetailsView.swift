//
//  DishDetailsView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/27/23.
//

import SwiftUI

struct DishDetailsView: View{
    var body: some View {
        NavigationView{
            Text("Dish Details")
                .navigationTitle("Dish Details")
        }

    }
}

struct DishDetailsView_Previews: PreviewProvider {
    static var previews: some View {
       DishDetailsView()
    }
}
