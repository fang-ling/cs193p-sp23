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
  var is_face_up = false
  
  var body: some View {
    ZStack {
      if is_face_up {
        RoundedRectangle(cornerRadius: 12)
          .foregroundColor(.white)
        RoundedRectangle(cornerRadius: 12)
          .strokeBorder(lineWidth: 2)
        Text("👻").font(.largeTitle)
      } else {
        RoundedRectangle(cornerRadius: 12)
      }
    }
  }
}

#Preview {
  ContentView()
}
