//
//  ContentView.swift
//  ProductstList
//
//  Created by Keerthi Devipriya(kdp) on 29/07/23.
//

import SwiftUI

struct ProductListView: View {
    @State private var isShowingDetail = false
    @State var albums = ApiIntegration().loadJson()
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        NavigationView {
            List(0..<albums.count) { item in
                NavigationLink(
                    destination: ProductDetailView(
                        isShowing: $isShowingDetail,
                        album: albums[item]
                    ),
                    isActive: $isShowingDetail,
                    label: {
                        ProductCell(album: albums[item])
                    }
                )
            }
            .navigationTitle("List")
            .navigationBarItems(leading: EditButton(), trailing: Button("Update Title", action: {
                updateAlbum(0, title: "updatedTitle")
            }))
        }
    }
    
    func updateAlbum(_ id: Int, title: String) {
        albums[id].title = title
    }
}

struct ProductCell: View {
    var album : Album
    
    var body: some View {
        HStack {
            //Section {
                Image("img1")
                    .resizable()
                    .scaledToFit()
                    .imageScale(.large)
                    .frame(height: 90)
                    .cornerRadius(4)
                    .foregroundColor(.accentColor)
                    .padding(.vertical, 4)
                VStack(alignment: .leading, spacing: 5) {
                    Text(album.title ?? "Default Title")
                        .lineLimit(2)
                        //.fontWeight(.semibold)
                        .minimumScaleFactor(0.5)
                    Text("Title can b updated")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                }
                //.padding()
           /*} header: {
               Text("AlbumId: \(albums[item].albumId)")
           }*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
