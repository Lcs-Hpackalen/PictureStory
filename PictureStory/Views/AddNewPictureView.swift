//
//  AddNewPictureView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-05-19.
//

import SwiftUI
import PhotosUI

struct AddNewPictureView: View {
    //MARK: Stored Properties
    @State private var imageData: Data?
    @State private var selectedItem: PhotosPickerItem?
    
    @State var date: Date = Date()
    @State var location: String = ""
    @State var people: String = ""
    @State var story: String = ""
    
    @Binding var isShowing: Bool
    
    @EnvironmentObject var viewModel: PictureViewModel
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Add an Image")){
                    PhotosPicker("Select A Photo", selection: $selectedItem, matching: .images)
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    imageData = data
                                }
                            }
                        }
                    
                    if let imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }
                
                // NOTE: This code was co-developed with the help of a large language model (ChatGPT).
                // You can view my conversation with ChatGPT here: //https://chatgpt.com/share/68350d91-0430-8011-81fe-42b77a2d208f
                
                
                Section(header: Text("Details")) {
                    TextField("Location", text: $location)
                    TextField("People", text: $people)
                }
                Section(header: Text("Date")) {
                    DatePicker("When", selection: $date, in: ...Date(), displayedComponents: .date)
                }
                Section(header: Text("Story")) {
                    TextEditor(text: $story)
                        .frame(height: 200)
                }
            }
            .navigationTitle("Add Picture")
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        guard let imageData = imageData else {
                            return
                        }
                        let newPicture = PictureInfo(
                            Picture: imageData,
                            When: date,
                            Where: location,
                            Who: people,
                            Story: story,
                            isFavourited: false
                        )
                        viewModel.addPicture(picture: newPicture)
                        
                        
                        isShowing = false
                        
                        
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}
#Preview {
    AddNewPictureView(isShowing: .constant(true))
        .environmentObject(PictureViewModel())
}
