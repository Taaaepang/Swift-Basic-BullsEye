//
//  ContentView.swift
//  bullseye
//
//  Created by 김태광 on 2020/10/23.
//  Copyright © 2020 김태광. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0 // binding
    @State var target: Int = Int.random(in: 1...100)
    var body: some View {
        VStack {
            // Target row
            Spacer()
            HStack {
                Text("Put the bullseye as close as yo can to : ")
                Text("\(target)")
            }
            Spacer()
            // Slider row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            // Button row
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me"/*@END_MENU_TOKEN@*/)
            }.alert(isPresented: $alertIsVisible){
                () -> Alert in
                var roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Hello there!"),
                                 message:Text(
                                    "The slider's value is \(roundedValue).\n" +
                                    "You scored \(self.pointsForCurrentRound(_target:self.target, _selectUserInt: roundedValue)) points this round."),
                                dismissButton: .default(Text("Awesome")))
            }
            Spacer()
            // Score row
            HStack{
              Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Start Over")
              }
                Spacer()
                Text("Score : ")
                Text("999999")
                Spacer()
                Text("Round : ")
                Text("999")
                Spacer()
              Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("info")
                }
            }
        }
        .padding(.bottom, 20)
    }
    func pointsForCurrentRound(_target : Int, _selectUserInt : Int) -> Int {
        return 100 - abs(_target - _selectUserInt)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
