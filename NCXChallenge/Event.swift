//
//  Event.swift
//  NCXChallenge
//
//  Created by Maria Bruno on 02/04/24.
//

import Foundation

var eventsList = [Event]()

class Event {
    
    var id: Int!
    var name: String!
    var date: Date!
    
    func eventsForDate(date: Date) -> [Event] {
        
        var daysEvents = [Event]()
        for event in eventsList{
            if(event.date == date){
                daysEvents.append(event)
                
            }
        }
        return daysEvents
    }
}
