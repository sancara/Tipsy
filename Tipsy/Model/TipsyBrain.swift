//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Santiago Caraballo on 31/01/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct TipsyBrain {
    
    func calculateTotalPerPerson(total: Float, tip: Float, numPerson: Float) -> Float {
        let totalBill = (total / numPerson) + (total * tip)
        return totalBill
    }
}
