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
                Section(header: Text("Picture Detail")){
                    PhotosPicker("Select A Photo", selection: $selectedItem, matching: .images)
                }
            }
        }
    }
}

#Preview {
    AddNewPictureView(isShowing: .constant(true))
        .environmentObject(PictureViewModel())
}
