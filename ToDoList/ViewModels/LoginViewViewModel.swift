//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
	@Published var email = ""
	@Published var password = ""
	@Published var errorMessage = ""
	
	
	init(){}
	
	func login(){
		
		
		// return early if not valid entries
		guard validate() else{
			return
		}
		
		// log in with email
		Auth.auth().signIn(withEmail: email, password:password)
		
	}
	
	private func validate() -> Bool{
		// check that user has entered in all fields
		guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
			errorMessage = "Please fill in all fields"
			
			return false
		}
		
		// validate email
		guard email.contains("@") && email.contains(".") else{
			errorMessage = "Please enter valid email"
			return false
		}
		
		
		
		return true
	}
	
}
