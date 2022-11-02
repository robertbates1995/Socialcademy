//
//  SocialcademyApp.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/1/22.
//

import SwiftUI
import Firebase

@main
struct SocialcademyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            PostsList()
        }
    }
}
