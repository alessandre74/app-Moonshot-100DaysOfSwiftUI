//
//  DivisorView.swift
//  Moonshot
//
//  Created by Alessandre Livramento on 07/11/22.
//

import SwiftUI

struct DivisorView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct DivisorView_Previews: PreviewProvider {
    static var previews: some View {
        DivisorView()
    }
}
