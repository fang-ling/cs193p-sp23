//
//  ContentView.swift
//  Memorize
//
//  Created by Fang Ling on 2024/5/17.
//

import SwiftUI

struct ContentView: View {
  let flags = ["🇯🇵", "🇰🇷", "🇩🇪", "🇨🇳", "🇺🇸", "🇫🇷", "🇪🇸", "🇮🇹", "🇷🇺", "🇬🇧", "🇹🇼", "🇨🇦"]
  let vehicles = ["🚐", "🚘", "🚙", "🛻", "🏎️", "🛵", "🛺", "🚲", "🚤", "🛥️", "🚢", "⛵"]
  let sports = ["🏑", "🏓", "🥍", "🏸", "🎣", "⛸️", "🛷", "⚽", "⚾", "🥎", "🏀", "🏐"]
  
  @State var emojis : [String] = []
  
  var body: some View {
    VStack {
      Text("Memorize!").font(.largeTitle)
      ScrollView {
        cards
      }
      Spacer()
      HStack(alignment: .bottom) {
        Spacer()
        theme_button(flags, "Flags", "flag.filled.and.flag.crossed")
        Spacer()
        theme_button(vehicles, "Vehicles", "car")
        Spacer()
        theme_button(sports, "Sports", "basketball")
        Spacer()
      }
    }
    .padding()
  }
  
  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
      ForEach(emojis.indices, id: \.self) { i in
        CardView(content: emojis[i])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundColor(.orange)
  }
  
  func theme_button(
    _ theme: [String],
    _ text: String,
    _ symbol: String
  ) -> some View {
    Button(action: {
      emojis = (theme + theme).shuffled()
    }, label: {
      VStack {
        Image(systemName: symbol).font(.title)
        Text(text)
      }
    })
  }
}

struct CardView: View {
  let content: String
  @State var is_face_up = false
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)
      Group {
        base.fill(.white)
        base.strokeBorder(lineWidth: 2)
        Text(content).font(.largeTitle)
      }
      .opacity(is_face_up ? 1 : 0)
      base.fill().opacity(is_face_up ? 0 : 1)
    }
    .onTapGesture {
      is_face_up.toggle()
    }
  }
}

#Preview {
  ContentView()
}
