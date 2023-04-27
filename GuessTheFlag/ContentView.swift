//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Slawek on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Nigeria", "Poland", "Estonia", "Germany", "Ireland", "Italy", "France", "Russia", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score: Int = 0
    @State private var steps: Int = 0
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack (spacing: 30) {
                VStack {
                    
                    Text("Guess the Flag")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number: number)
                    }label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .shadow(radius: 5)
                            .clipShape(Capsule())
                         
                    }
                    if steps == 8 {
                        EndGame()
                    } else {
                        
                    }
                }
        
                Text("Score is \(score)")
                    .foregroundColor(.white)
                    .font(.subheadline.weight(.heavy))
                
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, this flag is the flag of:\(countries[number]) "
        }
        showingScore = true
    }
    func askQuestion() {
        steps += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    

