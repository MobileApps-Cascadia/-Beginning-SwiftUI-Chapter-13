//Modified cascadiaClasses
//  BasicLists.swift
//  Chapter13
//
//  Created by Mike Panitz on 4/30/23.
//

import SwiftUI

struct CascadiaClassesView: View {
    // Create sample data for demonstration
    
    let disciplines: [Discipline] = [
           Discipline(name: "Information Technology", abbreviation: "IT", courses: [
               Course(courseNumber: "IT-MOB 381", title: "iOS Application Development 1"),
               Course(courseNumber: "IT-MOB 382", title: "iOS Application Development 2"),
               Course(courseNumber: "IT-ADV 483", title: "Advanced Web Development")
           ]),
           Discipline(name: "English", abbreviation: "ENG", courses: [
               Course(courseNumber: "ENG 101", title: "English Composition"),
               Course(courseNumber: "ENG 201", title: "Creative Writing"),
               Course(courseNumber: "ENG 302", title: "Shakespearean Literature")
           ]),
           Discipline(name: "Mathematics", abbreviation: "MATH", courses: [
               Course(courseNumber: "MATH 101", title: "Intro to Mathematics"),
               Course(courseNumber: "MATH 201", title: "Advanced Calculus"),
               Course(courseNumber: "MATH 305", title: "Linear Algebra")
           ])
       ]
    var body: some View {
        NavigationView{
            VStack {
                Text("Cascadia Classes")
                    .font(.largeTitle)
                
                List(disciplines) { discipline in
                    NavigationLink(destination: CourseListView(discipline: discipline)) {
                        Text(discipline.name)
                    }
                }
            }
            .padding()
            .navigationTitle("Cascadia Classes")
        }
    }
}


struct CourseListView: View {
    let discipline: Discipline
    
    var body: some View {
        List {
            Section(header: Text("Courses for \(discipline.name)")) {
                //ForEach(0..<3) { index in
                // Text("Course \(index + 1)")
                ForEach(discipline.courses){ course in
                    HStack{
                        Text("\(course.courseNumber): \(course.title)")
                        if course.isEnrolled{
                            Image(systemName: "checkmark")
                        }
                    }
                    .swipeActions {
                           if !course.isEnrolled {
                               Button(action: {
                                   // Enroll the user in the course
                                   disciplines.forEach { disc in
                                       if let courseIndex = disc.courses.firstIndex(where: { $0.id == course.id }) {
                                           disciplines[disc.id].courses[courseIndex].isEnrolled = true
                                       }
                                   }
                               }) {
                                   Text("Enroll")
                               }
                               .tint(.green)
   .padding()
}
}
                    
                    
                    
                }
                
                
            }
            
        }
    
        .navigationTitle("Courses")
        
    }
}

struct Course : Identifiable{
    let id = UUID()
    let courseNumber: String
    let title: String
    var isEnrolled: Bool = false
    
    init(courseNumber: String, title: String) {
            self.courseNumber = courseNumber
            self.title = title
        }
}

struct Discipline: Identifiable {
    let id = UUID()
    let name: String
    let abbreviation: String
    var courses: [Course]
}

    struct CascadiaClassesView_Previews: PreviewProvider {
        static var previews: some View {
            CascadiaClassesView()
            
            
        }
    }

