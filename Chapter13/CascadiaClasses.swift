//
//  BasicLists.swift
//  Chapter13
//
//  Created by Mike Panitz on 4/30/23.
//

import SwiftUI

// WARNING: THIS IS _NOT_ COMPLETE
// You can toggle the enrollment but the rest of this isn't finished

struct CascadiaClassesView: View {
    
    @State var allClasses = [
        Discipline(name: "BIT",
                   courses:
                    [Course(name: "BIT 101"),
                     Course(name: "BIT 102")]),
        Discipline(name: "ENG",
                   courses:
                    [Course(name: "ENG 101"),
                     Course(name: "ENG 102")])]
    
    var body: some View {
        VStack {
            Text("Cascadia Classes")
                .font(.largeTitle)
            List {
                // If we want to change the structs:
                // Use Bindings here
                // And mark changeable fields as var, below
                ForEach($allClasses) { $disc in
                    Section(header: Text("\(disc.name) Courses:")) {
                        ForEach($disc.courses) { $course in
                            HStack {
                                Text(course.name)
                                    .swipeActions(edge: .trailing) {
                                        Button {
                                            course.isEnrolled.toggle()
                                        } label: {
                                            Image(systemName: "book")
                                        }.tint(.green)
                                    }
                                Spacer()
                                if course.isEnrolled {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.green)
                                        .font(.largeTitle)
                                } else {
                                    Image(systemName: "plus")
                                        
                                }
                            }
                        }
                    }
                }
            }
            
            
        }
        .padding()
    }
}


// Like "IT-MOB", or "ENG" (English) or "MATH"
struct Discipline: Identifiable {
    let id = UUID()
    let name:String
    var courses: [Course]
    // add properties here
}

// Like "IT-MOB 381" or "ENG 101" or "MATH &107"
struct Course: Identifiable {
    let id = UUID()
    var name:String
    var isEnrolled = false
    // add properties here
}

struct CascadiaClassesView_Previews: PreviewProvider {
    static var previews: some View {
        CascadiaClassesView()
    }
}
