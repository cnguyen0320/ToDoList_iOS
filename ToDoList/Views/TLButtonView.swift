//
//  TLButtonView.swift
//  ToDoList
//
//  Created by Chris Nguyen on 8/29/23.
//

import SwiftUI

struct TLButtonView: View {
	let title: String
	let background: Color
	let action: ()->Void
    var body: some View {
		Button {
			action()
		} label: {
			ZStack{
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(background)
				Text(title)
					.foregroundColor(Color.white)
					.bold()
			}
		}
    }
}

struct TLButtonView_Previews: PreviewProvider {
    static var previews: some View {
		TLButtonView(title:"Button", background:Color.green) {
			// no action
		}
    }
}
