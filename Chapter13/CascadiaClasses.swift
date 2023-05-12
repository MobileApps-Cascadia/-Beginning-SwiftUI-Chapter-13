//
//  BasicLists.swift
//  Chapter13
//
//  Created by Mike Panitz on 4/30/23.
//

import SwiftUI

struct CascadiaClassesView: View {
    
    //@State private var multiSelection = Set<UUID>()
 
    var body: some View {
        NavigationView{
            VStack {
                List(/*selection: $multiSelection*/) {
                    ForEach(disciplines) { discipline in
                        ForEach(discipline.courseList) { course in
                            HStack{
                                Image(systemName: course.enrolled ? "checkmark.circle.fill" : "circle")
                                    .frame(alignment: .trailing)
                                    .foregroundColor(course.enrolled ? Color.accentColor : Color.secondary)
                                Text("\(discipline.abbreviation) \(course.courseNumber): \(course.title)")
                                
                            }
                        }
                    }
                }
                .navigationTitle("Cascadia Classes")
                //.toolbar{ EditButton() }
                
            }
            .padding()
        }
    }
}


// Like "IT-MOB", or "ENG" (English) or "MATH"
struct Discipline: Identifiable {
    let id = UUID()
    // add properties here
    let name: String
    let abbreviation: String
    let courseList: [Course]

}
var disciplines = [Discipline(name: "Information Technology - Mobile", abbreviation: "IT-MOB",
                              courseList: [
                                Course(title: "Basics of Web Authoring", courseNumber: 112, enrolled: false),
                                Course(title: "Introduction to Programming", courseNumber: 115, enrolled: false),
                                Course(title: "Network Infrastructure", courseNumber: 135, enrolled: false)]),
                   Discipline(name: "English", abbreviation: "ENGL",
                              courseList: [
                                Course(title: "Introduction to Creative Writing", courseNumber: 115, enrolled: false),
                                Course(title: "Film and Literature", courseNumber: 221, enrolled: false),                                Course(title: "English Composition 1", courseNumber: 101, enrolled: false)]),
                   Discipline(name: "Math", abbreviation: "MATH",
                              courseList: [
                                Course(title: "Algebra for Precalculus", courseNumber: 95, enrolled: false),
                                Course(title: "Precalculus 1", courseNumber: 141, enrolled: false),
                                Course(title: "Introduction to Statistics", courseNumber: 146, enrolled: false)])]

// Like "IT-MOB 381" or "ENG 101" or "MATH &107"
struct Course: Identifiable {
    let id = UUID()
    // add properties here
    let title: String
    let courseNumber: Int
    let enrolled: Bool
}

struct CascadiaClassesView_Previews: PreviewProvider {
    static var previews: some View {
        CascadiaClassesView()
    }
}
