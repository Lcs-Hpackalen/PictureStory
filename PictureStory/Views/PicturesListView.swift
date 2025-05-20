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
                Color(.mint).ignoresSafeArea()
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
                    }
                    .listStyle(.plain)
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

#Preview {
    PicturesListView()
        .environmentObject(PictureViewModel())
}
