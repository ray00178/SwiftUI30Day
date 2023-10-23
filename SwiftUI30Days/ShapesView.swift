//
//  ShapesView.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/10/23.
//

import SwiftUI

struct ShapesView: View {
  var body: some View {
    VStack(spacing: 20) {
      Rectangle()
        .frame(width: 100, height: 50)
        .foregroundStyle(.blue)

      RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/ .continuous/*@END_MENU_TOKEN@*/)
        .frame(width: 100, height: 50)
        .foregroundStyle(.pink)

      Circle()
        .frame(width: 100, height: 100)
        .foregroundStyle(.orange)

      Capsule(style: .continuous)
        .frame(width: 100, height: 50)
        .foregroundStyle(.green)

      Button {} label: {
        Text("Swift UI")
          .font(.body)
          .padding(16)
      }
      .tint(.white)
      .background {
        Capsule()
          .foregroundStyle(.purple)
      }
    }
  }
}

#Preview {
  ShapesView()
}
