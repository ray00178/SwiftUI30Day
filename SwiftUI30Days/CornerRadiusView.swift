//
//  CornerRadiusView.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/10/20.
//

import SwiftUI

struct CornerRadiusView: View {
  
  @State private var text: String = "Tap me to random"
  
  var body: some View {
    Text(text)
      .font(.system(size: 24, weight: .medium, design: .rounded))
      .foregroundStyle(.blue)
      .padding(4)
      .background {
        RoundedRectangle(cornerRadius: 8)
          .stroke(.blue, lineWidth: 2)
          .opacity(text.isEmpty ? 0 : 1)
      }
      .onTapGesture {
        text = "Tap me to random \(Int.random(in: 0...1000))"
      }
  }
}

#Preview {
  CornerRadiusView()
}
