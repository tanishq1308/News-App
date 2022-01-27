//
//  ContentModel.swift
//  News
//
//  Created by Tanishq Kakkar on 25/01/22.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
 
    var styleData: Data?
    
    @Published var country = ""
    @Published var news = [News]()
    
    func getString(url: String) -> String {
        
        if let url = URL(string: url) {
            do {
                let contents = try String(contentsOf: url)
                return addStyling(htmlString: contents)
            } catch {
                print(error)
            }
        }
        return Constants.noNews
    }
    
    func addStyling(htmlString: String) -> String {
        
        var resultString = String()
        var data = Data()
        
        // Add the styling data
        if styleData != nil {
            data.append(styleData!)
        }
        
        // Add the html data
        data.append(Data(htmlString.utf8))
        
        // Convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
            resultString = attributedString.string
        }
        
        return resultString
        
    }
    
    func getNews(country: String) {
        
        self.country = country
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "apiKey", value: Constants.apiKey)
        ]
        let url = urlComponents?.url
        
        if let url = url {
            
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                
                if error == nil {
                    
                    do {
                        
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(NewsGroup.self, from: data!)
                        
                        var articles = result.articles
                        articles.sort { (b1, b2) -> Bool in
                            return b1.publishedAt ?? "" > b2.publishedAt ?? ""
                        }
                        
                        for a in articles {
                            a.getImageData()
                        }
                        
                        DispatchQueue.main.async {
                            
                            self.news = articles
                            
                        }
                        
                    }
                    catch {
                        print(error)
                    }
                    
                }
            }
            dataTask.resume()
        }
        
    }
    
}
