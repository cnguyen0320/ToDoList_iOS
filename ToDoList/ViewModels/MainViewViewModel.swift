//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject{
	
	@Published var currentUserId: String = ""
	private var handler: AuthStateDidChangeListenerHandle?
	
	init(){
		// watch for the user to change
		let handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
			DispatchQueue.main.async{
				self?.currentUserId = user?.uid ?? ""
			}
		}
	}
	
	// returns True if a user is signed in
	public var isSignedIn: Bool {
		return Auth.auth().currentUser != nil
	}
}
