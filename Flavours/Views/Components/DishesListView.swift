//
//  DishesListView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/29/23.
//

import SwiftUI

struct DishesListView: View {
    
    @StateObject var dishModel = HomeViewModel()
    @EnvironmentObject var model : HomeViewModel
    
    var body: some View {
        
        let dishes = dishModel.list
        
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15,
                      content: {
                        ForEach(dishes){dish in
                            DishCardView(dishModel: dishModel)
                        }
                      })
                .padding(.top)
        }
        .padding(.horizontal)
        .environmentObject(dishModel)
    }
}

struct DishesListView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            DishesListView()
                .environmentObject(HomeViewModel())
        }
    }
}
