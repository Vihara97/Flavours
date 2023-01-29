//
//  DishCardView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/27/23.
//

import SwiftUI
import URLImage

struct DishCardView: View {
    
    @StateObject var dishModel = HomeViewModel()
    @EnvironmentObject var model : HomeViewModel
    
    var body: some View {
            
        VStack {
            
            if(dishModel.list.count > 0){
                
                let dish = dishModel.list[8]
                let imgUrl: URL = URL(string: dish.image)!
                
                URLImage(imgUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(Text(dish.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 3, x: 0, y: 0)
                                    .frame(maxWidth: 140)
                                    .padding()
                                 , alignment: .bottom)
                }
                
            }
            
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .environmentObject(dishModel)
    }
    
}

struct DishCardView_Previews: PreviewProvider {
    static var previews: some View {
        DishCardView()
            .environmentObject(HomeViewModel())
    }
}
