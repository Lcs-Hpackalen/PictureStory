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
    
    
    
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack {
            ZStack{
                Color.customPink
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.cyan)
                        Text("Favourite Pictures")
                            .font(.system(size: 40))
                    }
                    .padding()
                    .scaledToFit()
                    
                    List(viewModel.favouritePictures) { currentPicture in
                        
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
}

#Preview {
    FavouritesListView()
        .environmentObject(PictureViewModel())
}
