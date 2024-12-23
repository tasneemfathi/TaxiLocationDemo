//
//  AppDateFormatter.swift
//  sunset
//
//  Created by tasneem .. on 06/03/2023.
//

import Foundation
import SwiftUI

class AppDateFormatter {
    /// Extentiond Date function to convert date style from timeZoneDate to timeMillis
    /// ```
    /// Example : from "2023-01-17T07:37:49.000000Z" to timeMillis
    /// ```
   static func timeZoneToMillis(_ date: String) -> Double {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
       return (dateFormatter.date(from: date)?.timeIntervalSince1970 ?? 0.0 ) * 1000
    }

    /// Extentiond Date function to convert date style from api to another style formatter
    /// ```
    /// Example : from "2023-01-17T07:37:49.000000Z" to "29-11-2022 . 08:00 AM"
    /// ```
   static func formatApiTimeDate(_ date: String) -> String {
        let dateFormatter   = DateFormatter()
       dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
       let newDate = dateFormatter.date(from: date)
       dateFormatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd . hh:mm aa")
       dateFormatter.amSymbol = "AM"
       dateFormatter.pmSymbol = "PM"
       return dateFormatter.string(from: newDate!)
    }

    /// Extentiond Date function to convert date  object  to another style formatter
    /// ```
    /// Example : from Date Object to "29-11-2022"
    /// ```
   static func formatDateToDate(_ date: Date) -> String {
       let dateFormatter   = DateFormatter()
       dateFormatter.locale = Locale(identifier: "es_ES")
       dateFormatter.dateFormat = "yyyy-MM-dd"
       return dateFormatter.string(from: date)
    }

    /// Extentiond Date function to convert date style from 24 format to 12 format
    /// ```
    /// Example : from "16:00:00" to "04:00 AM"
    /// ```
   static func formatTime24To12(_ time: String) -> String {
        let dateFormatter   = DateFormatter()
       dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateFormat = "HH:mm:ss"
       let newDate = dateFormatter.date(from: time)
       dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm aa")
       dateFormatter.amSymbol = "AM"
       dateFormatter.pmSymbol = "PM"
       return dateFormatter.string(from: newDate!)
    }


    /// Extentiond Date  check if orderDate is today
    static func isToday(date:String) -> Bool{
        let dateFormatter   = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formatedDate = dateFormatter.date(from: date)
        return Calendar.current.isDateInToday(formatedDate ?? Date())
    }

    static func convertDateToMinutes(timeInMillis:Double) -> Int{
        let date = Date(timeIntervalSince1970: timeInMillis)
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: date)
        let hour = comp.hour ?? 0
        let minute = comp.minute ?? 0
        print(hour)
        let finalMinut:Int = (hour * 60) + minute
        print(finalMinut)
        return finalMinut
    }
}
