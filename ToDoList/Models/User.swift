//
//  User.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import Foundation

struct User: Codable {
	let id: String
	let name: String
	let email: String
	let joined: TimeInterval // when did user join app
}
