//
//  RadialIcons.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//

import SwiftUI

struct RadialIcons: View {
    @EnvironmentObject private var model: Model
    
    var body: some View {
        // Use a horizontal layout for a tie; use a radial layout, otherwise.
        let layout = model.isAllWayTie ? AnyLayout(HStackLayout()) : AnyLayout(MyRadialLayout())
        
        layout {
            ForEach(model.foods) { food in
                Avatar(food: food)
                    .rank(model.rank(food))
            }
        }
        .animation(.default, value: model.foods)
    }
    
    struct RadialIcons_Previews: PreviewProvider {
        static var previews: some View {
            RadialIcons()
                .environmentObject(Model.previewData)
        }
    }
}
