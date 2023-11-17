//
//  ListDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/11/17.
//

import SwiftUI

struct ListDemo: View {
  
  let dataset: [ListModel] = (0...100).map { ListModel(day: $0) }
  
  var body: some View {
    List(dataset, id: \.id) { model in
      Text("Day = \(model.day)")
    }
    .listStyle(.plain)
  }
}

#Preview {
  ListDemo()
}

struct ListModel: Identifiable {
  
  let id: String
  
  let day: Int
  
  init(day: Int) {
    self.id = UUID().uuidString
    self.day = day
  }
}
