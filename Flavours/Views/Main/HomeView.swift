//
//  HomeView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/26/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Flavours")
                .padding()
                .navigationTitle("Flavours")
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
