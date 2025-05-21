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
                NavigationStack(){
                    ZStack(alignment: .topLeading){
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 0.98, green: 0.95, blue: 0.80),
                                Color(red: 0.83, green: 0.75, blue: 0.68)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ).ignoresSafeArea()
                        VStack{
                            Text("Throwback")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.purple)
                                .padding(.top)
                            if let currentPicture = currentPicture {
                                HStack{
                                    Text("Who:")
                                        .font(.system(size: 40))
                                        .bold()
                                    Text("\(currentPicture.Who)")
                                        .font(.system(size: 25))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                HStack{
                                    Text("Where:")
                                        .font(.system(size: 40))
                                        .bold()
                                    Text("\(currentPicture.Where)")
                                        .font(.system(size: 25))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                HStack{
                                    Text("When:")
                                        .font(.system(size: 40))
                                        .bold()
                                    Text("\(currentPicture.When.formatted(.dateTime.day().month().year()))")
                                        .font(.system(size: 25))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                VStack{
                                    Text("Story:")
                                        .font(.system(size: 40))
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(currentPicture.Story)")
                                        .font(.system(size: 25))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
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
