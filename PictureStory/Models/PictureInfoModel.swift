//
//  PictureInfoModel.swift
//  PictureStory
//
//  Created by Hannu Packalen on 2025-04-16.
//

import Foundation
import SwiftUICore
import SwiftUI

struct PictureInfo: Identifiable{
    let id = UUID()
    let Picture: String
    let When: Date
    let Where: String
    let Who: String
    let Story: String
}
 
let example1 = PictureInfo(Picture: "Example1", When: Calendar.current.date(from : DateComponents(year: 2024, month: 11, day: 15)) ?? Date(), Where: "Kingston", Who: "Hannu and Dr.Borshnick", Story: "Dr.Borshnick was the doctor that helped Hannu throughout his achelies injury this is the day Hannu was told he's aloud back on the ice")

let example2 = PictureInfo(Picture: "Example2", When: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 15)) ?? Date(), Where: "Ottowa", Who: "Kotter, Jack, Zach, and Austin", Story: "Hannu is taking a picture at the last Vipers tournament with everyone in the car as Frank can't drive us back to the hotel")

let example3 = PictureInfo(Picture:"Example3", When: Calendar.current.date(from: DateComponents(year: 2025, month: 02, day: 15)) ?? Date(), Where: "At home in kingston", Who: "Hannu, Onni, Eetu, Kelley and Mikko", Story: "Hannus' birthday dinner")
