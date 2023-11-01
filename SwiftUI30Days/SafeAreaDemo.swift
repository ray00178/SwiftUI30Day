//
//  SafeAreaDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/11/2.
//

import SwiftUI

struct SafeAreaDemo: View {
  var body: some View {
    ScrollView {
      VStack {
        ForEach(0...29, id: \.self) { row in
          HStack {
            Text("Data \(row + 1)")
              .font(.system(size: 16, weight: .medium, design: .rounded))
              .padding(.bottom, 8)
            Spacer()
            
            Button(action: {}, label: {
              Image(systemName: "heart")
                .foregroundStyle(.pink)
                .frame(width: 16, height: 16)
            })
          }
          .frame(height: 40)
          .padding(.horizontal, 12)
        }
      }
    }
    .scrollIndicators(.hidden)
    .safeAreaInset(edge: .bottom) {
      HStack {
        Spacer()
        Button(action: {}, label: {
          Text("前往")
            .font(.system(size: 20, weight: .semibold, design: .monospaced))
            .foregroundStyle(.white)
            .padding(8)
            .background {
              RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 1))
                .foregroundStyle(.white)
            }
        })
        .padding(.trailing, 20)
      }
      .frame(height: 80)
      .background(.blue)
    }
  }
}

#Preview {
  SafeAreaDemo()
}
