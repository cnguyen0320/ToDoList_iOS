//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import FirebaseFirestore
import Foundation

// view model for entire todo list
class ToDoListViewViewModel: ObservableObject {
	
	@Published var showingNewItemView: Bool = false
	private let userId: String
	
	init(userId:String){
		self.userId = userId
	}
	
	
	/// Delete to do list item
	/// - Parameter itemId: item Id to delete
	func delete(itemId: String){
		let db = Firestore.firestore()
		
		db.collection("users")
			.document(self.userId)
			.collection("todos")
			.document(itemId)
			.delete()
	}
}
