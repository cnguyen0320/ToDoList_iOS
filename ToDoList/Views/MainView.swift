//
//  MainView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
			
            LoginView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		MainView()
    }
}
