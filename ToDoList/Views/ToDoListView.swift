//
//  ToDoListItems.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct ToDoListView: View {
	
	@StateObject var viewModel = ToDoListViewViewModel()
	
	private let userId: String
	
	init(userId: String){
		self.userId = userId
	}
	
    var body: some View {
		NavigationView{
			VStack{
				
			}
			.navigationTitle("To Do List")
			.toolbar{
				Button{
					// Do action
				} label: {
					Image(systemName: "plus")
				}
			}
		}
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
		ToDoListView(userId:"")
    }
}
