//
//  SwiftUIView.swift
//  SlotMachine-SwiftUI
//
//  Created by Gokul Murugan on 2023-04-18.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Hexagon()
        .foregroundColor(.pink)
        .frame(width: 100,height: 120,alignment: .center)
    }
}
