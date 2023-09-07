//
//  LoginView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct LoginView: View {
	
	@StateObject var viewModel = LoginViewViewModel()
	
	
    var body: some View {
		NavigationView{
			VStack{
				
				HeaderView(title: "To Do List", subtitle: "Get it done!", angle: 15.0, background: Color.pink)
				
				// displays the error message if one exists
				if !viewModel.errorMessage.isEmpty {
					Text(viewModel.errorMessage)
						.foregroundColor(Color.red)
				}
				
				// login form
				Form{
					TextField("Email Address", text:$viewModel.email)
						.textFieldStyle(DefaultTextFieldStyle())
					SecureField("Password", text:$viewModel.password)
						.textFieldStyle(DefaultTextFieldStyle())
					
					TLButtonView(title: "Log in", background: Color.blue, action: {
						viewModel.login()
					})
					.padding()
				
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
