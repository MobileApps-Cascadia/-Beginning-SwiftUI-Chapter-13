//
//  BasicLists.swift
//  Chapter13
//
//  Created by Mike Panitz on 4/30/23.
//

import SwiftUI

struct DeleteMoveListsView: View {
    
    @State var myArray = ["Cat", "Dog", "Turtle", "Ferret", "Parrot", "Goldfish", "Lizard", "Canary", "Tarantula", "Hamster"]
    
    var body: some View {
        VStack {
            Text("Swipeable Lists")
                .font(.largeTitle)
            NavigationView {
                List {
                    ForEach(0...myArray.count - 1, id: \.self) { index in
                        Text(myArray[index])
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                .toolbar {
                    EditButton()
                }
            }
        }
        .padding()
    }
    
    func delete(at offsets: IndexSet) {
        myArray.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        myArray.move(fromOffsets: source, toOffset: destination)
    }
}

struct SwipeableListsView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteMoveListsView()
    }
}
