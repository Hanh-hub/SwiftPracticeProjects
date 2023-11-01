//
//  TimeFormatting.swift
//  iCalories
//
//  Created by Hanh Vo on 2/16/23.
//

import Foundation


func calculateTimeScine(date: Date)->String{
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    
    if minutes < 120 {
        return "\(minutes) ago"
    } else if minutes >= 120 && hours < 48 {
        return "\(hours) ago"
    }
    else {
        return "\(days) ago" 
    }
}
