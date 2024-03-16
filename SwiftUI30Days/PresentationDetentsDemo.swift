//
//  PresentationDetentsDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/3/16.
//

import SwiftUI

struct PresentationDetentsDemo: View {
  @State private var isPresent: Bool = false

  var body: some View {
    Button(action: {
      isPresent = true
    }, label: {
      Label("Tap", systemImage: "hand.tap.fill")
        .tint(.pink)
        .font(.system(size: 20, weight: .medium))
    })
    .sheet(isPresented: $isPresent) {
      Text("半個畫面")
        //.presentationDetents([.medium, .large])
        .presentationDetents([.height(250)])
        .presentationDragIndicator(.hidden)
        .presentationCornerRadius(10)
    }
  }
}

#Preview {
  PresentationDetentsDemo()
}
