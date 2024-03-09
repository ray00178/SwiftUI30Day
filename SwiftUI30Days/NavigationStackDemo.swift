//
//  NavigationStackDemo.swift
//  SwiftUI30Days
//
//  Created by Ray on 2024/2/15.
//

import SwiftUI

// MARK: - NavigationStackDemo

struct NavigationStackDemo: View {
  let foods: [Food] = [
    Food(name: "pizza", suger: 0),
    Food(name: "milktea", suger: 5),
    Food(name: "cake", suger: 7),
    Food(name: "apple", suger: 3),
  ]

  private var animals: [Animal] = ["Lion", "Elephant", "Bird", "Rabbit"].map { Animal(name: $0) }

  @State private var path: NavigationPath = .init()

  var body: some View {
    TabView(selection: .constant(1)) {
      NavigationStack {
        ScrollView {
          VStack {
            Rectangle()
              .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
              .foregroundStyle(.purple)
              .frame(height: 100)

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
              // 由於兩者都是繼承 Hashable ，因此可以讓 pool 的型別為 [Hashable]
              // 但是由於 Hashable 是 protocol ，所以需要寫成 [any Hashable]
              let pool: [any Hashable] = animals + foods
              if let guess1 = pool.randomElement(),
                 let guess2 = pool.randomElement()
              {
                path.append(guess1)
                path.append(guess2)
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

            ForEach(foods) { value in
              NavigationLink(value.name, value: value).padding()
            }
          }
        }
        .navigationTitle("Animal")
        .navigationDestination(for: Animal.self) { animal in
          Text(animal.name)
            .font(.system(size: 20, weight: .semibold, design: .monospaced))
            .foregroundStyle(.pink)
            .toolbar(.hidden, for: .tabBar)
        }
        .navigationDestination(for: Food.self) { food in
          Text("\(food.name) suger = \(food.suger)")
            .padding()
            .font(.system(size: 20, weight: .semibold, design: .monospaced))
            .foregroundStyle(.linearGradient(
              colors: [.red, .purple],
              startPoint: .leading,
              endPoint: .trailing
            )
            )
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .toolbar(.hidden, for: .tabBar)
        }
      }
      // Custom URL or Universal link
      .onOpenURL { url in
        handleCustomURL(from: url)
      }
      .tabItem {
        Label("Animal", systemImage: "circle.hexagonpath.fill")
      }
      .tag(1)
    }
    .tint(.black)
  }

  private func handleCustomURL(from url: URL) {
    // midnight://animal/bee
    // url.host() = animal
    // url.pathComponents = ["/", "bee"]

    // midnight://food/banana-5
    // url.host() = food
    // url.pathComponents = ["/", "banana-5"]
    guard let value = url.host() else { return }

    switch value {
    case "animal":
      guard let name = url.pathComponents.filter({ $0 != "/" }).first
      else {
        return
      }

      path.append(Animal(name: name))
    case "food":
      guard let value = url.pathComponents.filter({ $0 != "/" })
                                          .first?
                                          .split(separator: "-")
      else {
        return
      }

      let name = String(value[0])
      let suger = Int(value[1])!
      path.append(Food(name: name, suger: suger))
    default:
      break
    }
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

// MARK: - Animal

struct Animal: Identifiable, Hashable {
  let id: String = UUID().uuidString
  let name: String
}

// MARK: - Food

struct Food: Identifiable, Hashable {
  let id: String = UUID().uuidString
  let name: String
  let suger: Int
}
