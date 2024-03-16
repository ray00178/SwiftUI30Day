//
//  AlertDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/3/16.
//

import SwiftUI

struct AlertDemo: View {
  
  @State private var showAlert: Bool = false
  
  var body: some View {
    Button(action: {
      showAlert = true
    }, label: {
      Image(systemName: "bell.circle.fill")
        .font(.system(size: 40))
        .fontWeight(.semibold)
        .foregroundStyle(.red)
    })
    .alert("Error", isPresented: $showAlert) {
      Button("OK", role: .cancel) {}
      Button("Try a again", role: .destructive) {}
    } message: {
      Text("A problem has occured while submitting your data.")
    }
  }
}

#Preview {
  AlertDemo()
}
