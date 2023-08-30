//
//  RegisterView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct RegisterView: View {
	
	@StateObject var viewModel = RegisterViewViewModel()
	
    var body: some View {
		VStack{
			// Header
			HeaderView(title: "Register", subtitle: "", angle: -15.0, background: Color.orange)
			
			// login form
			Form{
				TextField("Full Name", text:$viewModel.name)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocorrectionDisabled()
					
				TextField("Email Address", text:$viewModel.email)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocapitalization(.none)
					.autocorrectionDisabled()
				
				SecureField("Password", text:$viewModel.password)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocapitalization(.none)
				
				TLButtonView(title: "Create Action", background: Color.green, action: {
					viewModel.register()
				})
				.padding()
			}
		}
		
        
		
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
