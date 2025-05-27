//
//  IntroView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-05-21.
//

import SwiftUI

struct IntroView: View {
    //MARK: Stored Properties
    
    @State var hasEntered = false
    
    //MARK: Computed Properties
    var body: some View {
        if hasEntered == true{
            MainTabView()
        }
        else{
            ZStack{
                Color.introColour.ignoresSafeArea()
                VStack{
                    Text("Welcome to Picture Story")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundStyle(.pink)
                    Image("IntroImage")
                        .resizable()
                        .scaledToFit()
                    Text("Capture the moments that mean the most to you")
                        .font(.system(size: 30, weight: .light))
                        .foregroundStyle(.cyan)
                        .padding()
                    Text("Tap anywhere to enter")
                        .font(.system(size: 20, weight: .light))
                }
            }
            .onTapGesture {
                hasEntered = true
            }
        }
    }
}

#Preview {
    IntroView()
        .environmentObject(PictureViewModel())
}
