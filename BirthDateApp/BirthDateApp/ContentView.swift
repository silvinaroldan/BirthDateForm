//
//  ContentView.swift
//  BirthDateForm
//
//  Created by Silvina Roldan on 24/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var dataArray: [String] = []
    @State var selectedDate: Date = Date()

    var body: some View {
        VStack {
            Text("Add Birth Date and Time")
                .font(.largeTitle)
                .padding(.bottom, 40)
            Text("Name:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.bottom, -10)
            TextField("Name", text: $name)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                        .background()
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .black.opacity(0.8), radius: 2, x: 0, y: -2)
                        .mask(RoundedRectangle(cornerRadius: 20))
                )
               .padding()
            
            DatePicker("Select a Date", selection: $selectedDate)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                

            Button {
                saveText()
            } label: {
                Text("Save")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)

            ForEach(dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .padding()
    }

    func saveText() {
        dataArray.append(name)
        name = ""
    }
}

extension Color {
    static let grayDark = Color(red: 0.2, green: 0.2, blue: 0.2)
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
