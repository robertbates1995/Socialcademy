//
//  SocialcademyApp.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/1/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      Auth.auth().signIn(withEmail: "test@gmail.com", password: "Goodsushi47")
    return true
  }
}

@main
struct SocialcademyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            PostsList().onAppear { }
        }
    }
}
