//
//  buttonStack.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//

import SwiftUI

struct buttonStack: View {
    @EnvironmentObject private var model: Model
    
    var body: some View {
        HStack(spacing: 40){
            ForEach($model.foods) { $food in
                Button {
                    food.votes += 5
                    
                } label: {
                    VStack {
                        Image(food.image)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 70, height: 70)
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 1, y: 1)
                            .offset(y:5)
                        Text(food.type)
                            .font(.caption)
                            .foregroundColor(.primary)
                            .bold()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(
                                .linearGradient(colors: [.clear,.white,.clear,.clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .frame(width: 80)
//                            .offset(y:40)
                    )
                }
                .onAppear {
                    @State var randomInt = Int.random(in: 1..<10)
                    food.votes += randomInt
                }
            }
        }
        
    }
}

struct buttonStack_Previews: PreviewProvider {
    static var previews: some View {
        buttonStack()
            .environmentObject(Model.previewData)
    }
}
