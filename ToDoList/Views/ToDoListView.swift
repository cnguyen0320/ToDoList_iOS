//
//  ToDoListItems.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
	
	@StateObject var viewModel: ToDoListViewViewModel
	@FirestoreQuery var items: [ToDoListItem]
	
	
	init(userId: String){
		// users/<id>/todos/<entries>
		self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos/")
		self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId:userId))
	}
	
    var body: some View {
		NavigationView{
			VStack{
				List(items){ item in
					ToDoListItemView(item: item)
						.swipeActions{
							Button{
								viewModel.delete(itemId: item.id)
							} label:{
								Text("Delete")
									
							}
							.tint(Color.red)
						}
				}.listStyle(PlainListStyle())
				
			}
			.navigationTitle("To Do List")
			.toolbar{
				Button{
					viewModel.showingNewItemView = true
				} label: {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $viewModel.showingNewItemView){
				NewItemView(newItemPresented: $viewModel.showingNewItemView)
			}
		}
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
		ToDoListView(userId:"qs3aBMWaw7S29j6XuyfgPxVsUze2")
    }
}
