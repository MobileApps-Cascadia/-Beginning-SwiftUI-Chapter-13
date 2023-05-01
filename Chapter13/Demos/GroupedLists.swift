//
//  BasicLists.swift
//  Chapter13
//
//  Created by Mike Panitz on 4/30/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct GroupedListsView: View {
    
    struct Animals: Hashable, Identifiable {
        let pet: String
        let id = UUID()
    }
    struct SectionHeading: Identifiable {
        let name: String
        let animalList: [Animals]
        let id = UUID()
    }
    
    var myAnimals = [
        SectionHeading(name: "Mammals",
                       animalList: [
                        Animals(pet: "Cat"),
                        Animals(pet: "Dog"),
                        Animals(pet: "Ferret"),
                        Animals(pet: "Hamster")]),
        SectionHeading(name: "Reptiles",
                       animalList: [
                        Animals(pet: "Turtle"),
                        Animals(pet: "Lizard")]),
        SectionHeading(name: "Birds",
                       animalList: [
                        Animals(pet: "Parrot"),
                        Animals(pet: "Canary")]),
        SectionHeading(name: "Other",
                       animalList: [
                        Animals(pet: "Tarantula"),
                        Animals(pet: "Goldfish")])
    ]
    
    
    
    var body: some View {
        VStack {
            Text("Grouped Lists")
                .font(.largeTitle)
            List {
                ForEach(myAnimals) { heading in
                    Section(header: Text("\(heading.name) Section")) {
                        ForEach(heading.animalList) { creature in
                            Text(creature.pet)
                        }
                        .listRowSeparator( .visible)
                        .listRowSeparatorTint(.red)
                    }
                }
            }

            
        }
        .padding()
    }
}

struct GroupedListsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupedListsView()
    }
}
