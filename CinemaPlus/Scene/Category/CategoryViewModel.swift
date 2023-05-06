//
//  CategoryViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 2.05.2023.
//

import Foundation

struct CategoryList {
    let title: String
    let items: [MovieResult]
}

class CategoryViewModel {
    var category = [CategoryList]()
    
    var items: [HomeCategory] = [.popular, .topRated, .upcoming]
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
}



    
    

