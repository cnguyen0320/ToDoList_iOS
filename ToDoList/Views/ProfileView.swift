//
//  ProfileView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct ProfileView: View {
	
	@StateObject var viewModel = ProfileViewViewModel()
	
    var body: some View {
		NavigationView{
			if let user = viewModel.user{
				VStack{
					// Avatar
					Image(systemName: "person.circle")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.foregroundColor(Color.secondary)
						.frame(width: 125, height: 125)
					
					// Info: Name, Email, Join Date
					VStack(alignment: .leading){
						
						HStack{
							Text("Name: ")
								.bold()
								.padding()
							Text(user.name)
						}
						
						HStack{
							Text("Email: ")
								.bold()
								.padding()
							Text(user.email)
						}
						
						HStack{
							Text("Joined: ")
								.bold()
								.padding()
							Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time:.shortened))")
						}
					}
					
					Spacer()
					
					// Sign out
					Button("Sign out") {
						viewModel.logoff()
					}
				}
				.navigationTitle("Profile")
			}else{
				// displays this while waiting for user data to populate
				Text("Loading user...")
			}
		}
		.onAppear{
			// user data is fetched when this view appears
			viewModel.fetchUser()
		}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
