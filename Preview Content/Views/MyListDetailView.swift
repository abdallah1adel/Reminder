//
//  MyListDetailView.swift
//  Reminder
//
//  Created by pcpos on 31/01/2025.
//

import SwiftUI

struct MyListDetailView: View {
    @State private var openAddReminder : Bool = false
    @State private var title : String = ""
    
    private var isFormValid : Bool {
        !title.isEmpty
    }
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "plus.circle.fill")
                Button {
                    openAddReminder = true
                } label: {
                        Text("New Reminder")
                }

            }
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            .alert("New Reminder", isPresented: $openAddReminder) {
                TextField("", text: $title)
                Button("Cancel", role: .cancel) {
                    
                }
                Button("Done") {
                    if isFormValid {
                        do {
                            try ReminderService.saveReminderToMyList(myList: myList, reminderTitle: title)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    MyListDetailView()
}
