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
        VStack {
          Rectangle()
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
            .foregroundStyle(.purple)
            .frame(width: .infinity, height: 100)
          
          Divider()
          
          NavigationLink {
            SecondView()
          } label: {
            Image(systemName: "arrow.right.circle.fill")
              .font(.largeTitle)
          }
        }
        
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

// MARK: - Widget

struct SecondView: View {
  
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    Text("Second View")
      .navigationTitle("Second")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden()
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button(action: {
            dismiss()
          }, label: {
            Image(systemName: "arrow.left")
              .foregroundStyle(.black)
          })
        }
      }
  }
}

#Preview {
  NavigationStackDemo()
}
