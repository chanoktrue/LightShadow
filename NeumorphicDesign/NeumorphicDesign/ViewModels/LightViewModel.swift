//
//  LightViewModel.swift
//  NeumorphicDesign
//
//  Created by Thongchai Subsaidee on 6/8/2564 BE.
//

import SwiftUI

class LightViewModel: ObservableObject {
    
    @Published var lights: [LightModel] = LightModel.lights

    @Published var selected: Bool = true
    
    
}
