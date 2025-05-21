//
//  PictureStoryApp.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-16.
//

import SwiftUI

@main
struct PictureStoryApp: App {
    //MARK: Computed Properties
    
    @State var ViewModel = PictureViewModel()
    
    //MARK: Computed Properties
    var body: some Scene {
        WindowGroup {
            IntroView()
                .environmentObject(ViewModel)
        }
    }
}
