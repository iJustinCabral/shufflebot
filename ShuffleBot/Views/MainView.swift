//
//  MainView.swift
//  ShuffleBot
//
//  Created by Justin Cabral on 1/5/23.
//

import SwiftUI

struct MainView: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.stack.fill")
                        Text("Dashboard")
                    }
                }
            
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
        }
        .tint(.mint)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
