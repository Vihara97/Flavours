//
//  FavouriteDishDetailsView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 2/3/23.
//

import SwiftUI
import URLImage
import Firebase

struct FavouriteDishDetailsView: View {
    
    @StateObject var favDishModel = FavouritesViewModel()
    @EnvironmentObject var favModel : FavouritesViewModel
    @State private var isPressed : Bool = false
    
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                if(favDishModel.favList.count > 0){
                    
                    let dish = favDishModel.favList[0]
                    let imgUrl: URL = URL(string: dish.image)!
                    
                    URLImage(imgUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    .frame(height: 450)
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
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "heart.fill")
                                        .font(.system(size: 35))
                                        .foregroundColor(isPressed ? Color.black : Color.red)
                                        .onTapGesture{
                                            self.isPressed.toggle()
                                            addData(userId: Firebase.Auth.auth().currentUser!.uid, dishName: dish.name)
                                        }
                                }
                                

                            }

                    }
                        .frame(maxWidth: 380, alignment: .center)
                    }
                    .padding(.horizontal)
                }
                
            }
        .ignoresSafeArea(.container, edges: .top)
        .environmentObject(favDishModel)


    }
    
    //add dish to favourites
    func addData(userId : String, dishName : String){
        //get a reference to the db
        let db = Firestore.firestore()
        
        //add documents to db collection
        db.collection("UserFavourites").addDocument(data: ["userId": userId, "dishName": dishName ]) { error in
            if error == nil {
                
            }
            else{
                
            }
        }
        
    }
}

struct FavouriteDishDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteDishDetailsView()
            .environmentObject(FavouritesViewModel())
    }
}
