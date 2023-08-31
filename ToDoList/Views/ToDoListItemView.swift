//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct ToDoListItemView: View {
	let item: ToDoListItem
	
	@StateObject var viewModel = ToDoListItemViewViewModel()
	
	
	var body: some View {
		HStack{
			Info
			Spacer()
			CompleteButton
		}
    }
	
	@ViewBuilder
	/// Contains the title and date of the item
	var Info: some View{
		VStack(alignment: .leading){
			Text(item.title)
				.bold()
				.font(.body)
			Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date:.abbreviated, time: .shortened))")
				.font(.footnote)
				.foregroundColor(Color(.secondaryLabel))
			
		}
	}
	
	@ViewBuilder
	/// Completion button
	var CompleteButton: some View {
		Button{
			viewModel.toggleIsDone(item:item)
		} label:{
			Image(systemName:item.isDone ? "checkmark.circle.fill" : "circle")
				.foregroundColor(Color.blue)
				.scaledToFill()
		}
	}
}




struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(
			item: .init(
				id: "123",
				title: "Do it",
				dueDate: Date().timeIntervalSince1970,
				createdDate: Date().timeIntervalSince1970,
				isDone: false
			)
		)
    }
}
