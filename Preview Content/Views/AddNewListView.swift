//
//  AddNewListView.swift
//  Reminder
//
//  Created by pcpos on 13/01/2025.
//
import SwiftUI

struct AddNewListView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var selectedColor: Color = .green

    let onSave: (String, Color) -> Void
    
    private var isFormRight: Bool {
        !name.isEmpty
    }

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .foregroundColor(selectedColor)
                        .font(.system(size: 100))

                    TextField("List Name", text: $name)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
//                        .textFieldStyle(PlainTextFieldStyle())
                        .background(.ultraThickMaterial)

                }
                .padding(30)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

                HStack(spacing: 20) {
                    ColorPickerView(selectedColor: $selectedColor)
                    CustomColorPickerView(selectedColor: $selectedColor)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.ultraThinMaterial)


            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("New List")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        onSave(name, selectedColor)
                        dismiss()
                    } label: {
                        Text("Done")
                    }.disabled(!isFormRight)
                }
            }
        }

    }
}

// Custom color picker with improved visuals:
struct CustomColorPickerView: View {
    @Binding var selectedColor: Color

    var body: some View {
        ZStack {
            Circle()
                .fill(selectedColor)
                .frame(width: 40, height: 40)
                .overlay(
                    Circle()
                        .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .shadow(radius: 2)

            Image(systemName: "eyedropper")
                .font(.title2)
                .foregroundColor(.white)
        }
        .overlay(
            ColorPicker("", selection: $selectedColor)
                .labelsHidden()
                .frame(width: 40, height: 40)
                .opacity(0.1) // Invisible but tappable
        )
    }
}

#Preview {
    AddNewListView(onSave: { _,_ in })
}
