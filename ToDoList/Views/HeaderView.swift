//
//  HeaderView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/28/23.
//

import SwiftUI

struct HeaderView: View {
	
	let title: String
	let subtitle: String
	let angle: Double
	let background: Color
	
    var body: some View {
		
		ZStack{
			RoundedRectangle(cornerRadius:0)
				.foregroundColor(background)
				.rotationEffect(Angle(degrees: angle))
				
			
			VStack{
				Text(title)
					.font(.system(size:50))
					.foregroundColor(Color.white)
					.bold()
				
				Text(subtitle)
					.font(.system(size:30))
					.foregroundColor(Color.black)
					.bold()
				
			}
			.padding(.top,30)
		}
		.offset(y:-100)
		.frame(width:UIScreen.main.bounds.width * 3, height:300)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
		HeaderView(title: "To Do List", subtitle: "Get it done!", angle: 15.0, background: Color.red)
    }
}
