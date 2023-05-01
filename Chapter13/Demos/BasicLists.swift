//
//  BasicLists.swift
//  Chapter13
//
//  Created by Mike Panitz on 4/30/23.
//

import SwiftUI

struct BasicListsView: View {
    
    var myArray = ["Cat", "Dog", "Turtle", "Ferret", "Parrot", "Goldfish", "Lizard", "Canary", "Tarantula", "Hamster"]
    
    var body: some View {
        VStack {
            Text("Lists")
                .font(.largeTitle)
            List {
                ForEach(1...25, id: \.self) { index in
                    Text("Animal #\(index)")
                }
            }
            List {
                ForEach(0...myArray.count - 1, id: \.self) { index in
                    Text(myArray[index])
                }
            }
            List(myAnimals) {
                Text($0.pet)
            }
            
        }
        .padding()
    }
}

struct Animals: Identifiable {
    let pet: String
    let id = UUID()
}
var myAnimals = [
    Animals(pet: "Cat"),
    Animals(pet: "Dog"),
    Animals(pet: "Turtle"),
    Animals(pet: "Ferret"),
    Animals(pet: "Parrot"),
    Animals(pet: "Goldfish"),
    Animals(pet: "Lizard"),
    Animals(pet: "Canary"),
    Animals(pet: "Tarantula"),
    Animals(pet: "Hamster")
]

struct BasicListsView_Previews: PreviewProvider {
    static var previews: some View {
        BasicListsView()
    }
}
