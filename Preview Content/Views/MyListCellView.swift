//
//  MyListCellView.swift
//  Reminder
//
//  Created by pcpos on 16/01/2025.
//

import SwiftUI

struct MyListCellView: View {
    let myList: MyList

    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3.circle.fill")
                .foregroundColor(Color(myList.color))
                .onTapGesture {
                }
            Text(myList.name)
                .font(.body)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .opacity(0.5)
        }
        .padding(.horizontal)
    }
}

// Preview provider
struct MyListCellView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock Core Data context
        let mockContext = CoreDataProvider.shared.persistentContainer.viewContext

        // Create mock data for MyList
        let mockList = MyList(context: mockContext)
        mockList.name = "Groceries"
        mockList.color = UIColor.green

        // Return the view with the mock data for preview
        return MyListCellView(myList: mockList)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

