//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import Foundation


class NewItemViewViewModel: ObservableObject {
	
	@Published var title: String = ""
	@Published var dueDate: Date = Date()
	@Published var showAlert: Bool = false
	
	
	init(){
		
	}
	
	
	func save(){
		
	}
	
	func canSave() -> Bool{
		guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
			return false
		}
		return true
	}
}
