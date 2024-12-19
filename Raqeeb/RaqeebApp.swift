//
//  RaqeebApp.swift
//  Raqeeb
//
//  Created by Raghad on 11/12/2024.
//

import SwiftUI
import SwiftData

@main
struct ContentViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Nuba.self)  // Ensure Nuba is part of the container
        }
    }
}
