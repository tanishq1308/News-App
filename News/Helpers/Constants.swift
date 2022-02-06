//
//  Constants.swift
//  News
//
//  Created by Tanishq Kakkar on 25/01/22.
//

import Foundation

struct Constants {
    
    static var apiKey = "0e77f142955a4099832d1746bf2982a2"
    static var apiUrl = "https://newsapi.org/v2/top-headlines"
    static var country = ["--Select--", "Argentina", "Australia", "Austria", "Belgium", "Brazil", "Bulgaria", "Canada", "China", "Colombia", "Cuba", "Czech Republic", "Egypt", "France", "Germany", "Greece", "Hong Kong", "Hungary", "India", "Indonesia", "Ireland", "Israel", "Italy", "Japan", "Latvia", "Lithuania", "Malaysia", "Mexico", "Morocco", "Netherlands", "New Zealand", "Nigeria", "Norway", "Philippines", "Poland", "Portugal", "Romania", "Russia", "Saudi Arabia", "Serbia", "Singapore", "Slovakia", "Slovenia", "South Africa", "South Korea", "Sweden", "Switzerland", "Taiwan", "Thailand", "Turkey", "UAE", "Ukraine", "United Kingdom", "United States", "Venezuela"]
    
    static var country_code = ["" ,"ar", "au", "at", "be", "br", "bg", "ca", "cn", "co", "cu", "cz", "eg", "fr", "de", "gr", "hk", "hu", "in", "id", "ie", "it", "il", "jp", "lv", "lt", "my", "mx", "ma", "nl", "nz", "ng", "no", "ph", "pl", "pt", "ro", "ru", "sa", "rs", "sg", "sk", "si", "za", "kr", "se", "ch", "tw", "th", "tr", "ae", "ua", "gb", "us", "ve"]
    
    static var noImage = "https://previews.123rf.com/images/hollygraphic/hollygraphic1301/hollygraphic130100016/17177197-black-question-mark-from-question-words.jpg?fj=1"
    
    static var noNews = "Complete news not available. Still collecting information."
    
    static var category = ["ALL CATEGORIES", "BUSINESS", "ENTERTAINMENT", "HEALTH", "SCIENCE", "SPORTS", "TECHNOLOGY"]
    
    static var category_code = ["all", "business", "entertainment", "health", "science", "sports", "technology"]
    
}
