//
//  ContentView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/15/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack{
            Color.white
            
            RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .foregroundColor(.pink)
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20){
                Text("Welcome")
                    .foregroundColor(.black)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -90,y: -150)
                
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.black)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.black)
                
                SecureField("Password", text:$password)
                    .foregroundColor(.black)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundColor(.black)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.black)
                                
                
                Button {
                    register()
                } label: {
                    Text("Sign up")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).foregroundColor(.pink)
                        )
                }
                .padding(.top)
                .offset(y: 100)
                .contentShape(Rectangle())
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Sign in")
                        .bold()
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 100)
                .contentShape(Rectangle())
            }
            .frame(width: 350)
                
        }
        .ignoresSafeArea()
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
            
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
