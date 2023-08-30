//
//  Extensions.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/29/23.
//

import Foundation

extension Encodable{
	
	// takes any codable object to JSON string
	func asDictionary() -> [String: Any]{
		guard let data = try? JSONEncoder().encode(self) else{
			return [:]
		}
		
		do{
			let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
			return json ?? [:]
		}catch{
			return [:]
		}
	}
}
