//
//  ProductDetailView.swift
//  ProductstList
//
//  Created by Keerthi Devipriya(kdp) on 30/07/23.
//

import SwiftUI

struct ProductDetailView: View {
    @State private var isAlert = false
    @State private var updatedTitle = String()
    var album: Album
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("img1")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .cornerRadius(16)
            
            Text(album.title ?? String())
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 40) {
                VStack(alignment: .leading) {
                    Text("Update Title")
                        .font(.caption)
                        .foregroundColor(.accentColor)
                    TextField("Update your title", text: $updatedTitle)
                }
                
                
                /*Label("Update your title", systemImage: "square.and.pencil")
                    .font(.subheadline)
                    .foregroundColor(.secondary)*/
                    //.font(.system(size: 16.0, weight: .bold))
            }.padding()
            
           Spacer()
            
            /*Link(destination: URL(string: album.thumbnailUrl)!, label: {
                StdBtn(title: "Save")
            })*/
            
            Button(action: {
                self.isAlert = true
            }) {
                Text("Update Title")
                .foregroundColor(Color.white)
            }
            .bold()
            .font(.subheadline)
            .frame(width: 220,height: 30)
            .background(Color(.red))
            .foregroundColor(.white)
            .cornerRadius(4)
            .alert(isPresented: $isAlert) { () -> Alert in
                Alert(title: Text("Update Title"),
                      message: Text("Provide your updated title here"),
                      primaryButton: .default(Text("Ok"), action: {
                    updateTitle("new")
                }), secondaryButton: .cancel())
        }
        }
            
    }
    
    func updateTitle(_ title: String) {
        print("\(title)----")
        //updateAlbum(album.id, title: "new")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(album: ApiIntegration().loadJson().first!)
    }
}

struct StdBtn: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .font(.subheadline)
            .frame(width: 220,height: 30)
            .background(Color(.red))
            .foregroundColor(.white)
            .cornerRadius(4)
    }
}
