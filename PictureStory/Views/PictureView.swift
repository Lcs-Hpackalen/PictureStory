//
//  PicturesView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct PictureView: View {
    //MARK: Stored Propeties
    let picture: PictureInfo
    
    @EnvironmentObject var viewModel: PictureViewModel
    
   
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.cyan)
                HStack{
                    Image(picture.Picture)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .background(Color(red: 0.87, green: 0.72, blue: 0.53))
                    //Need to add that chatGPT helped with this code
                        .padding()
                }
            }
        }
                .scaledToFit()
            }
        }
    

#Preview {
    PictureView(picture: example1)
        .environmentObject(PictureViewModel())
}
