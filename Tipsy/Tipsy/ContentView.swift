//
//  ContentView.swift
//  Tipsy
//
//  Created by Swapnil Bhattacharya on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = ""
    @State private var tipPercentage = 15
    @State private var showTotal = false
    
    var totalAmount: Double {
        let bill = Double(billAmount) ?? 0
        let tip = bill * Double(tipPercentage) / 100
        return bill + tip
    }
    
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                Text("Tipsy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 20)
                TextField("Enter Bill Amount", text: $billAmount)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .foregroundColor(.green)
                Picker("Tip Percentage", selection: $tipPercentage) {
                    ForEach(0..<101, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .foregroundColor(.green)
                
                HStack {
                    Text("0%")
                        .foregroundColor(.green)
                    Spacer()
                    Text("\(tipPercentage)%")
                        .foregroundColor(.green)
                    Spacer()
                    Text("100%")
                        .foregroundColor(.green)
                }
                .padding(.horizontal)
                
                Button(action: {
                    self.showTotal.toggle()
                }) {
                    Text("Show Total")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                .padding()
                if showTotal {
                    Text("Total: $\(totalAmount, specifier: "%.2f")")
                        .font(.title)
                        .foregroundColor(.green)
                        .padding()
                }
                Spacer()
                
//                Text("Total: $\(totalAmount, specifier: "%.2f")")
//                    .font(.title)
//                    .foregroundColor(.green)
//                    .padding()
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
