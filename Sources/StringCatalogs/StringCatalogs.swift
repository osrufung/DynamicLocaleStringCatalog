import Foundation
import SwiftUI

public struct StringCatalog {
    let locale: Locale
    let hello: LocalizedStringResource!
 
    init(locale: Locale = .autoupdatingCurrent) {
        self.locale = locale
        self.hello = LocalizedStringResource("Hello", locale: locale, bundle: .atURL(Bundle.module.bundleURL))
    }
}

struct ContentView: View {
    let catalog = StringCatalog()
    
    var body: some View {
        Text(catalog.hello)
    }
}

#Preview {
    VStack {
        ContentView()
            .environment(\.locale, .init(identifier: "es"))
        ContentView()
            .environment(\.locale, .init(identifier: "en"))
        ContentView()
            .environment(\.locale, .init(identifier: "de"))
    }
}
