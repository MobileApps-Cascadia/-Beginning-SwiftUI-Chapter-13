//
//  BasicLists.swift
//  Chapter13
//
//  Created by Mike Panitz on 4/30/23.
//

import SwiftUI

struct CascadiaClassesView: View {
    let disciplines = [
        Discipline(name: "English", abbreviation: "ENG", courses: [
            Course(courseNumber: 101, title: "English Composition"),
            Course(courseNumber: 205, title: "American Literature"),
            Course(courseNumber: 301, title: "Shakespeare")
        ]),
        Discipline(name: "Math", abbreviation: "MATH", courses: [
            Course(courseNumber: 101, title: "Algebra"),
            Course(courseNumber: 201, title: "Calculus I"),
            Course(courseNumber: 305, title: "Linear Algebra")
        ]),
        Discipline(name: "Computer Science", abbreviation: "CS", courses: [
            Course(courseNumber: 101, title: "Intro to Programming"),
            Course(courseNumber: 202, title: "Data Structures"),
            Course(courseNumber: 381, title: "iOS Application Development I")
        ])
    ]
    
    @State private var enrolledCourses: Set<Course> = []
    @State private var showAlert = false
    @State private var alertMessage = ""

    func enroll(_ course: Course) {
        if enrolledCourses.contains(course) {
            return // already enrolled
        }
        
        enrolledCourses.insert(course)
        alertMessage = "Congratulations, you have enrolled in \(course.title)!"
        showAlert = true
    }

    var body: some View {
        VStack {
            Text("Cascadia Classes")
                .font(.largeTitle)

            ForEach(disciplines) { discipline in
                Section(header: Text(discipline.name)) {
                    ForEach(discipline.courses) { course in
                        HStack {
                            Text("\(discipline.abbreviation) \(course.courseNumber):")
                            Text(course.title)
                            Spacer()
                            if enrolledCourses.contains(course) {
                                Image(systemName: "checkmark")
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            enroll(course)
                        }
                        .swipeActions {
                            Button(action: {
                                enroll(course)
                            }) {
                                Label("Enroll", systemImage: "plus.circle.fill")
                            }
                            .tint(.green)
                        }
                    }
                }
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage))
        }
    }
}


// Like "IT-MOB", or "ENG" (English) or "MATH"
struct Discipline: Identifiable {
    let id = UUID()
    let name: String
    let abbreviation: String
    var courses: [Course]
}

// Like "IT-MOB 381" or "ENG 101" or "MATH &107"
struct Course: Identifiable, Equatable, Hashable {
    let id = UUID()
    let courseNumber: Int
    let title: String
    var isEnrolled: Bool = false
    
    static func == (lhs: Course, rhs: Course) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


struct CascadiaClassesView_Previews: PreviewProvider {
    static var previews: some View {
        CascadiaClassesView()
    }
}
