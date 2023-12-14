//
//  PickerDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/12/15.
//

import SwiftUI

struct PickerDemo: View {
  
  @State private var seleted: String = "Taiwan"
  
  private let countury: [String] = ["Taiwan", "Japan", "Korea", "American", "Singapore"]
  
  var body: some View {
    Picker("Country", selection: $seleted) {
      ForEach(countury, id: \.self) { (value) in
        Text(value)
          // 要與 seleted 同行別, 才會自動綁定
          .tag(value)
      }
    }
    .pickerStyle(.segmented)
    .padding()
  }
}

#Preview {
  PickerDemo()
}
