//
//  Test.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//
import SwiftUI

enum Algo: String, CaseIterable, Identifiable {
    case vstack
    case hstack
    case zstack
    
    var layout: any Layout {
        switch self {
            case .vstack: return _VStackLayout()
            case .hstack: return _HStackLayout()
            case .zstack: return _ZStackLayout()
        }
    }
    
    var id: Self { self }
}

struct Test: View {
    @State var algo = Algo.hstack
    var body: some View {
        VStack {
            Picker("Algo", selection: $algo) {
                ForEach(Algo.allCases) { algo in
                    Text("\(algo.rawValue)")
                }
            }.pickerStyle(.segmented)
            let layout = AnyLayout(algo.layout)
            layout {
                ForEach(0..<4) { ix in
                    Text("Mark \(ix)")
                        .padding()
                        .background(Capsule()
                            .fill(Color(hue: .init(ix)/10, saturation: 0.8, brightness: 0.8)))
                }
            }.animation(.default.speed(0.2), value: algo)
            .frame(maxHeight: .infinity)
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
