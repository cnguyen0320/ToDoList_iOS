//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
	
	@Published var user: User? = nil
	
	init(){
		
	}
	
	func fetchUser(){
		
		// if user already exists then return - no need to do anything
		guard let userId = Auth.auth().currentUser?.uid else {
			return
		}
		// get the user from the
		let db = Firestore.firestore()
		db.collection("users")
			.document(userId)
			.getDocument{ [weak self]
				snapshot, error in
				guard let data = snapshot?.data(), error == nil else{ // if user returns error then return early
					return
				}
				
				
				// generate User object
				DispatchQueue.main.async{
					self?.user = User(
						id: data["id"] as? String ?? "",
						name: data["name"] as? String ?? "",
						email: data["email"] as? String ?? "",
						joined: data["joined"] as? TimeInterval ?? 0
					)
				}
			}
		
	}
	
	// log off user
	func logoff(){
		
		do{
			try Auth.auth().signOut()
			
		}catch{
			print(error)
		}
		
	}
}
