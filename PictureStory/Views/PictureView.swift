//
//  PicturesView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI
import PhotosUI

struct PictureView: View {
    //MARK: Stored Propeties
    let currentPicture: PictureInfo
    
    @EnvironmentObject var viewModel: PictureViewModel
    
   
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            
            ZStack{
                if viewModel.favouritePictureIDs.contains(currentPicture.id){
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.pink)
                }
                else {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.cyan)
                }
                if let uiImage = UIImage(data: currentPicture.Picture) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .background(Color.woodFrame)
                            .padding()
                    } else {
                        Text("Image failed to load")
                    }
                
            }
            
        }
                .scaledToFit()
            }
        }
    

#Preview {
    PictureView(currentPicture: example3)
        .environmentObject(PictureViewModel())
}
