//
//  Device.swift
//  
//
//  Created by Sven A. Schmidt on 26/01/2020.
//

import SwiftUI


public enum Device: String, CaseIterable, CustomStringConvertible {
    case iPadMini4 = "iPad mini 4"
    case iPadAir2 = "iPad Air 2"
    case iPadPro9·7inch = "iPad Pro (9.7-inch)"
    case iPadPro12·9inch = "iPad Pro (12.9-inch)"
    case iPad5thGen = "iPad (5th generation)"
    case iPadPro12·9inch2ndGen = "iPad Pro (12.9-inch) (2nd generation)"
    case iPadPro10·5inch = "iPad Pro (10.5-inch)"
    case iPad6thGen = "iPad (6th generation)"
    case iPad7thGen = "iPad (7th generation)"
    case iPadPro11inch = "iPad Pro (11-inch)"
    case iPadPro12·9inch3rdGen = "iPad Pro (12.9-inch) (3nd generation)"
    // 2020-01-26 sas: this one failed to launch the preview for me:
    //     case iPadMini5thGen = "iPad mini (5th generation)"
    case iPadAir3rdGen = "iPad Air (3rd generation)"

    case iPhone6s = "iPhone 6s"
    case iPhone6sPlus = "iPhone 6s Plus"
    case iPhoneSE = "iPhone SE"
    case iPhone7 = "iPhone 7"
    case iPhone7Plus = "iPhone 7 Plus"
    case iPhone8 = "iPhone 8"
    case iPhone8Plus = "iPhone 8 Plus"
    case iPhoneX = "iPhone X"
    case iPhoneXs = "iPhone Xs"
    case iPhoneXsMax = "iPhone Xs Max"
    case iPhoneXʀ = "iPhone Xʀ"
    case iPhone11 = "iPhone 11"
    case iPhone11Pro = "iPhone 11 Pro"
    case iPhone11ProMax = "iPhone Pro Max"

    case appleWatchSeries2﹘38mm = "Apple Watch Series 2 - 38mm"
    case appleWatchSeries2﹘42mm = "Apple Watch Series 2 - 42mm"
    case appleWatchSeries3﹘38mm = "Apple Watch Series 3 - 38mm"
    case appleWatchSeries3﹘42mm = "Apple Watch Series 3 - 42mm"
    case appleWatchSeries4﹘40mm = "Apple Watch Series 4 - 40mm"
    case appleWatchSeries4﹘44mm = "Apple Watch Series 4 - 44mm"
    case appleWatchSeries5﹘40mm = "Apple Watch Series 5 - 40mm"
    case appleWatchSeries5﹘44mm = "Apple Watch Series 5 - 44mm"

    case appleTV4K = "Apple TV 4K"

    public var previewDevice: PreviewDevice { PreviewDevice(stringLiteral: rawValue) }
    public static var iPads: [Device] { allCases.filter { $0.rawValue.hasPrefix("iPad") } }
    public static var iPhones: [Device] { allCases.filter { $0.rawValue.hasPrefix("iPhone") } }
    public static var watches: [Device] { allCases.filter { $0.rawValue.hasPrefix("Apple Watch") } }
    public static var tvs: [Device] { allCases.filter { $0.rawValue.hasPrefix("Apple TV") } }

    public var description: String {
        let trim = "Apple Watch "
        if rawValue.hasPrefix(trim) {
            return String(rawValue.dropFirst(trim.count))
        }
        return rawValue
    }
}


extension Array where Element == Device {
    public static var iPads: [Element] { Device.iPads }
    public static var iPhones: [Element] { Device.iPhones }
    public static var watches: [Element] { Device.watches }
    public static var tvs: [Element] { Device.tvs }
}
