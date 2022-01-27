//
//  ContentView.swift
//  News
//
//  Created by Tanishq Kakkar on 25/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
            
            if model.news.count >= 1 {
                TabView(selection: $tabSelectionIndex) {
                    
                    ForEach(0..<model.news.count) { index in
                        
                        Button(action: {
                            self.isDetailViewShowing = true
                        }, label: {
                            NewsHeadline(news: model.news[index])
                        })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                NewsDetail(news: model.news[index])
                            }
                            .accentColor(.black)
                    }
                    .navigationTitle("\(Constants.country[Constants.country_code.firstIndex(of: model.country)!]) Today")
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            }
        else {
            ProgressView()
        }
    }
}


