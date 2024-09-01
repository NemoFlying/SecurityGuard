//
//  FeedbackView.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/25.
//

import SwiftUI

struct FeedbackView: View {
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    var body: some View {
            VStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                } else {
                    Text("No Image Selected")
                        .frame(width: 300, height: 300)
                        .background(Color.gray)
                }
                
                Button(action: {
                    isImagePickerPresented = true
                }) {
                    Text("Take Photo")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }
        }
}

#Preview {
    FeedbackView()
}
