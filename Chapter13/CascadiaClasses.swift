//
//  BasicLists.swift
//  Chapter13
//
//  Created by Mike Panitz on 4/30/23.
//

import SwiftUI

struct CascadiaClassesView: View {
    
 
    var body: some View {
        VStack {
            Text("Cascadia Classes")
                .font(.largeTitle)
            List(disciplines) {
                Text($0.name)
            }
            
        }
        .padding()
    }
}


// Like "IT-MOB", or "ENG" (English) or "MATH"
struct Discipline: Identifiable {
    let id = UUID()
    // add properties here
    let name: String
    let abbreviation: String

}
var disciplines = [Discipline(name: "Information Technology - Mobile", abbreviation: "IT-MOB"),Discipline(name: "English", abbreviation: "ENG"),Discipline(name: "Math", abbreviation: "MATH")]

// Like "IT-MOB 381" or "ENG 101" or "MATH &107"
struct Course: Identifiable {
    let id = UUID()
    // add properties here
}

struct CascadiaClassesView_Previews: PreviewProvider {
    static var previews: some View {
        CascadiaClassesView()
    }
}
