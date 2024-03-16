//
//  DatePickerDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/3/16.
//

import SwiftUI

struct DatePickerDemo: View {
  
  @State private var date: Date = Date.now
  
  var body: some View {
    List {
      Text(date.formatted(date: .long, time: .complete))
      DatePicker("日期", selection: $date, displayedComponents: .date)
      DatePicker("時間", selection: $date, displayedComponents: .hourAndMinute)
      DatePicker("日期時間", selection: $date)
        // 隱藏標題
        .labelsHidden()
        .datePickerStyle(.graphical)
      DatePicker("日期時間", selection: $date)
        .labelsHidden()
        .datePickerStyle(.wheel)
    }
    .listStyle(.insetGrouped)
    
  }
}

#Preview {
  DatePickerDemo()
}
