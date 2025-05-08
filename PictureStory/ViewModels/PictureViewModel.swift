//
//  PictureViewModel.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import Foundation
@Observable
class PictureViewModel {
    //MARK: Stored Properties
    
    var CurrentPicture: PictureInfo? = example2
    
    var Pictures: [PictureInfo] = [example1, example2, example3]

    
    var FavouritePictures: [PictureInfo] = []
    
    var ErrorMessage: String? = "Please add a new Picture"
    
    var isFavourited: Bool = false
    //MARK: Computed Properties
    
    
    //MARK: Initializers
   
    
    //MARK: Functions
    func favouritePicture() {
        if self.CurrentPicture != nil {
            FavouritePictures.insert(CurrentPicture!, at: 0)
        }
        
        print("There are \(FavouritePictures.count) pictures favourited")
        
        isFavourited = true
    }
    func unFavouritePicture() {
        if self.CurrentPicture != nil {
            FavouritePictures.remove(at: 0)
        }
        
        print("There are \(FavouritePictures.count) pictures favourited")
        
        isFavourited = false
    }
    func add (picture: PictureInfo){
        
        Pictures.append(picture)
        
    }
}
