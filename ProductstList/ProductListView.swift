//
//  ContentView.swift
//  ProductstList
//
//  Created by Keerthi Devipriya(kdp) on 29/07/23.
//

import SwiftUI

struct ProductListView: View {
    var albums = ApiIntegration().loadJson(filename: "")
    var body: some View {
        NavigationView {
            List(0..<20) { item in
                Image("img1")
                    .resizable()
                    .scaledToFit()
                    .imageScale(.large)
                    .frame(height: 90)
                    .cornerRadius(4)
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Hi this is keerthi devipriya sharing my views")
                        .lineLimit(2)
                        //.fontWeight(.semibold)
                        .minimumScaleFactor(0.5)
                    Text("21 oct 2021")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                }
                //.padding()
            }
            .navigationTitle("List")
            //.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
