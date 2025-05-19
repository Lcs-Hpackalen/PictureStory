//
//  DetailPictureView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-05-17.
//

import SwiftUI

struct DetailPictureView: View {
    //MARK: Stored Properties
    let picture: PictureInfo
    
    @EnvironmentObject var viewModel: PictureViewModel
    
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            ZStack{
                Color.orange
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .ignoresSafeArea()
                        HStack{
                            if viewModel.isFavourited(picture) == false {
                                Button(action: {
                                    viewModel.toggleFavourite(for: picture)
                                }) {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.red)
                                }
                            } else {
                                Button(action: {
                                    viewModel.toggleFavourite(for: picture)
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
                        Image(picture.Picture)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                    VStack{
                        HStack{
                            Text("Who:")
                                .font(.system(size: 30))
                                .bold()
                            Text("\(picture.Who)")
                                .font(.system(size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        HStack{
                            Text("Where:")
                                .font(.system(size: 30))
                                .bold()
                            Text("\(picture.Where)")
                                .font(.system(size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        HStack{
                            Text("When:")
                                .font(.system(size: 30))
                                .bold()
                            Text("\(picture.When.formatted(.dateTime.day().month().year()))")
                                .font(.system(size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        VStack{
                            Text("Story:")
                                .font(.system(size: 30))
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(picture.Story)")
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
    DetailPictureView(picture: example2)
        .environmentObject(PictureViewModel())
}
