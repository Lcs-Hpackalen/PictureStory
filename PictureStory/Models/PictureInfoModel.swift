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
    let Picture: Data
    let When: Date
    let Where: String
    let Who: String
    let Story: String
}
 
let example4 = PictureInfo(
    Picture: UIImage(named: "Example1")!.jpegData(compressionQuality: 1.0)!,
    When: Calendar.current.date(from : DateComponents(year: 2024, month: 11, day: 15)) ?? Date(),
    Where: "Kingston",
    Who: "Hannu and Dr.Borshnick",
    Story: "Dr.Borshnick helped Hannu through his Achilles injury. This was the day he was cleared to return to the ice."
)

let example2 = PictureInfo(
    Picture: UIImage(named: "Example2")!.jpegData(compressionQuality: 1.0)!,
    When: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 15)) ?? Date(),
    Where: "Ottawa",
    Who: "Kotter, Jack, Zach, and Austin",
    Story: "Final Vipers tournament; everyone in the car as Frank couldn't drive back to the hotel."
)

let example3 = PictureInfo(
    Picture: UIImage(named: "Example3")!.jpegData(compressionQuality: 1.0)!,
    When: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 15)) ?? Date(),
    Where: "At home in Kingston",
    Who: "Hannu, Onni, Eetu, Kelley, and Mikko",
    Story: "Hannu's birthday dinner."
)
