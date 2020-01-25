import SwiftUI


public func NightAndDay<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach([ColorScheme.light, .dark], id: \.self) { scheme in
        items()
            .previewDisplayName(name.map { "\($0) \(scheme)" } ?? "\(scheme)")
            .environment(\.colorScheme, scheme)
    }
}


public func Layouts<A: View>(_ layouts: [Layout], _ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach(layouts, id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item)" } ?? "\(item)")
            .previewLayout(item.previewLayout)
    }
}


public func HorizontalSizeClasses<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach([UserInterfaceSizeClass.compact, .regular], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item!)" } ?? "\(item!)")
            .environment(\.horizontalSizeClass, item)
    }
}


public func VerticalSizeClasses<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach([UserInterfaceSizeClass.compact, .regular], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item!)" } ?? "\(item!)")
            .environment(\.verticalSizeClass, item)
    }
}


public func LayoutDirections<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach([LayoutDirection.leftToRight, .rightToLeft], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item)" } ?? "\(item)")
            .environment(\.layoutDirection, item)
    }
}


public func LegibilityWeights<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach([LegibilityWeight.regular, .bold], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item!)" } ?? "\(item!)")
            .environment(\.legibilityWeight, item)
    }
}
