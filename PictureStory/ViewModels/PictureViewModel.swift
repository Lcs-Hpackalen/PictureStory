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
    
    @Published var currentPicture: PictureInfo?
    
    @Published var pictures: [PictureInfo] = [example4, example2, example3]
    
    @Published var errorMessage: String? = "Please add a new Picture"
    
    @Published var throwbackPictures: [PictureInfo] = []
    
    @Published var favouritePictures: [PictureInfo] = []
    
    private let picturesFileName = "Pictures"
    
    private let favouritePicturesFileName = "FavouritePictures"
    
    //MARK: Computed Properties
    
    
    //MARK: Initializers
    init(){
        loadSavedPictures()
        loadFavouritePictures()
        addToThrowBackPictures()
    }
    
    //MARK: Functions
    func favouritePicture(picture: PictureInfo) {
        if let index = pictures.firstIndex(where: { $0.id == picture.id }) {
            pictures[index].isFavourited = true
            if !favouritePictures.contains(where: { $0.id == picture.id }) {
                favouritePictures.insert(pictures[index], at: 0)
            }
            persistPictures()
            persistFavouritePictures()
        }
    }

    func unFavouritePicture(picture: PictureInfo) {
        if let index = pictures.firstIndex(where: { $0.id == picture.id }) {
            pictures[index].isFavourited = false
            favouritePictures.removeAll { $0.id == picture.id }
            persistPictures()
            persistFavouritePictures()
        }
    }
    
    func addPicture(picture: PictureInfo) {
        pictures.insert(picture, at: 0)
        persistPictures()
        persistFavouritePictures()
    }
    
    func deletePicture(Picture: PictureInfo){
        pictures.removeAll { currentPicture in
            return currentPicture.id == Picture.id
        }
        persistPictures()
    }
    func loadSavedPictures() {
        
        // Get a URL that points to the saved JSON data containing our list of favourite jokes
        let filename = getDocumentsDirectory().appendingPathComponent(picturesFileName)
        
        print("Filename we are reading persisted pictures from is:")
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
    func persistPictures() {
        
        // Get a URL that points to the saved JSON data containing our list of people
        let filename = getDocumentsDirectory().appendingPathComponent(picturesFileName)
        
        print("Filename we are writing persisted pictures to is:")
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
            print("Unable to write list of pictures to documents directory.")
        }
    }
    func loadFavouritePictures() {
        let filename = getDocumentsDirectory().appendingPathComponent(favouritePicturesFileName)

        print("Loading favourite picture IDs from:")
        print(filename)

        do {
            let data = try Data(contentsOf: filename)
           
        } catch {
            print("Failed to load favourite pictures, starting with empty set.")
            self.favouritePictures = []
        }
    }
    func persistFavouritePictures() {
        // Get a URL that points to the saved JSON data containing our list of people
        let filename = getDocumentsDirectory().appendingPathComponent(favouritePicturesFileName)
        
        print("Filename we are writing persisted pictures to is:")
        print(filename)
        
        do {
            
            // Create an encoder
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            // Encode the list of people we've tracked
            let data = try encoder.encode(self.favouritePictures)
            
            // Actually write the JSON file to the documents directory
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            
            print("Wrote data to file, contents are:")
            print(String(data: data, encoding: .utf8)!)
            
            print("Saved data to documents directory successfully.")
            
        } catch {
            
            print(error)
            print("Unable to write list of pictures to documents directory.")
        }
    }
    func addToThrowBackPictures() {
        for picture in pictures {
            if picture.When.formatted(.dateTime.month().day()) == Date().formatted(.dateTime.month().day()) {
                throwbackPictures.insert(picture, at: 0)
            }
        }
    }
    func removeFromThrowBackPictures() {
        for currentpicture in throwbackPictures {
            throwbackPictures.removeAll { $0.id == currentpicture.id }
        }
    }
}
