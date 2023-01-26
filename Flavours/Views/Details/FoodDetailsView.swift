//
//  FoodDetailsView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/26/23.
//

import SwiftUI

struct FoodDetailsView: View {
    var body: some View {
        NavigationView{
            Text("Cuisine Details")
                .navigationTitle("Cuisine Details")
        }

    }
}

struct FoodDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailsView()
    }
}
