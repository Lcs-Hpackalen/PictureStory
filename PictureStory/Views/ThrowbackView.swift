//
//  ThrowbackView.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-17.
//

import SwiftUI

struct ThrowbackView: View {
    //MARK: Stored Properties
    var currentPicture: PictureInfo?
    { viewModel.throwbackPictures.first}
    
    @EnvironmentObject var viewModel: PictureViewModel
    
    @State var isFlipped: Bool = false
    
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack {
                    NavigationStack{
                        if viewModel.throwbackPictures.count != 0 {
                            if isFlipped == false {
                                ZStack(alignment: .top){
                                    Color.pink.ignoresSafeArea()
                                    VStack{
                                        ZStack(alignment: .top){
                                            Ribbon()
                                            Text("Throwback")
                                                .font(.system(size: 32, weight: .bold, design: .default))
                                                .foregroundColor(.white)
                                            
                                        }
                                        ZStack{
                                            Color.brown
                                                .scaledToFit()
                                            if let currentPicture = currentPicture,
                                               let uiImage = UIImage(data: currentPicture.Picture) {
                                                Image(uiImage: uiImage)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .padding()
                                                    .padding()
                                            } else {
                                                Text("Image failed to load")
                                            }
                                            Spacer()
                                        }
                                    }
                                }
                                .onTapGesture{
                                    isFlipped.toggle()
                                }
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        Button {
                                            viewModel.removeFromThrowBackPictures()
                                        } label: {
                                            Text("Next->")
                                        }
                                    }
                                }
                                
                            }
                            else if isFlipped == true {
                                NavigationStack{
                                    ZStack(alignment: .topLeading){
                                        Color.oldPaper
                                            .ignoresSafeArea()
                                        VStack{
                                            Text("Throwback")
                                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                                .foregroundColor(.purple)
                                                .padding(.top)
                                            if let currentPicture = currentPicture {
                                                HStack{
                                                    Text("Who:")
                                                        .font(.system(size: 40))
                                                        .bold()
                                                    Text("\(currentPicture.Who)")
                                                        .font(.system(size: 25))
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                }
                                                HStack{
                                                    Text("Where:")
                                                        .font(.system(size: 40))
                                                        .bold()
                                                    Text("\(currentPicture.Where)")
                                                        .font(.system(size: 25))
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                }
                                                HStack{
                                                    Text("When:")
                                                        .font(.system(size: 40))
                                                        .bold()
                                                    Text("\(currentPicture.When.formatted(.dateTime.day().month().year()))")
                                                        .font(.system(size: 25))
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                }
                                                VStack{
                                                    Text("Story:")
                                                        .font(.system(size: 40))
                                                        .bold()
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                    Text("\(currentPicture.Story)")
                                                        .font(.system(size: 25))
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                }
                                            }
                                        }
                                    }
                                    .toolbar {
                                        ToolbarItem(placement: .navigationBarTrailing) {
                                            Button {
                                                viewModel.removeFromThrowBackPictures()
                                            } label: {
                                                Text("Next >")
                                            }
                                        }
                                    }
                                    
                                    
                                    .onTapGesture{
                                        isFlipped.toggle()
                                    }
                                }
                            }
                        }
                    else if viewModel.throwbackPictures.count == 0{
                        VStack{
                            Text("No throwback pictures today!")
                                .font(.system(size: 40))
                                .bold()
                            Text("Throwback Pictures will apear when a picture date is an even year ago!")
                        }
                        .background(.cyan)
                        .ignoresSafeArea()
                }
            }
        }
    }
}
#Preview {
    ThrowbackView()
        .environmentObject(PictureViewModel())
}
