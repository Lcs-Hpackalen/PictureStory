//
//  PicturesListView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct PicturesListView: View {
    @EnvironmentObject var viewModel: PictureViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.pink)
                    Text("Picture Story")
                        .font(.system(size: 55))
                }
                .padding()
                .scaledToFit()

            List(viewModel.pictures) { currentPicture in
                    PictureView (picture: currentPicture)
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
