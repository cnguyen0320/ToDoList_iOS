//
//  NewItemView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct NewItemView: View {
	
	@StateObject var viewModel = NewItemViewViewModel()
	@Binding var newItemPresented: Bool
	
    var body: some View {
		VStack{
			Text("New item")
				.font(.system(size: 32))
				.bold()
				.padding(.top, 25)
			
			Form{
				TextField("Title", text:$viewModel.title)
					.textFieldStyle(DefaultTextFieldStyle())
				
				// due date
				DatePicker("Due Date", selection: $viewModel.dueDate)
					.datePickerStyle(GraphicalDatePickerStyle())
				
				
				
				TLButtonView(title:"Save", background:Color.pink){
					
					if viewModel.canSave(){
						// save the item
						viewModel.save()
						newItemPresented = false // set to false to close the view
					}else{
						viewModel.showAlert = true
					}
				}
				
				.padding()
				
				
			}
		}
		.alert(isPresented: $viewModel.showAlert){
			Alert(title: Text("Error"), message:Text("Please fill in the title"))
		}
		
		
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
		NewItemView(newItemPresented: Binding(get:{
			return true
			
		}, set:{
			_ in
			
		}))
    }
}
