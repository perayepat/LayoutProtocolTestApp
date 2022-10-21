//
//  SwiftUIView.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack(spacing: 100){
            
            Button {} label: {
                VStack(spacing: 5){
                    Image(systemName: "house.fill")
                    Text("Home")
                        .font(.caption2)
                }
            }
            .accentColor(.primary)
            Button {} label: {
                VStack(spacing: 5){
                    Image(systemName: "circle.grid.cross.fill")
                    Text("explore")
                        .font(.caption2)
                }
            }
            .accentColor(.primary)
            Button {} label: {
                VStack(spacing: 5){
                    Image(systemName: "person.fill")
                    Text("profile")
                        .font(.caption2)
                }
            }
            .accentColor(.primary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.regularMaterial)
                .frame(height: 60)
                .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 2)
                .shadow(color: .white.opacity(0.5), radius: 0.2, x: -1, y: -1)
        )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
