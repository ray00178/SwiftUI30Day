//
//  NavigationStackDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/2/15.
//

import SwiftUI

struct NavigationStackDemo: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        Rectangle()
          .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
          .foregroundStyle(.purple)
          .frame(width: .infinity, height: 1000)
      }
      .navigationTitle("NavigationStack")
      .navigationBarTitleDisplayMode(.automatic)
      .toolbar {
        // Use .principal
        // In iOS, iPadOS, and tvOS, the system places the principal item in the center of the navigation bar. This item takes precedent over a title specified through View/navigationTitle.
        ToolbarItem(placement: .principal) {
          Text("iThome 鐵人賽")
            .foregroundStyle(.white)
            .font(.system(size: 12, weight: .bold))
            .padding(10)
            .background(
              RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.indigo)
            )
            .shadow(radius: 5)
        }
      }
    }
  }
}

#Preview {
  NavigationStackDemo()
}
