//
//  RegisterView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct RegisterView: View {
	
	@State var name = ""
	@State var email = ""
	@State var password = ""
	
    var body: some View {
		VStack{
			// Header
			HeaderView(title: "Register", subtitle: "", angle: -15.0, background: Color.orange)
			
			// login form
			Form{
				TextField("Full Name", text:$name)
					.textFieldStyle(DefaultTextFieldStyle())
				TextField("Email Address", text:$email)
					.textFieldStyle(DefaultTextFieldStyle())
				SecureField("Password", text:$password)
					.textFieldStyle(DefaultTextFieldStyle())
				
				TLButtonView(title: "Register", background: Color.blue, action: {
					// register
				})
				.padding(.bottom, 20)
			}
		}
		
        
		
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
