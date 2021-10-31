//
//  HomeView.swift
//  PeriscopeMediaPlanner
//
//  Created by Andrei Kamarou on 22.10.21.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
      VStack {
        NavigationView {
          ScrollView(.vertical, showsIndicators: false) {
            TaskView()
            TaskView()
            TaskView()
          }
          .padding()
          .background(Color("Primary"))
        }
      .background(Color("Primary"))
    }
  }
}
// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView()
        .preferredColorScheme(.dark)
    }
}
