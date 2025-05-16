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
    
    @Published var pictures: [PictureInfo] = [example1, example2, example3]

    
    @Published var favouritePictures: [PictureInfo] = []
    
    @Published var errorMessage: String? = "Please add a new Picture"
    
    @Published var isFavourited: Bool = false
    //MARK: Computed Properties
    
    
    //MARK: Initializers
   
    
    //MARK: Functions
    func favouritePicture() {
        if self.currentPicture != nil {
            favouritePictures.insert(currentPicture!, at: 0)
        }
        
        print("There are \(favouritePictures.count) pictures favourited")
        
        isFavourited = true
    }
    func unFavouritePicture() {
        if self.currentPicture != nil {
            favouritePictures.remove(at: 0)
        }
        
        print("There are \(favouritePictures.count) pictures favourited")
        
        isFavourited = false
    }
    func add (picture: PictureInfo){
        
        pictures.append(picture)
        
    }
}
