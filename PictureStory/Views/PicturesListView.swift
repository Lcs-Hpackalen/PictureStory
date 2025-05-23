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
    
    @State var isShowingAddPictureForm = false
    //MARK: Computed Properties
    var body: some View {
        NavigationStack {
            ZStack{
                Color.lightBlue
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.customPink)
                        
                        Text("Picture Story")
                            .font(.system(size: 55))
                    }
                    .scaledToFit()
                    
                    List(viewModel.pictures) { currentPicture in
                        
                        NavigationLink{ DetailPictureView(currentPicture: currentPicture)
                        } label: {
                            PictureView(currentPicture: currentPicture)
                        }
                        .swipeActions(edge: .leading) {
                            Button(role: .destructive) {
                                viewModel.deletePicture(Picture: currentPicture)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        
                        .swipeActions(edge: .trailing) {
                            if viewModel.favouritePictureIDs.contains(currentPicture.id) == false {
                                Button {
                                    viewModel.toggleFavourite(for: currentPicture)
                                } label: {
                                    Label("Favourite", systemImage: "heart")
                                }
                                .tint(.pink)
                            }
                            if viewModel.favouritePictureIDs.contains(currentPicture.id) == true {
                                Button{
                                    viewModel.toggleFavourite(for: currentPicture)
                                } label: {
                                    Label("UnFavourite", systemImage: "heart.slash")
                                }
                                .tint(.pink)
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isShowingAddPictureForm = true
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
                .sheet(isPresented: $isShowingAddPictureForm) {
                    AddNewPictureView(isShowing: $isShowingAddPictureForm)
                        .environmentObject(viewModel)
                }
            }
        }
    }
}
#Preview {
    PicturesListView()
        .environmentObject(PictureViewModel())
}
