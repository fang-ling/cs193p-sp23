//
//  ContentView.swift
//  Memorize
//
//  Created by Fang Ling on 2024/5/17.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    HStack{
      CardView(is_face_up: true)
      CardView()
      CardView()
      CardView()
    }
    .foregroundColor(.orange)
    .padding()
  }
}

struct CardView: View {
  @State var is_face_up = false
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)
      if is_face_up {
        base.fill(.white)
        base.strokeBorder(lineWidth: 2)
        Text("👻").font(.largeTitle)
      } else {
        base.fill()
      }
    }
    .onTapGesture {
      is_face_up.toggle()
    }
  }
}

#Preview {
  ContentView()
}
