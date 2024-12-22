//
//  ContentViewApp.swift
//  ContentView
//
//  Created by Fay Turad Madani on 17/06/1446 AH.
//

import SwiftUI
import SwiftData

@main
struct ContentViewApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                
                ContentView()
                    .navigationBarBackButtonHidden(true)
            }
                .modelContainer(for: Nuba.self)  // Ensure Nuba is part of the container
        }
    }
}

