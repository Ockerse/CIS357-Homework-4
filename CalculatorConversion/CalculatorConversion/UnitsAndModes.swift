//
//  UnitsAndModes.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/18/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import Foundation

enum CalculatorMode : String {
    case Length
    case Volume
}
enum LengthUnit : String, CaseIterable {
    case Meters = "Meters"
    case Yards = "Yards"
    case Miles = "Miles"
}

enum VolumeUnit : String, CaseIterable {
    case Liters = "Liters"
    case Gallons = "Gallons"
    case Quarts = "Quarts"
}

struct LengthConversionKey : Hashable {
    var toUnits : LengthUnit
    var fromUnits : LengthUnit
}

struct VolumeConversionKey : Hashable {
    var toUnits : VolumeUnit
    var fromUnits : VolumeUnit
}

let lengthConversionTable : Dictionary<LengthConversionKey, Double> = [
    LengthConversionKey(toUnits: .Meters, fromUnits: .Meters) : 1.0,
    LengthConversionKey(toUnits: .Meters, fromUnits: .Yards) : 0.9144,
    LengthConversionKey(toUnits: .Meters, fromUnits: .Miles) : 1609.34,
    LengthConversionKey(toUnits: .Yards, fromUnits: .Meters) : 1.09361,
    LengthConversionKey(toUnits: .Yards, fromUnits: .Yards) : 1.0,
    LengthConversionKey(toUnits: .Yards, fromUnits: .Miles) : 1760.0,
    LengthConversionKey(toUnits: .Miles, fromUnits: .Meters) : 0.000621371,
    LengthConversionKey(toUnits: .Miles, fromUnits: .Yards) : 0.000568182,
    LengthConversionKey(toUnits: .Miles, fromUnits: .Miles) : 1.0
]

let volumeConversionTable : Dictionary<VolumeConversionKey, Double> = [
    VolumeConversionKey(toUnits: .Liters, fromUnits: .Liters) : 1.0,
    VolumeConversionKey(toUnits: .Liters, fromUnits: .Gallons) : 3.78541,
    VolumeConversionKey(toUnits: .Liters, fromUnits: .Quarts) : 0.946353,
    VolumeConversionKey(toUnits: .Gallons, fromUnits: .Liters) : 0.264172,
    VolumeConversionKey(toUnits: .Gallons, fromUnits: .Gallons) : 1.0,
    VolumeConversionKey(toUnits: .Gallons, fromUnits: .Quarts) : 0.25,
    VolumeConversionKey(toUnits: .Quarts, fromUnits: .Liters) : 1.05669,
    VolumeConversionKey(toUnits: .Quarts, fromUnits: .Gallons) : 4.0,
    VolumeConversionKey(toUnits: .Quarts, fromUnits: .Quarts) : 1.0
]
