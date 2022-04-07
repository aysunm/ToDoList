//
//  CheckBoxView.swift
//  ToDo
//
//  Created by admin on 22.03.2022.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        ZStack {
            Button {
                isChecked.toggle()
            } label: {
                LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                    .mask(Image(systemName: isChecked ? "checkmark.square" : "square")
                          //                        .resizable()
                            .padding()
                            .aspectRatio(contentMode: .fit))
                    .labelStyle(.iconOnly)
            }
        }
        .frame(width: 30, height: 30)
    }
    
}

struct CheckBoxView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CheckBoxView(isChecked: .constant(true))
    }
}
