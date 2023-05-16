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
    @State private var selectedCourses: Set<Course> = []
    @State private var isInSelectionMode = false
    
    func enroll(_ course: Course) {
        if enrolledCourses.contains(course) {
            enrolledCourses.remove(course)
            alertMessage = "You have unenrolled from \(course.title)."
        } else {
            enrolledCourses.insert(course)
            alertMessage = "Congratulations, you have enrolled in \(course.title)!"
        }
        showAlert = true
    }
    
    func enrollSelectedCourses() {
        for course in selectedCourses {
            enroll(course)
        }
        selectedCourses = []
        isInSelectionMode = false
    }

    var body: some View {
        VStack {
            if !isInSelectionMode {
                Text("Cascadia Classes")
                    .font(.largeTitle)
            } else {
                HStack {
                    Button("Cancel") {
                        selectedCourses = []
                        isInSelectionMode = false
                    }
                    Spacer()
                    Button("Enroll") {
                        enrollSelectedCourses()
                    }
                }
                .padding()
            }
            
            List {
                ForEach(disciplines) { discipline in
                    Section(header: Text(discipline.name)) {
                        ForEach(discipline.courses) { course in
                            HStack {
                                if isInSelectionMode {
                                    Image(systemName: selectedCourses.contains(course) ? "checkmark.circle.fill" : "circle")
                                        .onTapGesture {
                                            if selectedCourses.contains(course) {
                                                selectedCourses.remove(course)
                                            } else {
                                                selectedCourses.insert(course)
                                            }
                                        }
                                }
                                Text("\(discipline.abbreviation) \(course.courseNumber):")
                                Text(course.title)
                                Spacer()
                                if enrolledCourses.contains(course) {
                                    Button(action: {
                                        enroll(course)
                                    }) {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.green)
                                    }
                                } else {
                                    Button(action: {
                                        enroll(course)
                                    }) {
                                        Text("Enroll")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Enrollment"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
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

// Like "IT-MOB 381" or "ENG 101" or


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

@available(iOS 15.0, *)
struct CascadiaClassesView_Previews: PreviewProvider {
    static var previews: some View {
        CascadiaClassesView()
    }
}
