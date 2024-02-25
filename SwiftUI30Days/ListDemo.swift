//
//  ListDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/11/17.
//

import SwiftUI

// MARK: - ListDemo

struct ListDemo: View {
  let dataset: [ListModel] = (0 ... 100).map { ListModel(day: $0) }

  var body: some View {
    List {
      ForEach(dataset, id: \.id) { model in
        Text("Day = \(model.day)")
      }

      ProgressView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.black)
        .foregroundColor(.red)
        .onAppear {
          Task(priority: .background) {
            try await Task.sleep(nanoseconds: 100_000_000)
          }
        }
    }
    .listStyle(.plain)
  }
}

#Preview {
  ListDemo()
}

// MARK: - ListModel

struct ListModel: Identifiable {
  let id: String

  let day: Int

  init(day: Int) {
    id = UUID().uuidString
    self.day = day
  }
}
