//
//  ThrowbackView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct ThrowbackView: View {
    //MARK: Stored Properties
    var currentPicture: PictureInfo?
    
    @EnvironmentObject var viewModel: PictureViewModel
    
    @State var isFlipped: Bool = false
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack {
            if isFlipped == false {
                ZStack{
                    Color.pink.ignoresSafeArea()
                    VStack{
                        ZStack(alignment: .top){
                            Ribbon()
                            Text("Throwback")
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .padding(.top)
                        }
                
                        ZStack{
                            Color.brown
                                .scaledToFill()
                            if let currentPicture = currentPicture,
                                let uiImage = UIImage(data: currentPicture.Picture) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                        .padding()
                            } else {
                                    Text("Image failed to load")
                                }
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    ThrowbackView(currentPicture: example3)
        .environmentObject(PictureViewModel())
}
