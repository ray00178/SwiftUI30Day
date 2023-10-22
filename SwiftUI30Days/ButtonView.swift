//
//  ButtonView.swift
//  SwiftUI30Days
//
//  Created by Ray on 2023/10/22.
//

import SwiftUI

struct ButtonView: View {
  var body: some View {
    Button {} label: {
      Text("Button")
        .font(.system(size: 20, weight: .heavy))
        .foregroundStyle(.white)
        .padding(12)
    }
    .background(.black)
    //.cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/) was deprecated on iOS 17
    .clipShape(RoundedRectangle(cornerRadius: .infinity))
  }
}

#Preview {
  ButtonView()
}
