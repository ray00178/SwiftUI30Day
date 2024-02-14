//
//  RefreshableDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/1/23.
//

import SwiftUI

struct RefreshableDemo: View {
  @State private var items: [Int] = [1, 2, 3]
  @State private var isError: Bool = false
  var body: some View {
    ScrollView {
      navigation()
      if isError {
        errorView()
      } else {
        ForEach(items, id: \.self) { (index) in
          HStack {
            Text("Day: \(index)")
              .frame(height: 60)
              .padding(.leading, 12)
            Spacer()
          }
          .background {
            RoundedRectangle(cornerRadius: 10)
              .stroke(style: .init(lineWidth: 1,
                                   dash: [2, 4],
                                   dashPhase: 2))
              .foregroundColor(.blue)
          }
          .padding(6)
        }
      }
    }
    .refreshable {
      Task {
        do {
          try await fetchData()
        } catch {
          isError.toggle()
        }
      }
    }
  }

  func navigation() -> some View {
    HStack {
      Text("Refreshable")
        .font(.body)
      Text("數量：\(items.count)")
      Spacer()
      
      Button(action: {
        items = [1, 2, 3]
      }, label: {
        Image(systemName: "arrow.clockwise")
          .font(.body)
          .foregroundStyle(.orange)
      })
    }
    .padding()
  }
  
  func errorView() -> some View {
    Image(systemName: "exclamationmark.triangle")
      .resizable()
      .frame(width: 60, height: 60)
      .foregroundStyle(.pink)
  }
  
  private func fetchData() async throws {
    // delay 2s
    try await Task.sleep(nanoseconds: 1_000_000_000 * 2)
    //Daythrow APIError.mockFailure
    let count = items.count
    items = items + [count + 1, count + 2, count + 3]
  }
}

enum APIError: Error {
  case mockFailure
}

#Preview {
  RefreshableDemo()
}
