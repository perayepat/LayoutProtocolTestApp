//
//  LayoutProtocolExplorationsApp.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//

import SwiftUI

@main
struct LayoutProtocolExplorationsApp: App {
    // Initialize a data model with zero votes for everyone.
    @StateObject private var model: Model = Model.startData
    var body: some Scene {
        WindowGroup {
            HeroPage()
                .environmentObject(model)
        }
    }
}
