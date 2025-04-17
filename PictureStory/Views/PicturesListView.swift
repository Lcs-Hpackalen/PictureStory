//
//  PicturesListView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct PicturesListView: View {
    @Environment(PictureViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.pink)
                    Text("Picture Story")
                        .font(.system(size: 55))
                }
                .scaledToFit()
                List(viewModel.Pictures) { currentPicture in
                    PictureView()
                }
            }
        }
    }
}

#Preview {
    PicturesListView()
        .environment(PictureViewModel())
}
