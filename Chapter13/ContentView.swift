//
//  ContentView.swift
//  Chapter13
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            BasicListsView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Lists: Basic")
                }
            GroupedListsView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Grouped")
                }
            DeleteMoveListsView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Delete, Move")
                }
            CustomSwipesView()
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("Custom Swipe")
                }
            CascadiaClassesView()
                .tabItem {
                    Image(systemName: "5.square")
                    Text("Exercise")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

