//
//  View+Extensions.swift
//  CoreDataBudget
//
//  Created by Hanh Vo on 2/20/23.
//

import Foundation
import SwiftUI

extension View {
    func centerHorizontally() -> some View {
        HStack{
            Spacer()
            self
            Spacer()
        }
        
    }
}
