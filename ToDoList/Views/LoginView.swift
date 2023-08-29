//
//  LoginView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct LoginView: View {
	
	@State var email = ""
	@State var password = ""
	
    var body: some View {
		NavigationView{
			VStack{
				
				HeaderView(title: "To Do List", subtitle: "Get it done!", angle: 15.0, background: Color.pink)
					
				// login form
				Form{
					TextField("Email Address", text:$email)
						.textFieldStyle(DefaultTextFieldStyle())
					SecureField("Password", text:$password)
						.textFieldStyle(DefaultTextFieldStyle())
					
					TLButtonView(title: "Log in", background: Color.blue, action: {
						// log in
					})
					.padding(.bottom, 20)
				}
				
				
				
				// create account
				VStack{
					Text("New here?")
					NavigationLink("Create Account", destination: RegisterView())
				}.padding(.bottom, 50)
				
				Spacer()
			}
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
