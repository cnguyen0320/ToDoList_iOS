//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import Foundation


struct ToDoListItem: Codable, Identifiable {
	let id: String
	let title: String
	let dueDate: TimeInterval
	let createdDate: TimeInterval // when item created
	var isDone: Bool
	
	mutating func setDone(_ state: Bool){
		isDone = state
	}
}
