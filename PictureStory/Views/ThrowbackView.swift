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
                .onTapGesture{
                    isFlipped.toggle()
                }
            }
            else if isFlipped == true {
                ZStack{
                    Color.pink.ignoresSafeArea()
                    VStack{
                        Text("Throwback")
                            .font(.system(size: 32, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .padding(.top)
                        if let currentPicture = currentPicture {
                            HStack{
                                Text("Who:")
                                    .font(.system(size: 30))
                                    .bold()
                                Text("\(currentPicture.Who)")
                                    .font(.system(size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            HStack{
                                Text("Where:")
                                    .font(.system(size: 30))
                                    .bold()
                                Text("\(currentPicture.Where)")
                                    .font(.system(size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            HStack{
                                Text("When:")
                                    .font(.system(size: 30))
                                    .bold()
                                Text("\(currentPicture.When.formatted(.dateTime.day().month().year()))")
                                    .font(.system(size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            VStack{
                                Text("Story:")
                                    .font(.system(size: 30))
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(currentPicture.Story)")
                                    .font(.system(size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                .onTapGesture{
                    isFlipped.toggle()
                }
            }
        }
    }
}
#Preview {
    ThrowbackView(currentPicture: example3)
        .environmentObject(PictureViewModel())
}
