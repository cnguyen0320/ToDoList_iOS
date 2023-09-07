//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
		
	 @Published var name = ""
	 @Published var email = ""
	 @Published var password = ""

	 init(){}

	func register(){
		
		// validate the information
		guard validate() else{
			return
		}
		
		// create user in auth
		Auth.auth().createUser(withEmail: email, password: password){[weak self] result, error in
			guard let userId = result?.user.uid else {
				print(error ?? "")
				return
			}
			
			// insert user if user creation succeeds
			self?.insertUserRecord(id:userId)
		}
	 }
	
	private func insertUserRecord(id: String) {
		
		// creates new user object
		let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
		
		// add the user record into the db
		let db = Firestore.firestore()
		db.collection("users")
			.document(id)
			.setData(newUser.asDictionary())
	}
	
	private func validate() -> Bool{
		// check that name, email, and password are non empty
		guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
				!email.trimmingCharacters(in: .whitespaces).isEmpty,
				!password.trimmingCharacters(in: .whitespaces).isEmpty
		else {
			return false
		}
		
		// require minimum password length
		guard password.count >= 6 else{
			return false
		}
		
		return true
	}

}
