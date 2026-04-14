import SwiftData
import UIKit
import Foundation

@Model
class EventModel {
    var id: UUID
    var eventTitle: String
    var date: Date
    var latitude: Double
    var longitude: Double
    var isFavourite: Bool = false
    var eventImages: [Data]?
    var eventDescription: String?
    var color: String?
    var participants: [String]?
    
    init(id: UUID,
         eventTitle: String,
         date: Date,
         latitude: Double,
         longitude: Double,
         isFavourite: Bool,
         eventImages: [Data]? = nil,
         eventDescription: String? = nil,
         color: String? = nil,
         participants: [String]? = nil) {
        self.id = id
        self.eventTitle = eventTitle
        self.date = date
        self.latitude = latitude
        self.longitude = longitude
        self.isFavourite = isFavourite
        self.eventImages = eventImages
        self.eventDescription = eventDescription
        self.color = color
        self.participants = participants
    }
}
