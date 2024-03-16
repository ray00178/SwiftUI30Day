//
//  ToggleDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/3/16.
//

import SwiftUI

struct ToggleDemo: View {
  
  @State private var isOn: Bool = false
  
  var body: some View {
    HStack(spacing: 20) {
      Text(isOn ? "Open" : "Close")
      Image(systemName: "arrow.up.heart.fill")
      Toggle("開關", isOn: $isOn)
        // default = switch
        .toggleStyle(.button)
    }
    .foregroundStyle(isOn ? .blue : .gray)
    .padding()
  }
}

#Preview {
  ToggleDemo()
}
