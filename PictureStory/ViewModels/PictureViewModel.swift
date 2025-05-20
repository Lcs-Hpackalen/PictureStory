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
    
    @Published var throwbackPictures: [PictureInfo] = []
    
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
    func addPicture(picture: PictureInfo) {
        pictures.insert(picture, at: 0)
    }
    
    func deletePicture(Picture: PictureInfo){
        pictures.removeAll { currentPicture in
            return currentPicture.id == Picture.id
        }
    }
    func loadFavouriteQuotes() {
        
        // Get a URL that points to the saved JSON data containing our list of favourite jokes
        let filename = getDocumentsDirectory().appendingPathComponent(fileLabel)
        
        print("Filename we are reading persisted jokes from is:")
        print(filename)
        
        // Attempt to load from the JSON in the stored file
        do {
            
            // Load the raw data
            let data = try Data(contentsOf: filename)
            
            print("Got data from file, contents are:")
            print(String(data: data, encoding: .utf8)!)
            
            // Decode the data into Swift native data structures
            self.pictures = try JSONDecoder().decode([PictureInfo].self, from: data)
            
        } catch {
            
            print(error)
            print("Could not load data from file, initializing with empty list.")
            
            self.pictures = []
        }
        
    }
    // Write favourite jokes to file on device
    func persistFavouriteQuotes() {
        
        // Get a URL that points to the saved JSON data containing our list of people
        let filename = getDocumentsDirectory().appendingPathComponent(fileLabel)
        
        print("Filename we are writing persisted jokes to is is:")
        print(filename)
        
        do {
            
            // Create an encoder
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            // Encode the list of people we've tracked
            let data = try encoder.encode(self.pictures)
            
            // Actually write the JSON file to the documents directory
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            
            print("Wrote data to file, contents are:")
            print(String(data: data, encoding: .utf8)!)
            
            print("Saved data to documents directory successfully.")
            
        } catch {
            
            print(error)
            print("Unable to write list of favourite jokes to documents directory.")
        }
    }
}
