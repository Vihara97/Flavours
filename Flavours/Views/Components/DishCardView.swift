//
//  DishCardView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/27/23.
//

import SwiftUI

struct DishCardView: View {
    
    @StateObject var dishModel = HomeViewModel()
    @EnvironmentObject var model : HomeViewModel
    
    var body: some View {
        
        NavigationView {
            if(dishModel.list.count > 0){
                Text(dishModel.list[0].name)
            }else{
                Text("loading")
            }
            
            
        }
        .environmentObject(dishModel)
    }
    
}

struct DishCardView_Previews: PreviewProvider {
    static var previews: some View {
        DishCardView()
            .environmentObject(HomeViewModel())
    }
}
