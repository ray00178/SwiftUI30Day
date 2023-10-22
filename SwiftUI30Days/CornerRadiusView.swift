//
//  CornerRadiusView.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/10/20.
//

import SwiftUI

struct CornerRadiusView: View {
  @State private var text: String = "Background to random"

  var body: some View {
    VStack(spacing: 20) {
      Text(text)
        .font(.system(size: 24, weight: .medium, design: .rounded))
        .foregroundStyle(.blue)
        .padding(4)
        // Use background
        .background {
          RoundedRectangle(cornerRadius: 8)
            .stroke(.blue, lineWidth: 2)
            .opacity(text.isEmpty ? 0 : 1)
        }
        .onTapGesture {
          text = "Background random \(Int.random(in: 0 ... 1000))"
        }
      
      Text("Overlay")
        .font(.system(size: 24, weight: .black, design: .monospaced))
        .foregroundStyle(.orange)
        .padding(8)
        .overlay {
          RoundedRectangle(cornerRadius: 8)
            .stroke(.orange,
                    style: StrokeStyle(lineWidth: 2,
                                       lineCap: .round,
                                       dash: [2, 6],
                                       dashPhase: 2))
        }
    }
  }
}

#Preview {
  CornerRadiusView()
}
