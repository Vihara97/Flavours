//
//  SignInView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 2/4/23.
//

import SwiftUI
import Firebase

struct SignInView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var showLoginErrorAlert : Bool = false
    @State private var isUserSignedIn : Bool = false
    
    var body: some View {
        
        if isUserSignedIn{
            HomeView()
        }
        else{
            content
        }
 
    }
    
    var content : some View {
        ZStack{
            Color.white
            
            RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .foregroundColor(.pink)
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20){
                Text("Sign In")
                    .foregroundColor(.black)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -110,y: -150)
                
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.black)
                
                SecureField("Password", text:$password)
                    .foregroundColor(.black)
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.black)
                
                Button {
                    login()
                } label: {
                    Text("Login")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 15, style: .circular).foregroundColor(.pink)
                        )
                }
                .alert(isPresented: $showLoginErrorAlert){
                    Alert(title: Text("Alert"), message: Text("User Login failed."))
                }
                .padding(.top)
                //.offset(y: 100)
                .contentShape(Rectangle())
            }
            .frame(width: 350)
            .onAppear{
                Auth.auth().addStateDidChangeListener{auth, user in
                    if user != nil {
                        isUserSignedIn.toggle()
                    }
                }
            }
            
        }
        .ignoresSafeArea()
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if error != nil{
                print(error!.localizedDescription)
                showLoginErrorAlert = true
            }
            
        }
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
