//
//  ContentView.swift
//  Memorize
//
//  Created by Fang Ling on 2024/5/17.
//

import SwiftUI

struct ContentView: View {
  let emojis = [
    "👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "🦁", "😱", "☠️", "🍭"
  ]
  
  @State var card_count = 4
  
  var body: some View {
    VStack {
      ScrollView {
        cards
      }
      Spacer()
      card_count_adjusters
    }
    .padding()
  }
  
  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
      ForEach(0 ..< card_count, id: \.self) { i in
        CardView(content: emojis[i])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundColor(.orange)
  }
  
  func card_count_adjuster(by offset: Int, symbol: String) -> some View {
    Button(action: {
      card_count += offset
    }, label: {
      Image(systemName: symbol)
    })
    .disabled(card_count + offset < 1 || card_count + offset > emojis.count)
  }
  
  var card_remover: some View {
    card_count_adjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
  }
  
  var card_adder: some View {
    card_count_adjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
  }
  
  var card_count_adjusters: some View {
    HStack {
      card_remover
      Spacer()
      card_adder
    }
    .imageScale(.large)
    .font(.largeTitle)
  }
}

struct CardView: View {
  let content: String
  @State var is_face_up = true
  
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
