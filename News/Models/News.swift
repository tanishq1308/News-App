//
//  News.swift
//  News
//
//  Created by Tanishq Kakkar on 25/01/22.
//

import Foundation

class News: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
        
    }
    func getImageData() {

        if urlToImage == nil {
            urlToImage = Constants.noImage
        }

        if let url = URL(string: urlToImage!) {

            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in

                if error == nil {

                    DispatchQueue.main.async {
                        // Set the image data
                        self.imageData = data!
                    }
                }

            }
            dataTask.resume()
        }

    }
    
}

struct Source: Decodable {
    
    var id: String?
    var name: String?
    
}
