//
//  PicturesView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct PictureView: View {
    //MARK: Stored Propeties
    
    var currentPicture: PictureInfo
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.indigo)
                HStack{
                    Image(currentPicture.Picture)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    VStack{
                        HStack{
                            VStack{
                                Text("Where: \(currentPicture.Where)")
                                Text("When: \(currentPicture.When)")
                                Text ("Who: \(currentPicture.Who)")
                            }
                        }
                        Text("Story: \(currentPicture.Story)")
                    }
                }
                }
            .scaledToFit()
            }
        }
    }

#Preview {
    PictureView(currentPicture: example1)
}
