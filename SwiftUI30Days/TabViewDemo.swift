//
//  TabViewDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/2/14.
//

import SwiftUI

struct TabViewDemo: View {
  @State private var selected: Int = 0

  var body: some View {
    TabView(selection: $selected) {
      Color.black
        .tabItem {
          Label("A", systemImage: "a.circle.fill")
        }
        .ignoresSafeArea(edges: .top)
        .tag(0)
      Color.blue
        .tabItem {
          Label("B", systemImage: "b.circle.fill")
        }
        .tag(1)
      Color.pink
        .tabItem {
          Label("C", systemImage: "c.circle.fill")
        }
        .tag(2)
    }
    .tint(.black)
    .overlay {
      VStack {
        Text("目前選中：\(selected)")
          .foregroundStyle(.white)
          .font(.system(size: 24, weight: .semibold, design: .monospaced))
      }
    }
    .onChange(of: selected) { (oldValue, newValue) in
      // 處理點擊指定Tab(實際上還是有事件), 單純視覺上無作用
      if newValue == 2 {
        selected = oldValue
      }
    }
  }
}

#Preview {
  TabViewDemo()
}
