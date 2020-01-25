import SwiftUI


public func NightAndDay<A: View>(_ name: String? = nil, @ViewBuilder items: @escaping () -> A) -> some View {
    ForEach([ColorScheme.light, .dark], id: \.self) { scheme in
        items()
            .previewDisplayName(name.map { "\($0) \(scheme)" } ?? "\(scheme)")
            .environment(\.colorScheme, scheme)
    }
}
