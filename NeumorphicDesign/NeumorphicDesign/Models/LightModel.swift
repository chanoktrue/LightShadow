//
//  LightModel.swift
//  NeumorphicDesign
//
//  Created by Thongchai Subsaidee on 6/8/2564 BE.
//

import Foundation

struct LightModel: Hashable {
    let name: String
    let image: String
    
    static let lights = [
        LightModel(name: "Light On", image: "lightbulb"),
        LightModel(name: "Light Off", image: "lightbulb.slash"),
    ]
}
