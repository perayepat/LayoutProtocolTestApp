//
//  ContentView.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HeroPage()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model.previewData)
    }
}
