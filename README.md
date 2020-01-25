# 🎭 Gala

Gala is a Swift Package Manager project for macOS, iOS, tvOS, and watchOS to help you create SwiftUI preview variants.

Say for instance you want to render your preview in both light and dark mode, you can use `LightAndDay`:

```
   static var previews: some View {
       NightAndDay {
           ContentView()
       }
   }
```

Without Gala, this would have to be written as

```
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)

            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
```

or

```
    static var previews: some View {
        ForEach([ColorScheme.light, .dark], id: \.self) { scheme in
            ContentView()
        }
    }
```

However, Gala doesn't stop there. It also offers a few other "attribute iterators":

- `HorizontalSizeClasses`
- `LayoutDirections`
- `LegibilityWeights`
- `VerticalSizeClasses`

In addition, you can iterate over a given set of layouts as follows:

```
    static var previews: some View {
        Layouts([.fixed(width: 200, height: 150), .sizeThatFits, .device]) {
                ContentView()
        }
    }
```

All iterators take an optional `name` parameter which will add a `previewDisplayName` with the `name` and a description of the attribute to the preview.

## Contributing

Please fork and submit pull requests if you find any issues or come up with improvements or extensions.

You can reach me at via [Twitter](https://twitter.com/_sa_s) or [email](mailto:sas+blog@finestructure.co).
