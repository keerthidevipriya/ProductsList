//
//  ContentView.swift
//  ProductstList
//
//  Created by Keerthi Devipriya(kdp) on 29/07/23.
//

import SwiftUI

struct ProductListView: View {
    let albums = ApiIntegration().loadJson()
    var body: some View {
        NavigationView {
            List(0..<albums.count) { item in
                Section {
                    Image("img1")
                        .resizable()
                        .scaledToFit()
                        .imageScale(.large)
                        .frame(height: 90)
                        .cornerRadius(4)
                        .foregroundColor(.accentColor)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(albums[item].title ?? "Default Title")
                            .lineLimit(2)
                            //.fontWeight(.semibold)
                            .minimumScaleFactor(0.5)
                        Text("title can b updated")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                    }
                    //.padding()
                } header: {
                    Text("Sections")
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
