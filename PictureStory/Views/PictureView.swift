//
//  PicturesView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct PictureView: View {
    //MARK: Stored Propeties
    let picture: PictureInfo
    
    @EnvironmentObject var viewModel: PictureViewModel
    
   
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.cyan)
                    HStack{
                        ZStack{
                            Image(picture.Picture)
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .background(Color(red: 0.87, green: 0.72, blue: 0.53))
                            //Need to add that chatGPT helped with this code
                                .padding()
                        }
                        VStack{
                            HStack{
                                VStack{
                                    Text("Where: \(picture.Where) ")
                                    Text ("Who: \(picture.Who)")
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
                            Text("When: \(picture.When.formatted(.dateTime.day().month().year()))")
                            Text("Story: \(picture.Story)")
                        }
                    }
                }
                .scaledToFit()
            }
        }
    }
    

#Preview {
    PictureView(picture: example1)
        .environmentObject(PictureViewModel())
}
