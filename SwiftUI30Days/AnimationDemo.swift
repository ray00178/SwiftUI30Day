//
//  AnimationDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/2/16.
//

import SwiftUI

struct AnimationDemo: View {
  @State private var isRotating: Bool = false

  var body: some View {
    Button(action: {
      isRotating.toggle()
    }, label: {
      Image(systemName: "arrow.clockwise")
        .font(.system(size: 30, weight: .bold))
        .foregroundStyle(.red)
        .shadow(radius: 1)
        .rotationEffect(isRotating ? .degrees(180) : .zero)
        .animation(isRotating ?
          Animation.linear(duration: 1).repeatForever(autoreverses: true) :
          .linear(duration: 0),
          value: isRotating)
    })
  }
}

#Preview {
  AnimationDemo()
}
