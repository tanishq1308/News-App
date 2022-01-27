//
//  LaunchView.swift
//  News
//
//  Created by Tanishq Kakkar on 26/01/22.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var showContent = false
    @State var country = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 100) {
                
                Text("Your country at a glance!!")
                    .font(Font.custom("Avenir Heavy", size: 30))
                
                HStack {
                    
                    Text("Select a Country : ")
                        .font(.title2)
                    
                    Picker("", selection: $country) {
                        
                        ForEach(0..<Constants.country.count) { index in
                            
                            Text(Constants.country[index]).tag(Constants.country_code[index])
                            
                        }
                        
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 170)
                    
                }
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(height: 52)
                        .shadow(radius: 5)
                        .padding(.horizontal, 40)
                    
                    Button("View Latest News") {
                        model.getNews(country: country)
                        showContent = true
                    }
                    .font(Font.custom("Avenir Heavy", size: 24))
                    
                }
                
                NavigationLink(destination: ContentView(), isActive: $showContent) { EmptyView() }
                
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
