//
//  FavouritesViewModel.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 2/2/23.
//

import Foundation
import Firebase

class FavouritesViewModel : ObservableObject {
    
    @Published var favList = [Dish]()
    @Published var userFavList = [UserFavourite]()
    
    init() {
        
        //get a reference to the db
        let db = Firestore.firestore()
        
        //read documents to get user favourite data
        db.collection("UserFavourites").whereField("userId", isEqualTo: "9HogqJpDoca1etIGlFEOlVDxfBy1" as Any).getDocuments { snapshot, error in
            if error == nil {
                
                if let snapshot = snapshot{
                    
                    DispatchQueue.main.async {
                        self.userFavList = snapshot.documents.map { doc in
                            return UserFavourite(userId: doc["userId"] as? String ?? "",
                                                 dishName: doc["dishName"] as? String ?? "")
                        }
                    }
                    
                }
            }
            else{
                
            }
        }
        
        
        //loop through user favourites
        for item in userFavList {
            
            //read documents to get favourite dish details
            db.collection("Dishes").getDocuments { snapshot, error in
                if error == nil {
                    
                    if let snapshot = snapshot{
                        
                        DispatchQueue.main.async {
                            self.favList = snapshot.documents.map { doc in
                                return Dish(name: doc["name"] as? String ?? "",
                                            image: doc["image"] as? String ?? "",
                                            description: doc["description"] as? String ?? "",
                                            noOfCalories: doc["noOfCalories"] as? String ?? "",
                                            dishCategory: doc["dishCategory"] as? String ?? "")
                            }
                        }
                        
                    }
                }
                else{
                    
                }
            }
        }
    
    }
    

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
    
    func getUserFavouriteData() {
        //get a reference to the db
        let db = Firestore.firestore()
        
        //read documents
        db.collection("UserFavourites").whereField("userId", isEqualTo: Firebase.Auth.auth().currentUser?.uid as Any).getDocuments { snapshot, error in
            if error == nil {
                
                if let snapshot = snapshot{
                    
                    DispatchQueue.main.async {
                        self.userFavList = snapshot.documents.map { doc in
                            return UserFavourite(userId: doc["userId"] as? String ?? "",
                                                 dishName: doc["dishName"] as? String ?? "")
                        }
                    }
                    
                }
            }
            else{
                
            }
        }
        
    }
    

    
}
