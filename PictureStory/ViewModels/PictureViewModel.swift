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
    var Pictures: [PictureInfo] = []
    
    var FavouritePictures: [PictureInfo] = []
    
    @Published var image: Data?
    
    
    //MARK: Computed Properties
    
    //MARK: Initializers
    
    //MARK: Functions
}
