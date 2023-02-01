//
//  DishDetailsView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/27/23.
//

import SwiftUI
import URLImage

struct DishDetailsView: View{
    
    @StateObject var dishModel = HomeViewModel()
    @EnvironmentObject var model : HomeViewModel
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                if(dishModel.list.count > 0){
                    
                    let dish = dishModel.list[0]
                    let imgUrl: URL = URL(string: dish.image)!
                    
                    URLImage(imgUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    .frame(height: 500)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]), startPoint: .top, endPoint: .bottom))
                    
                    
                    VStack(spacing: 20){
                        Text(dish.name)
                            .font(.largeTitle)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: 380, alignment: .leading)
                                                    
                        HStack{
                            Image(systemName: "flame.fill")
                                .frame(maxWidth: 20, alignment: .leading)
                            
                            if !dish.noOfCalories.isEmpty{
                                Text(dish.noOfCalories + " Calories")
                                    .font(.headline)
                                    .foregroundColor(.red)
                                    .frame(maxWidth: 350, alignment: .leading)
                            }

                        }
                        if !dish.description.isEmpty{
                            VStack{
                                Text(dish.description)
                                    .font(.body)
                                    .frame(maxWidth: 380, alignment: .leading)
                            }
                        }
                        
                            VStack{
                                Text("# " + dish.dishCategory)
                                    .font(.headline)
                                    .frame(maxWidth: 380, alignment: .leading)
                            }
                        
                        HStack{
                            VStack{
                                Image(systemName: dish.isFaved ? "heart.fill" : "heart")
                                    .font(.system(size: 35))
                                    .onTapGesture{
                                        let isFaved = dish.isFaved ?? true
                                    }
                            }

                    }
                        .frame(maxWidth: 380, alignment: .center)
                    }
                    .padding(.horizontal)
                }
                
            }
        .ignoresSafeArea(.container, edges: .top)
        .environmentObject(dishModel)


    }
}

struct DishDetailsView_Previews: PreviewProvider {
    static var previews: some View {
       DishDetailsView()
        .environmentObject(HomeViewModel())
    }
}
