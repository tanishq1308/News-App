//
//  NewsGroup.swift
//  News
//
//  Created by Tanishq Kakkar on 25/01/22.
//

import Foundation

struct NewsGroup: Decodable {
    
    var status = ""
    var totalResults = 0
    var articles = [News()]
    
}
