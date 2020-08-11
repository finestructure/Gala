import SwiftUI


public func NightAndDay<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach(ColorScheme.allCases, id: \.self) { scheme in
        // Credit https://twitter.com/heckj/status/1239968146682863618
        items()
          .background(scheme == .dark ? Color.black : .white)
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


@available(OSX, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public func HorizontalSizeClasses<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    #if swift(<5.3)
    return ForEach([UserInterfaceSizeClass.compact, .regular], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item!)" } ?? "\(item!)")
            .environment(\.horizontalSizeClass, item)
    }
    #else
    return ForEach([UserInterfaceSizeClass.compact, .regular], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item)" } ?? "\(item)")
            .environment(\.horizontalSizeClass, item)
    }
    #endif
}


@available(OSX, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public func VerticalSizeClasses<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    #if swift(<5.3)
    return ForEach([UserInterfaceSizeClass.compact, .regular], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item!)" } ?? "\(item!)")
            .environment(\.verticalSizeClass, item)
    }
    #else
    return ForEach([UserInterfaceSizeClass.compact, .regular], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item)" } ?? "\(item)")
            .environment(\.verticalSizeClass, item)
    }
    #endif
}


public func LayoutDirections<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach(LayoutDirection.allCases, id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item)" } ?? "\(item)")
            .environment(\.layoutDirection, item)
    }
}


public func LegibilityWeights<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    #if swift(<5.3)
    return ForEach([LegibilityWeight.regular, .bold], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item!)" } ?? "\(item!)")
            .environment(\.legibilityWeight, item)
    }
    #else
    return ForEach([LegibilityWeight.regular, .bold], id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item)" } ?? "\(item)")
            .environment(\.legibilityWeight, item)
    }
    #endif
}

public func ContentSizeCategories<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach(ContentSizeCategory.allCases, id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item)" } ?? "\(item)")
            .environment(\.sizeCategory, item)
    }
}

public func Devices<A: View>(_ devices: [Device], _ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach(devices, id: \.self) { item in
        items()
            .previewDisplayName(name.map { "\($0) \(item)" } ?? "\(item)")
            .previewDevice(item.previewDevice)
    }
}
