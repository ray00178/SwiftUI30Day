//
//  MenuDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/3/9.
//

import SwiftUI

struct MenuDemo: View {
  var body: some View {
    NavigationStack {
      List(0 ..< 100) { index in
        Text("\(index)")
      }
      .navigationTitle("Menu")
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbar {
        ToolbarItem {
          Menu {
            Button {} label: {
              Label("分享", systemImage: "square.and.arrow.up")
            }

            Button {} label: {
              Label("隨機", systemImage: "cat")
            }
          } label: {
            Image(systemName: "ellipsis.circle")
              .foregroundStyle(.black)
          }
        }
      }
    }
  }
}

#Preview {
  MenuDemo()
}
