//
//  PicturesListView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct PicturesListView: View {
    //MARK: Stored Properties
    @EnvironmentObject var viewModel: PictureViewModel
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.pink)
                    
                    Text("Picture Story")
                        .font(.system(size: 55))
                }
                .padding()
                .scaledToFit()

                List(viewModel.pictures) { currentPicture in
                    
                    NavigationLink{ DetailPictureView(picture: currentPicture)
                    } label: {
                        PictureView(picture: currentPicture)
                    
                    }
                }
                                .listStyle(.plain)
            }
        }
        
    }
}

#Preview {
    PicturesListView()
        .environmentObject(PictureViewModel())
}
