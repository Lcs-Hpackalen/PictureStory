//
//  PicturesView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct PictureView: View {
    //MARK: Stored Propeties
    let currentPicture: PictureInfo
    
    @EnvironmentObject var viewModel: PictureViewModel
    
   
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.cyan)
                HStack{
                    if let uiImage = UIImage(data: currentPicture.Picture) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .background(Color(red: 0.87, green: 0.72, blue: 0.53))
                    } else {
                        Text("Image failed to load")
                    }
                    //Need to add that chatGPT helped with this code
                }
            }
        }
                .scaledToFit()
            }
        }
    

#Preview {
    PictureView(currentPicture: example1)
        .environmentObject(PictureViewModel())
}
