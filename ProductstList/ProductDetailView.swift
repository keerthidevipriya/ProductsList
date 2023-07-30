//
//  ProductDetailView.swift
//  ProductstList
//
//  Created by Keerthi Devipriya(kdp) on 30/07/23.
//

import SwiftUI

struct ProductDetailView: View {
    @Binding var isShowing: Bool
    @State private var isAlert = false
    @State private var updatedTitle = String()
    @Environment(\.presentationMode) var presentationMode
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
                if !updatedTitle.isEmpty {
                    self.isAlert = true
                    updateTitle(updatedTitle)
                } else {
                    print("updated title is not choosen---")
                }
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
                Alert(title: Text("Wohoo!!!"),
                      message: Text("Title updated successfully"),
                      primaryButton: .default(Text("Ok"), action: {
                    //updateTitle("new")
                }), secondaryButton: .cancel())
        }
        }
            
    }
    
    func updateTitle(_ title: String) {
        isShowing = false
        print("\(title)----")
        //updateAlbum(album.id, title: "new")
        presentationMode.wrappedValue.dismiss()
    }
}

/*struct ProductDetailView_Previews: PreviewProvider {
    @State var isShowing: Bool = projectedValue
    static var previews: some View {
        ProductDetailView(isShowing: projectedValue, album: ApiIntegration().loadJson().first!)
    }
}*/

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
