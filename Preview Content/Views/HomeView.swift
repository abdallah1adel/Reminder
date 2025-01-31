//
//  ContentView.swift
//  Reminder
//
//  Created by pcpos on 13/01/2025.
//
import SwiftUI

struct HomeView: View {
    @FetchRequest(sortDescriptors: [])
    private var myListResults: FetchedResults<MyList>
    
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                MyListView(myLists: myListResults)  // Directly use the fetched results here
                
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Add list")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.headline)
                }
            }


            .sheet(isPresented: $isPresented) {
                AddNewListView { name, color in
                    do {
                        // Convert SwiftUI Color to UIColor before passing to the service
                        let uiColor = UIColor(color)
                        try ReminderService.saveMyList(name, uiColor)
                    } catch {
                        print("Failed to save: \(error)")
                    }
                }
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .padding()

    }
}

#Preview {
    HomeView()
}
