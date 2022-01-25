//
//  NewsDetail.swift
//  News
//
//  Created by Tanishq Kakkar on 25/01/22.
//

import SwiftUI

struct NewsDetail: View {
    
    @EnvironmentObject var model: ContentModel
    var news: News
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(news.title ?? "")
                        .font(Font.custom("Helvetica", size: 24))
                    
                    Text(news.publishedAt ?? "")
                        .font(Font.custom("Helvetica", size: 15))
                        .foregroundColor(.gray)
                    
                    let uiImage = UIImage(data: news.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .frame(width: 340, height: 200)
                        .clipped()
                        .cornerRadius(5)
                        .scaledToFit()
                        .padding(.leading, 10)
                    
                    Text(model.getString(url: (news.url ?? "")))
                        .font(Font.custom("Helvetica", size: 17))
                }
                .padding(.horizontal, 15)
            }
            .navigationTitle(news.source?.name ?? "")
        }
    }
}
