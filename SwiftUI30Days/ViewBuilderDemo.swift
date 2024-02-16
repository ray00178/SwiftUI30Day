//
//  ViewBuilderDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/2/15.
//

import SwiftUI

// MARK: - ViewBuilderDemo

struct ViewBuilderDemo: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        Message {
          Text("""
          30 days of visionOS challenge.
          I took on the challenge of implementing diverse visionOS features.
          """)
        }

        Message {
          Image(systemName: "apple.logo")
            .font(.system(size: 26))
            .foregroundStyle(.orange)
            .frame(width: 50, height: 50)
        }
      }
    }
  }
}

// MARK: - Message

struct Message<Content>: View where Content: View {
  var content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  var body: some View {
    HStack(alignment: .top, spacing: 8) {
      Circle()
        .foregroundStyle(.purple)
        .shadow(radius: 5)
        .frame(width: 44, height: 44)
        .overlay {
          Text("2")
            .foregroundStyle(.white)
            .font(.system(size: 20, design: .monospaced))
        }
      content
        .padding(8)
        .background {
          RoundedRectangle(cornerRadius: 8)
            .fill(.secondary)
        }
    }
    .padding([.horizontal], 8)
  }
}

#Preview {
  ViewBuilderDemo()
}
