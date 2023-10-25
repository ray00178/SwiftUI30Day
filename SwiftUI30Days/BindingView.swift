//
//  BindingView.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/10/25.
//

import SwiftUI

struct BindingView: View {
  @Binding var title: String?

  var body: some View {
    TextField("Please enter name", text: Binding(get: {
      title ?? "nil"
    }, set: { newValue in
      title = newValue.isEmpty ? nil : newValue
    }))
    .padding(12)
    .frame(width: 150, height: 50)
    .overlay {
      RoundedRectangle(cornerRadius: 8)
        .stroke(style: StrokeStyle(lineWidth: 1))
        .foregroundColor(.blue)
    }
    .tint(.orange)
  }
}

#Preview {
  BindingView(title: Binding.constant(nil))
}
