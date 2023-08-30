//
//  MainView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct MainView: View {
	
	@StateObject var viewModel = MainViewViewModel()
	
    var body: some View {
		if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
			// signed in view
			ToDoListView()
		}else{
			LoginView()
		}
		
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		MainView()
    }
}
