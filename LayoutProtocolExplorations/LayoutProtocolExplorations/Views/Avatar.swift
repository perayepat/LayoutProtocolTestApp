//
//  Avatar.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//

import SwiftUI

struct Avatar: View {
    var food: Food
    
    var body: some View {
        VStack {
            Image(food.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
//            Text(food.type.prefix(1).capitalized) // Use the first letter.
//                .font(.system(size: 64))
        }
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 20) {
            ForEach(Model.previewData.foods) { food in
                Avatar(food: food)
            }
        }
    }
}
