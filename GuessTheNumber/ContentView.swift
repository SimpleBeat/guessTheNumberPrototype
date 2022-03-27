//  GuessTheNumber.swift
//
//  Created by Ilya on 26.09.2021.
//

import SwiftUI

// MARK: Guess the Number Game Prototype Warning!
// This is a prototype (MVP), and while it is working, it needs refactoring and optimizations for a finished product to be easy to maintain and add features

struct GuessTheNumber: View {
    private let maxAttempts = 8; // how many attempts the player has to guess the number (no more than 8 in this version)
    
    var body: some View {

// MARK: Main screen
        VStack(spacing: 20) {
            
            // Game title
            Text("Guess the number")
                .font(.largeTitle) // font style
                .bold() // font weight
                .foregroundColor(.blue) // font color
                .padding() // space around the text
            
            // Game description
            Text("I just thought of a number between 0 and 99. You have \(maxAttempts) attempts to guess it!")
                .font(.title) // font style
                .frame(maxWidth: .infinity) // element is stretched edge to edge
                .padding() // text padding
                .foregroundColor(.white) // text color
                .background(Color.blue) // background color
            
            // Game area (passing the gameplay data to it)
            GameField(currentAttempt: maxAttempts, maxAttemtps: maxAttempts)
        }
    }
}

// MARK: Game area
struct GameField: View {
    @State var currentAttempt: Int // current attempt
    @State var maxAttemtps: Int // max number of attempts
    @State private var digit10 = 0 // first digit on the display
    @State private var digit1 = 0 // second digit on the display
    @State private var min = 0 // min of the possible guess range
    @State private var max = 99 // max of the possible guess number range
    @State private var attemptNames = ["one last attempt", "just two attempts", "only three attempts", "four attempts", "five attempts", "six attempts", "seven attempts", "eight attempts"] // attempt propmts
    @State private var hint = "Guess!" // prompt
    @State private var number = Int.random(in: 0...99) // random number
    @State private var newGameHint = "Let's begin!" // additional text
    
    var body: some View {
        VStack() {
            // MARK: Prompts
            VStack() {
                Text(newGameHint) // new game prompt
                    .foregroundColor(.red)
                Text("You have \(attemptNames[currentAttempt-1]) left") // number of attempts left
                    .foregroundColor(currentAttempt > 1 ? .blue : .red) // if this is the last attempt, then the prompt is in red
                Text("Range - \(min) to \(max)") // what is the current range of the numbers to guess from
                Text(hint) // hint (was the number greater or smaller)
            }
            .font(.title3)
            .foregroundColor(.blue)
            .padding()
            
            // MARK: Number Display
            VStack() {
                // display has two digits
                HStack(spacing: 40) {
                    Text("\(digit10)") // digit 1 (tens)
                        .bold()
                    Text("\(digit1)") // digit 2 (singles)
                        .bold()
                }
                .font(.largeTitle)
                .foregroundColor(.red)
            }
            
            // MARK: Buttons
            // Needs refactoring (a constructor approach)
            VStack() {
                // first row of buttons
                HStack(spacing: 20) {
                    // MARK: 1
                    Button(action: {
                        // if the digit button is pressed the display makes a 'shift'
                        digit10 = digit1 // digit1 becomes digit2
                        digit1 = 1 // digit2 becomes the button's value
                    }) {
                        Text("1") // button's label
                            .bold()
                    }
                    .frame(width: 100, height: 50) // button size
                    .background(Color.blue) // button color
                    .cornerRadius(10) // button edges (roundness)
                    // MARK: 2
                    Button(action: {
                        digit10 = digit1
                        digit1 = 2
                    }) {
                        Text("2")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 3
                    Button(action: {
                        digit10 = digit1
                        digit1 = 3
                    }) {
                        Text("3")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                // second row of buttons
                HStack(spacing: 20) {
                    // MARK: 4
                    Button(action: {
                        digit10 = digit1
                        digit1 = 4
                    }) {
                        Text("4")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 5
                    Button(action: {
                        digit10 = digit1
                        digit1 = 5
                    }) {
                        Text("5")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 6
                    Button(action: {
                        digit10 = digit1
                        digit1 = 6
                    }) {
                        Text("6")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                // third row of buttons
                HStack(spacing: 20) {
                    // MARK: 7
                    Button(action: {
                        digit10 = digit1
                        digit1 = 7
                    }) {
                        Text("7")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 8
                    Button(action: {
                        digit10 = digit1
                        digit1 = 8
                    }) {
                        Text("8")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 9
                    Button(action: {
                        digit10 = digit1
                        digit1 = 9
                    }) {
                        Text("9")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                // fourth row of buttons
                HStack(spacing: 20) {
                    // MARK: X
                    Button(action: {
                        // button 'X' resets both digits to 0
                        digit1 = 0
                        digit10 = 0
                    }) {
                        // button's label could be a system font icon, not only just a string
                        Image(systemName: "x.circle")
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 0
                    Button(action: {
                        digit10 = digit1
                        digit1 = 0
                    }) {
                        Text("0")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    // MARK: Game Logic
                    Button(action: {
                        newGameHint = "" // additional text disappears as soon as the first guess is entered
                        let guessNumber = digit10*10 + digit1 // recreating the guess number from the display
                        
                        // MARK: the guess is smaller
                        if guessNumber < number { // if the guess of a player is less than the computer's number
                            min = guessNumber+1 // refresh the min of the possible numbers range
                            hint = "My number is greater than \(guessNumber)" // show the hint
                            currentAttempt -= 1 // decrease the attempts count
                        
                        // MARK: the guess is greater
                        } else if guessNumber > number { // if the player's guess is greater than the computer's number
                            max = guessNumber-1 // refresh the max of the possible numbers range
                            hint = "My number is smaller than \(guessNumber)" // show the hint
                            currentAttempt -= 1 // decrease the attempts count
                        
                        // MARK: the player won
                        } else {
                            // Player guessed the number
                            hint = "My last number was \(number)" // refresh the hint
                            newGameHint = "Yes, and now I picked a new one!" // refresh additional text
                            number = Int.random(in: 0...99) // choose new random number
                            currentAttempt = maxAttemtps // reset the attempts count
                            digit1 = 0 // reset digits on display
                            digit10 = 0
                            min = 0 // reset min range
                            max = 99 // reset max range
                        }

                        // MARK: the player lost
                        if currentAttempt < 1 { // attempts ran out
                            hint = "By the way, my number was \(number)" // refresh the hint
                            newGameHint = "Sorry, but let's play again!" // refresh additional text
                            number = Int.random(in: 0...99) // choose new random number
                            currentAttempt = maxAttemtps // reset the attempts count
                            digit1 = 0 // reset digits on display
                            digit10 = 0
                            min = 0 // reset min
                            max = 99 // reset max
                        }
                    }) {
                        Image(systemName: "checkmark.circle") // button's image (checkmark)
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
            .font(.largeTitle) // all elements are large
            .foregroundColor(.white) // all elements are white
            .padding()
        }
        
        Spacer() // leaving some space below for a better visual
    }
}

// XCode's preview helper
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheNumber()
    }
}
