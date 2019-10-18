//
//  ContentView.swift
//  Rock–paper–scissors
//
//  Created by Erica on 10/18/19.
//  Copyright © 2019 Erica. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
    @State var round = 1
    @State var yourSelection = ""
    var weapons = ["scissors", "rock", "paper"]
    @State private var opponent = Int.random(in: 0...2)
    
    
    var body: some View {

        Group {
            VStack {
                Text("Opponent chose: ")
                Text(weapons[opponent].capitalized)
                    .bold()
                Image(self.weapons[self.opponent])
                    .renderingMode(.original)
            }
            VStack {
                Text("Your selection: ")
                Text("\(self.yourSelection)")
                HStack {
                    ForEach(0 ..< weapons.count) { weaponNumber in
                        Button(action: {
                            
                            print("selected: \(weaponNumber)")
                            self.yourSelection = self.weapons[weaponNumber]
                            print(self.yourSelection.capitalized)
                            
                            self.weapondSelected(yourSelection: self.yourSelection)
                            
                            self.opponent = Int.random(in: 0...2)
                            
                        }) {
                            Image(self.weapons[weaponNumber])
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .tag(weaponNumber)
                            
                        }
                        
                        
                    }
                    
                }
                
                HStack {
                    Text("Round: \(round)")
                    Text(" ")
                    Text(" ")
                    Text("Score: \(score)")
                }
                
            }
        }
        
    }
    
    func weapondSelected(yourSelection: String) {
        switch yourSelection {
        case "scissors":
            if weapons[opponent] == "scissors" {
                score += 0
                round += 1
                print("its tie")
            } else if weapons[opponent] == "paper" {
                score += 1
                round += 1
                print("You win")
            } else {
                score += 0
                round += 1
                print("you lose")
            }
           // opponent =  Int.random(in: 0...2)
        case "rock":
            if weapons[opponent] == "rock" {
                score += 0
                round += 1
                print("its tie")
            } else if weapons[opponent] == "paper" {
                score += 0
                round += 1
                print("You lose")
            } else {
                score += 1
                round += 1
                print("you win")
            }
           // opponent =  Int.random(in: 0...2)
            
        case "paper":
            if weapons[opponent] == "paper" {
                score += 0
                round += 1
                print("its tie")
            } else if weapons[opponent] == "rock" {
                score += 1
                round += 1
                print("You win")
            } else {
                score += 0
                round += 1
                print("you lose")
            }
          //  opponent =  Int.random(in: 0...2)
        default:
            break
            
        
            
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
