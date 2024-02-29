//
//  NavigationStackDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/2/15.
//

import SwiftUI

// MARK: - NavigationStackDemo

struct NavigationStackDemo: View {
  private let animals: [Animal] = ["Lion", "Elephant", "Bird", "Rabbit"].map { Animal(name: $0) }
  
  @State private var path: [Animal] = []

  var body: some View {
    TabView(selection: .constant(1)) {
      NavigationStack {
        ScrollView {
          VStack {
            Rectangle()
              .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
              .foregroundStyle(.purple)
              .frame(width: .infinity, height: 100)

            Divider()

            NavigationLink {
              SecondView()
                .toolbar(.hidden, for: .tabBar)
            } label: {
              Image(systemName: "arrow.right.circle.fill")
                .font(.largeTitle)
            }
          }
        }
        .navigationTitle("NavigationStack")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
          // Use .principal
          // In iOS, iPadOS, and tvOS, the system places the principal item in the center of the navigation bar. This item takes precedent over a title specified through View/navigationTitle.
          ToolbarItem(placement: .principal) {
            Text("iThome 鐵人賽")
              .foregroundStyle(.white)
              .font(.system(size: 12, weight: .bold))
              .padding(10)
              .background(
                RoundedRectangle(cornerRadius: 5)
                  .foregroundStyle(.indigo)
              )
              .shadow(radius: 5)
          }
        }
      }
      .tabItem {
        Label("Home", systemImage: "house")
      }
      .tag(0)

      NavigationStack(path: $path) {
        ScrollView {
          LazyVStack {
            Button {
              if let animal1 = animals.randomElement(),
                 let animal2 = animals.randomElement() {
                path.append(contentsOf: [animal1, animal2])
              }
            } label: {
              Text("隨機產生")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.white)
                .padding()
            }
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: .infinity))

            ForEach(animals) { value in
              NavigationLink(value.name, value: value).padding()
            }
            .navigationDestination(for: Animal.self) { animal in
              Text(animal.name)
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                .foregroundStyle(.pink)
                .toolbar(.hidden, for: .tabBar)
            }
          }
        }
        .navigationTitle("Animal")
      }
      .tabItem {
        Label("Animal", systemImage: "circle.hexagonpath.fill")
      }
      .tag(1)
    }
    .tint(.black)
  }
}

// MARK: - SecondView

struct SecondView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    Text("Second View")
      .navigationTitle("Second")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden()
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button(action: {
            dismiss()
          }, label: {
            Image(systemName: "arrow.left")
              .foregroundStyle(.black)
          })
        }
      }
  }
}

#Preview {
  NavigationStackDemo()
}

// MARK: - Model

struct Animal: Identifiable, Hashable {
  
  let id: String = UUID().uuidString
  let name: String
}
