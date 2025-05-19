//
//  FavouritesListView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct FavouritesListView: View {
    //MARK: Stored Properties
    @EnvironmentObject var viewModel: PictureViewModel
    
    
    
    var favouritePictures: [PictureInfo] {
            viewModel.pictures.filter { picture in
                viewModel.favouritePictureIDs.contains(picture.id)
            }
        }
    //MARK: Computed Properties
    var body: some View {
        NavigationStack {
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.pink)
                    Text("Favourite Pictures")
                        .font(.system(size: 40))
                }
                .padding()
                .scaledToFit()

                List(favouritePictures) { currentPicture in
                    
                    NavigationLink{ DetailPictureView(currentPicture: currentPicture)
                    } label: {
                        PictureView(currentPicture: currentPicture)
                    
                    }
                }
                                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    FavouritesListView()
        .environmentObject(PictureViewModel())
}
