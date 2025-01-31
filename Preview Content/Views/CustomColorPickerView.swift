//
//  ColorPickerView.swift
//  Reminder
//
//  Created by pcpos on 13/01/2025.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColor : Color
    let colors : [Color] = [.red, .green, .blue, .yellow, .orange, .purple]
    var body: some View {
        
        
        HStack{
            ForEach(colors, id: \.self){ color in
                ZStack{
                    Circle()
                        .fill()
                        .foregroundColor(color)
                        .padding(2)
                    Circle()
                        .strokeBorder(selectedColor == color ? .gray : .clear, lineWidth: 3)
                        .scaleEffect(CGSize(width: 1.2, height: 1.2))
                }
                .onTapGesture {
                    selectedColor = color
                    
                }
                
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 100)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    ColorPickerView(selectedColor: .constant(.yellow))
}
