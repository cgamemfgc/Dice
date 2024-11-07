//
//  ContentView.swift
//  Dice
//
//  Created by Takeshi Sakamoto on 2024/11/07.
//

import SwiftUI

struct ContentView: View {
    @State var randomNumber = 1
    @State var timer: Timer?
    var body: some View {
        VStack {
            Spacer()
            Image(systemName:  "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            Button{
                print("ボタンが押されたよ")
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ _ in
                    randomNumber = Int.random(in: 1...6)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        timer?.invalidate()
                        timer = nil
                    }
                }
            } label: {
                Text("サイコロを振る").padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
