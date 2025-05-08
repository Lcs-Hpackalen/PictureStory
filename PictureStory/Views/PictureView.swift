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
    
   
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            
            if let currentPicture = viewModel.CurrentPicture{
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.cyan)
                    HStack{
                        ZStack{
                            Image(currentPicture.Picture)
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
                                    Text("Where: \(currentPicture.Where) ")
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
                            Text("When: \(currentPicture.When.formatted(.dateTime.day().month().year()))")
                            Text("Story: \(currentPicture.Story)")
                        }
                    }
                }
                .scaledToFit()
            }
        }
    }
}
    

#Preview {
    
    PictureView()
        .environment(PictureViewModel())
}
