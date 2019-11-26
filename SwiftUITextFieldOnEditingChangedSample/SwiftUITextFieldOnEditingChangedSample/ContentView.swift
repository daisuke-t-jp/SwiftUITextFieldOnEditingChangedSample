//
//  ContentView.swift
//  SwiftUITextFieldOnEditingChangedSample
//
//  Created by Daisuke TONOSAKI on 2019/11/26.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var onEditing: Bool = false
    @State private var inputLHS: Float = 0
    @State private var inputRHS: Float = 0
    @State private var total: Float = 0
    
    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 32)
            
            TextField("$",
                      value: $inputLHS,
                      formatter: currencyFormatter,
                      onEditingChanged: { changed in
                        print("onEditingChanged \(changed)")
                        self.onEditing = changed
            },
                      onCommit: {
                        print("onCommit")
            })
                .padding()
            
            Spacer().frame(height: 32)
            
            TextField("$",
                      value: $inputRHS,
                      formatter: currencyFormatter,
                      onEditingChanged: { changed in
                        print("onEditingChanged \(changed)")
                        self.onEditing = changed
            },
                      onCommit: {
                        print("onCommit")
            })
                .padding()
            
            Spacer().frame(height: 32)
            
            Button(action: {
                self.total = self.inputLHS + self.inputRHS
            }) {
                Text("=")
                    .font(.largeTitle)
            }.disabled(onEditing)
            
            Spacer().frame(height: 32)
            
            Text("\(total)")
            
            Spacer()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
