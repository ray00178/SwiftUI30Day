//
//  ViewModifierDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/10/26.
//

import SwiftUI

// MARK: - ViewModifierDemo

struct ViewModifierDemo: View {
  var body: some View {
    
    VStack(spacing: 20) {
      Text("Customer ViewModifier")
        .modifier(FontStyle())
      
      Text("Extension ViewModifier")
        .fontStyle()
    }
    
  }
}

#Preview {
  ViewModifierDemo()
}

// MARK: - FontStyle

struct FontStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 24, weight: .medium, design: .rounded))
      .foregroundStyle(.black)
      .background {
        RoundedRectangle(cornerRadius: 4)
          .frame(height: 3)
          .offset(y: 10)
          .foregroundStyle(.pink)
      }
  }
}

// MARK: - Extension

extension View {
  func fontStyle() -> some View {
    font(.system(size: 24, weight: .medium, design: .rounded))
      .foregroundStyle(.pink)
      .background {
        RoundedRectangle(cornerRadius: 4)
          .frame(height: 3)
          .offset(y: 10)
          .foregroundStyle(.blue)
      }
  }
}
