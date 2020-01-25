//
//  Layout.swift
//  
//
//  Created by Sven A. Schmidt on 25/01/2020.
//

import SwiftUI


// Needs to wrap PreviewLayout because it is not Hashable
public struct Layout: Hashable, CustomStringConvertible {
    let id = UUID()
    let kind: Kind

    enum Kind: Equatable, Hashable {
        case fixed(width: CGFloat, height: CGFloat)
        case device
        case sizeThatFits
    }

    static func fixed(width: CGFloat, height: CGFloat) -> Layout {
        Layout(kind: .fixed(width: width, height: height))
    }
    static var device: Layout { Layout(kind: .device) }
    static var sizeThatFits: Layout { Layout(kind: .sizeThatFits) }

    public var description: String {
        switch kind {
            case let .fixed(width: w, height: h): return "\(w)x\(h)"
            case .device: return "device"
            case .sizeThatFits: return "sizeThatFits"
        }
    }

    var previewLayout: PreviewLayout {
        switch kind {
            case let .fixed(width: w, height: h): return .fixed(width: w, height: h)
            case .device: return .device
            case .sizeThatFits: return .sizeThatFits
        }
    }
}


