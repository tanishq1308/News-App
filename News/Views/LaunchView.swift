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
    @State var category = ""
    @State var tabIndex = 0
    @State var theme = false
    @State var lock = false
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                
                VStack {
                    
                    Text("Your country at a glance!!")
                        .font(Font.custom("Avenir Heavy", size: 30))
                    
                    VStack(spacing: 20) {
                    
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
                        
                        HStack {
                            
                            Text("Select a Category : ")
                                .font(.title2)
                            
                            Picker("", selection: $category) {
                                
                                ForEach(0..<Constants.category.count) { index in
                                    
                                    Text(Constants.category[index]).tag(Constants.category_code[index])
                                    
                                }
                                
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 160)
                            
                        }
                        
                    }
                    
                    Spacer()
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(height: 52)
                            .shadow(radius: 5)
                            .padding(.horizontal, 40)
                        
                        Button("View Latest News") {
                            model.getNews(country: country, category: category)
                            showContent = true
                        }
                        .font(Font.custom("Avenir Heavy", size: 24))
                        
                    }
                    
                    NavigationLink(destination: ContentView(), isActive: $showContent) { EmptyView() }
                    
                    Spacer()
                    
                }
            }
            .tabItem {
                VStack {
                    Image(systemName: "newspaper")
                    Text("News")
                }
            }
            .tag(0)
            
            VStack {
                
                Text("App Settings")
                    .bold()
                    .font(.title)
                
                HStack {
                    
                    Toggle(isOn: $theme) {
                        Text("Dark Mode")
                            .font(.title2)
                    }
                    
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.all, 40)
            .tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
            .tag(1)
        }
        .preferredColorScheme(theme ? .dark : .light)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
