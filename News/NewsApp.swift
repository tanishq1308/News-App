//
//  NewsApp.swift
//  News
//
//  Created by Tanishq Kakkar on 25/01/22.
//

import SwiftUI

@main
struct NewsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
