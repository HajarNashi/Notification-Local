//
//  ContentView.swift
//  Notifaction
//
//  Created by Hajar Nashi on 13/05/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    let notify = NotificationHandler()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Button("Send a notification in 5 seconds") {
                notify.sendNotification(
                    date: Date(),
                    type: "time",
                    timeInterval: 5,
                    title: "Hey there!",
                    body: "This is a reminder you set 5 seconds ago!")
            }
            
            DatePicker("Pick a date:", selection: $selectedDate, in: Date()...)
            Button("Schedule notification") {
                notify.sendNotification(
                    date: selectedDate,
                    type: "date",
                    title: "What's up?",
                    body: "This is a reminder that you set up with the date picker!")
            }.tint(.orange)
            
            Spacer()
            Text("Not working?")
                .foregroundColor(.gray)
                .italic()
            Button("Request permissins") {
                notify.askPermission()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
