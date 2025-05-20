//
//  ThrowbackView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct ThrowbackView: View {
    //MARK: Stored Properties
    @EnvironmentObject var viewModel: PictureViewModel
    
    @State var isFlipped: Bool = false
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack {
            if isFlipped == false {
                ZStack{
                    Color.pink.ignoresSafeArea()
                    VStack{
                        ZStack{
                            Ribbon()
                            Text("Throwback")
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .foregroundColor(.white)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ThrowbackView()
}
