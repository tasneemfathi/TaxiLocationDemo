
import SwiftUI
import UIKit
 
struct NavigationVisiblityModifier: ViewModifier {
	
	let isHidden: Bool
	
	func body(content: Content) -> some View {
		if #available(iOS 16.0, *) {
			content.toolbar(isHidden ? .hidden : .visible)
                    .toolbar(isHidden ? .hidden : .visible , for: .navigationBar)
		} else {
			content
                .navigationBarHidden(isHidden)
 		}
	}
}

