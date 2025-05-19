//
//  ContentView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-16.
//

import SwiftUI

struct MainTabView: View {
    //MARK: Stored Properties
    
    //MARK: Computed Properties
    var body: some View {
        
        TabView {
            PicturesListView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Pictures")
                }
                .tag(1)
            
            FavouritesListView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                }
                .tag(2)
            
            ThrowbackView()
                .tabItem {
                    Image(systemName: "Clock")
                    Text("Throwback")
                }
            
            
            
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(PictureViewModel())
}
