//
//  FriendableApp.swift
//  Friendable
//
//  Created by Thaddeus Dronski on 1/9/23.
//

import SwiftUI

@main
struct FriendableApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
