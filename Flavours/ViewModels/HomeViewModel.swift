//
//  HomeViewModel.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/27/23.
//

import Foundation
import Firebase

class HomeViewModel : ObservableObject {
    
    @Published var list = [Dish]()
    
    init() {
        
        
        //get a reference to the db
        let db = Firestore.firestore()
        
        //read documents
        db.collection("Dishes").getDocuments { snapshot, error in
            if error == nil {
                
                if let snapshot = snapshot{
                    
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { doc in
                            return Dish(name: doc["name"] as? String ?? "",
                                        image: doc["image"] as? String ?? "",
                                        description: doc["description"] as? String ?? "",
                                        noOfCalories: doc["noOfCalories"] as? String ?? "",
                                        dishCategory: doc["dishCategory"] as? String ?? "",
                                        isFaved: doc["isFaved"] as? Bool ?? false)
                        }
                    }
                    
                }
            }
            else{
                
            }
        }
        
    }
    
}
