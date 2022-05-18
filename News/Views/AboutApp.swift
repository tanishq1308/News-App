//
//  AboutApp.swift
//  News
//
//  Created by Tanishq Kakkar on 07/04/22.
//

import SwiftUI

struct AboutApp: View {
    var body: some View {
        
        VStack(spacing: 5) {
            Spacer()
            Text("API used in this app is provided by India Today.")
                .font(Font.custom("Avenir Heavy", size: 16))
            Text("All rights reserved to India Today.")
                .font(Font.custom("Avenir Heavy", size: 18))
            Text("Version 1.0.0")
                .font(Font.custom("Avenir Heavy", size: 22))
            Spacer()
        }
        .navigationTitle("ABOUT")
        .padding()
    }
}

struct AboutApp_Previews: PreviewProvider {
    static var previews: some View {
        AboutApp()
    }
}
