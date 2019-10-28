//
//  ContentView.swift
//  babyfruit WatchKit Extension
//
//  Created by Felipe Bernardes on 25/10/19.
//  Copyright © 2019 Felipe Bernardes. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation

struct ContentView: View {
    @State private var isFormView = true
    
    @State private var day: String = "14"
    @State private var month: String = "02"
    @State private var year: String = "2020"
    
    @State private var weeks_pregnant: Int = 15
    
    func calculateWeeksPregnant() {
        let formatter = DateFormatter();
        
        formatter.dateFormat = "yyyy/MM/dd HH:mm";
        
        let due_date = formatter.date(from: "\(self.year)/\(self.month)/\(self.day) 00:00");
        
        
        let now = Date();
        
        var diffInWeeks = Calendar.current.dateComponents([.weekOfYear], from: now, to: due_date ?? Date()).weekOfYear;
        
        if (diffInWeeks == 0) {
            diffInWeeks = 14
        }
        
        self.weeks_pregnant = diffInWeeks!
    }
    
    var body: some View {
    
        VStack {
            if self.isFormView {
                Text("BabyFruit").bold().italic()
                Text("Enter your due date and find out how big is your child already!").multilineTextAlignment(.center).lineLimit(4).fixedSize(horizontal: false, vertical: true)
                
                HStack {
                    TextField("Day", text: $day).fixedSize()
                    TextField("Month", text: $month).fixedSize()
                    TextField("Year", text: $year).fixedSize()
                }
                
                Button("Calculate") {
                    self.calculateWeeksPregnant()
                    self.isFormView = false
                }.foregroundColor(.blue).accentColor(.blue)
            } else {
                Text("BabyFruit").bold().italic()
                Image("fruit_week\(weeks_pregnant)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("You are \(weeks_pregnant) weeks pregnant, and your child is currently as big as this fruit!").foregroundColor(.white).bold().italic().lineLimit(4).multilineTextAlignment(.center)
                //Button("Back") {
                   // self.isFormView = true
                //}.foregroundColor(.blue).accentColor(.blue)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
