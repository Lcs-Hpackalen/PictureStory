//
//  PictureViewModel.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import Foundation

import SwiftUI

import Combine


class PictureViewModel: ObservableObject {
    //MARK: Stored Properties
    
    @Published var currentPicture: PictureInfo? = example2
    
    @Published var pictures: [PictureInfo] = [example4, example2, example3]

    
    @Published var favouritePictures: [PictureInfo] = []
    
    @Published var errorMessage: String? = "Please add a new Picture"
    
    @Published var favouritePictureIDs: Set<UUID> = [example4.id, example2.id]
    //MARK: Computed Properties
    
    
    //MARK: Initializers
   
    
    //MARK: Functions
    func isFavourited(_ picture: PictureInfo) -> Bool {
        favouritePictureIDs.contains(picture.id)
    }

    func toggleFavourite(for picture: PictureInfo) {
        if favouritePictureIDs.contains(picture.id) {
            favouritePictureIDs.remove(picture.id)
        } else {
            favouritePictureIDs.insert(picture.id)
        }
    }
    func add(picture: PictureInfo) {
        pictures.insert(picture, at: 0)
    }
}
