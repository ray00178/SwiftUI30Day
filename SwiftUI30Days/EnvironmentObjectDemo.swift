//
//  EnvironmentObjectDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/12/21.
//

import SwiftUI

// MARK: - EnvironmentObjectDemo

struct EnvironmentObjectDemo: View {
  @EnvironmentObject var energy: Energy

  var body: some View {
    VStack(spacing: 8) {
      Text("EnvironmentObject Parent energy = \(energy.level)")
        .font(.system(size: 20, design: .rounded))
        .foregroundStyle(.blue)
      ChildView()
    }
  }
}

// MARK: - ChildView

struct ChildView: View {
  @EnvironmentObject var energy: Energy

  var body: some View {
    VStack(spacing: 20) {
      Text("Child View energy = \(energy.level)")
        .font(.system(size: 16, design: .rounded))

      Button(
        action: {
          if energy.level == 10 {
            energy.level = 1
          } else {
            energy.level += 1
          }
        },
        label: {
          Image(systemName: "plus.circle")
        }
      )
      .font(.headline)
    }
    .foregroundStyle(.pink)
  }
}

#Preview {
  EnvironmentObjectDemo()
    .environmentObject(Energy())
}

// MARK: - Energy

/// 自訂環境變數
class Energy: ObservableObject {
  @Published var level: Int = 1
}
