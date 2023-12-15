//
//  TransitionDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/12/15.
//

import SwiftUI

struct TransitionDemo: View {
  
  @State private var isExpand: Bool = false
  
  let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 6)
  
  var body: some View {
    VStack(spacing: 20) {
      Button(action: {
        // 加入動畫
        withAnimation {
          isExpand.toggle()
        }
      }, label: {
        HStack(spacing: 12) {
          Text("物件帶看熱度")
          Image(systemName: "arrow.right.circle")
            .rotationEffect(.degrees(isExpand ? 90 : 0))
        }
        .font(.system(size: 18, weight: .bold, design: .rounded))
        .foregroundColor(.black)
      })
      
      if isExpand {
        LazyVGrid(columns: columns) {
          ForEach(0 ... 41, id: \.self) { value in
            RoundedRectangle(cornerRadius: 2)
              .frame(width: 20, height: 20)
              .foregroundStyle(Color.green.opacity(Double.random(in: 0.2...1.0)))
          }
        }
        .transition(
          AnyTransition.opacity
            //.combined(with: .offset(x: 0, y: -10))
            .combined(with: .scale)
            //.combined(with: .move(edge: .top))
            .animation(Animation.spring(.smooth))
        )
      }
    }
    .padding(20)
    .overlay {
      RoundedRectangle(cornerRadius: 8)
        .stroke(style: .init(lineWidth: 1))
        .foregroundStyle(.secondary.opacity(0.7))
    }
    .frame(maxWidth: 320)
  }
}

#Preview {
  TransitionDemo()
}
