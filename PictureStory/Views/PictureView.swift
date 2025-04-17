//
//  PicturesView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct PictureView: View {
    //MARK: Stored Propeties
    
    @Environment(PictureViewModel.self) var viewModel
    
    var currentPicture: PictureInfo
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.indigo)
                HStack{
                    Image(currentPicture.Picture )
                        .resizable()
                        .scaledToFit()
                        .padding()
                    VStack{
                        HStack{
                            VStack{
                                Text("Where: \(currentPicture.Where)")
                                Text ("Who: \(currentPicture.Who)")
                            }
                            if viewModel.isFavourited == false{
                                Button(action: {
                                    viewModel.favouritePicture()
                                }, label: {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.red)
                                }
                                       )
                            }
                            else if viewModel.isFavourited == true{
                                Button(action:{
                                    viewModel.unFavouritePicture()
                                }, label: {
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.red)
                                }
                                )
                            }
                                
                        }
                        Text("When: \(currentPicture.When)")
                        Text("Story: \(currentPicture.Story)")
                    }
                }
                }
            .scaledToFit()
            }
        }
    }

#Preview {
    
    PictureView(currentPicture: example1)
        .environment(PictureViewModel())
}
