//
//  DetailPictureView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-05-17.
//

import SwiftUI

struct DetailPictureView: View {
    //MARK: Stored Properties
    let currentPicture: PictureInfo
    
    @EnvironmentObject var viewModel: PictureViewModel
    
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            ZStack{
                Color.purple
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        Rectangle()
                            .fill(Color.green)
                            .ignoresSafeArea()
                        HStack{
                            if currentPicture.isFavourited == false {
                                Button(action: {
                                    viewModel.favouritePicture(picture: currentPicture)
                                }) {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.red)
                                }
                            } else {
                                Button(action: {
                                    viewModel.unFavouritePicture(picture: currentPicture)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.red)
                                }
                            }
                            Text("Picture and Info")
                                .font(.system(size: 33))
                            Spacer()
                        }
                    }
                    .scaledToFit()
                    ZStack{
                        Color.brown
                            .scaledToFit()
                        if let uiImage = UIImage(data: currentPicture.Picture) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .padding()
                        } else {
                            Text("Image failed to load")
                        }
                        
                    }
                    VStack{
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
        }
    }
}

#Preview {
    DetailPictureView(currentPicture: example2)
        .environmentObject(PictureViewModel())
}
