//
//  DishesListView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/29/23.
//

import SwiftUI
import URLImage

struct DishesListView: View {
    
    @StateObject var dishModel = HomeViewModel()
    @EnvironmentObject var model : HomeViewModel
    
    var body: some View {
        
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15,
                      content: {
                        //loop through dishes
                        ForEach(self.dishModel.list){dish in
                            VStack {
                                
                                if(dishModel.list.count > 0){
                                    
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
