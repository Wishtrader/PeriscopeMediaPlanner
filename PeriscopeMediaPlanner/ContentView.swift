import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    
    var body: some View {
        // MARK: - BODY
      ZStack {
        SplashScreenView()
          .zIndex(1)
        HomeView()
          .zIndex(0)
      }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .preferredColorScheme(.dark)
        
    }
}
