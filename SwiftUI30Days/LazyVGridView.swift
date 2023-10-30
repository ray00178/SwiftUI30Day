//
//  LazyVGridView.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/10/31.
//

import SwiftUI

struct LazyVGridView: View {
  @State var vehicles = ["car", "bus", "airplane", "tram", "scooter"]

  private let columns = [GridItem(.flexible(), spacing: 12),
                         GridItem(.flexible())]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 12) {
        ForEach($vehicles, id: \.self) { vehicle in
          VStack {
            Image(systemName: vehicle.wrappedValue)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .padding()
              .frame(width: .infinity, height: 100)
            
            Text(vehicle.wrappedValue)
              .font(.system(size: 16, weight: .medium, design: .rounded))
          }
          .frame(maxWidth: .infinity)
          .background {
            RoundedRectangle(cornerRadius: 8)
              .stroke(style: StrokeStyle(lineWidth: 2))
              .foregroundStyle(.gray)
          }
        }
      }
      .padding(12)
    }
  }
}

#Preview {
  LazyVGridView()
}
