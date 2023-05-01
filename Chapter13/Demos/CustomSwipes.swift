import SwiftUI
@available(iOS 15.0, *)
struct CustomSwipesView: View {
    @State var myArray = ["Cat", "Dog", "Turtle", "Ferret", "Parrot", "Goldfish", "Lizard", "Canary", "Tarantula", "Hamster"]
    @State var message = ""
    var body: some View {
        VStack {
            Text("Custom Swipe Actions")
                .font(.largeTitle)
            Text("\(message)")
            List {
                ForEach(0...myArray.count - 1, id: \.self) { index in
                    Text(myArray[index])
                        .swipeActions(edge: .trailing) {
                            Button {
                                message = "Item = \(myArray[index]) -- Index = \(index)"
                            } label: {
                                Image(systemName: "calendar.circle")
                            }.tint(.yellow)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                message = "Green button selected"
                            } label: {
                                Image(systemName: "book")
                            }.tint(.green)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                message = "Left to right swipe"
                            } label: {
                                Image(systemName: "graduationcap")
                            }.tint(.purple)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                message = "Left to right swipe #2"
                            } label: {
                                Image(systemName: "graduationcap")
                            }.tint(.blue)
                        }
                }
            }
        }
    }
}
@available(iOS 15.0, *)
struct CustomSwipesView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSwipesView()
    }
}
