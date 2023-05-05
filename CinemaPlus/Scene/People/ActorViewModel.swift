//
//  ActorViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 17.04.2023.
//

import Foundation

class PeopleViewModel {
    
    var items = [PeopleResult]()
    var people: People?
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getPopularPeople() {
        PeopleManager.shared.getPopularPeople(page: (people?.page ?? 0) + 1) { people, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let people = people {
                self.people = people
                self.items.append(contentsOf: people.result ?? [])
                self.successCallback?()
            }
        }
    }
    
    func pagination(index: Int) {
        if (index == items.count - 1) && (people?.page ?? 0 <= people?.totalPages ?? 0 ) {
            getPopularPeople()
        }
    }
    
    func reset() {
        items.removeAll()
        people = nil
    }
}
