//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// view model for single todo list item
class ToDoListItemViewViewModel: ObservableObject {
	
	init(){
		
	}
	
	
	/// Toggle the done status of an item
	/// - Parameter item: To do list item to complete
	func toggleIsDone (item: ToDoListItem){
		var itemCopy = item
		itemCopy.setDone(!item.isDone)
		
		guard let uid = Auth.auth().currentUser?.uid else{
			return
		}
		
		let db = Firestore.firestore()
		
		db.collection("users")
			.document(uid)
			.collection("todos")
			.document(item.id)
			.updateData(itemCopy.asDictionary())
	}
}
