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
        
        let imgurl: URL = URL(string: "https://www.seriouseats.com/thmb/ydRx2uJ9KWLplPH6FOnPuvta1gw=/750x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__images__20120525-grilled-side-dishes-appetizers-memorial-day-09-07de349927bb4dd187546f9b5b7eec07.jpeg")!
            
        NavigationView {
            
            URLImage(imgurl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
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
