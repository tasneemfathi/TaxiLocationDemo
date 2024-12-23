import SwiftUI

struct LanguageModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
            .environment(\.layoutDirection, L102Language.isRTL ? .rightToLeft : .leftToRight)
               .environment(\.locale, L102Language.isRTL ? Locale(identifier: "ar") : Locale(identifier: "en"))

	}
}
