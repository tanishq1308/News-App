//
//  NewsHeadline.swift
//  News
//
//  Created by Tanishq Kakkar on 25/01/22.
//

import SwiftUI

struct NewsHeadline: View {
    
    @ObservedObject var news: News
    
    var body: some View {
        
        HStack {
            
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(height: 600)
                    .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    let uiImage = UIImage(data: news.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .frame(width: 340, height: 200)
                        .clipped()
                        .cornerRadius(5)
                        .scaledToFit()
                        .padding(.top, 45)
                        .padding(.leading, 10)
                    
                    Text(news.title ?? "No title...")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    Text(news.description ?? "Tap to read more...")
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    
                    Spacer()
                    
                }
                
            }
            .padding(.horizontal)
            
        }
        
    }
}
