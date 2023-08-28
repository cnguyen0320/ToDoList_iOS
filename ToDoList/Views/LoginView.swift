//
//  LoginView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
		VStack{
			
			// header
			ZStack{
				RoundedRectangle(cornerRadius:0)
					.foregroundColor(Color.pink)
					.rotationEffect(Angle(degrees: 15.0))
					
				
				VStack{
					Text("ToDoList")
						.font(.system(size:50))
						.foregroundColor(Color.white)
						.bold()
					
					Text("Get it done!")
						.font(.system(size:30))
						.foregroundColor(Color.black)
						.bold()
					
				}
				.padding(.top,30)
			}
			.offset(y:-100)
			.frame(width:UIScreen.main.bounds.width * 3, height:300)
			
			
			
			// login form
			
			// create account
			
			Spacer()
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
