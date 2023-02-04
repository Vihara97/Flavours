//
//  SignUpView.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/26/23.
//

import SwiftUI
import Firebase

struct SignUpView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPasswordNotMatchingAlert : Bool = false
    @State private var showSignUpSuccessAlert : Bool = false
    @State private var showSignUpErrorAlert : Bool = false
    @State private var showLoginErrorAlert : Bool = false
    
    var body: some View {
        NavigationView{
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
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.black)
                    
                    SecureField("Password", text:$password)
                        .foregroundColor(.black)
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.black)
                    
                    SecureField("Confirm Password", text:$confirmPassword)
                        .foregroundColor(.black)
                    
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
                                RoundedRectangle(cornerRadius: 15, style: .circular).foregroundColor(.pink)
                            )
                    }
                    .alert(isPresented: $showPasswordNotMatchingAlert){
                        Alert(title: Text("Alert"), message: Text("Passwords are not same."))
                    }
                    .alert(isPresented: $showSignUpSuccessAlert){
                        Alert(title: Text("Alert"), message: Text("User registration successfull."))
                    }
                    .alert(isPresented: $showSignUpErrorAlert){
                        Alert(title: Text("Alert"), message: Text("User registration failed."))
                    }
                    .padding(.top)
                    //.offset(y: 100)
                    .contentShape(Rectangle())
                    

                    NavigationLink(destination: SignInView()){
                        VStack{
                            Text("Already have an account? Sign in")
                        }

                    }


                
                }
                .frame(width: 350)
                
            }
            .ignoresSafeArea()
        }
 
    }
        
    func register(){
        if(password == confirmPassword){
            Auth.auth().createUser(withEmail: email, password: password){result, error in
                if error != nil{
                    print(error!.localizedDescription)
                    showSignUpErrorAlert = true
                }
                else{
                    showSignUpSuccessAlert = true
                }
            }
        }
        else{
            showPasswordNotMatchingAlert = true
        }
    }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

extension View {
    func Placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

