//
//  MyListView.swift
//  Reminder
//
//  Created by pcpos on 16/01/2025.
//

import SwiftUI

struct MyListView: View {
    let myLists: FetchedResults<MyList>  // This is directly passed as the fetched data

    var body: some View {
        NavigationStack {
            if myLists.isEmpty {
                Spacer()
                Text("No List Found")
                    .font(.headline)
                    .foregroundColor(.secondary)
            } else {
                ForEach(myLists) { myList in
                    NavigationLink(value: myList) {
                        VStack {
                            MyListCellView(myList: myList)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                                .padding(.leading, 10)
                                .font(.title3)
                            
                            Divider()
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .navigationDestination(for: MyList.self) { myList in
                        MyListDetailView()
                            .navigationTitle(myList.name)
                    }
                }
            }
        }
    }
}

