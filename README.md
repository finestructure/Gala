# 🎭 Gala

Gala is a Swift Package Manager project for macOS, iOS, tvOS, and watchOS to help you create SwiftUI preview variants.

Say for instance you want to render your preview in both light and dark mode, you can use `NightAndDay`:

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
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            ContentView()
        }
    }
```

However, Gala doesn't stop there. It also offers a few other "attribute iterators":

- `ContentSizeCategories`
- `HorizontalSizeClasses`
- `LayoutDirections`
- `LegibilityWeights`
- `VerticalSizeClasses`

Just substitute them in for `NightAndDay`:

```
   static var previews: some View {
       LayoutDirections {
           ContentView()
       }
   }
```

## Layouts

In addition, you can iterate over a given set of layouts as follows:

```
    static var previews: some View {
        Layouts([.fixed(width: 200, height: 150), .sizeThatFits, .device]) {
                ContentView()
        }
    }
```

This is convenient if you have a set of frames you want to set your view up with.

## Devices

You can also pass in a set of devices to the `Device` iterator:

```
    static var previews: some View {
        Devices([.iPhoneX, .iPhone11]) {
                ContentView()
        }
    }
```

Thanks to autocompletion you don't have to remember the precise names. Please note that particular care has been taken to transform Apple's fantastic product names into identifiers. For instance:

- `iPadPro9·7inch`
- `iPhoneXʀ`
- `appleWatchSeries5﹘40mm`

Thanks to Swift's support of unicode identifiers you can use these (and thanks to autocomplete you can actually enter them 😅).

You can also use `Devices.iPhones` (`iPads`, `watches`, `tvs`) to preview all of them:

```
    static var previews: some View {
        Devices(.iPhones) {
                ContentView()
        }
    }
```

Please note that these can take a while to render though, so it's not something that's advisable for a screen you use a lot. But it's a great use for a separate file where you set up marketing shots and want them for the full set of devices.

## Name parameter

All iterators take an optional `name` parameter which will add a `previewDisplayName` with the `name` and a description of the attribute to the preview.

## Contributing

Please fork and submit pull requests if you find any issues or come up with improvements or extensions.

You can reach me at via [Twitter](https://twitter.com/_sa_s) or [email](mailto:sas+blog@finestructure.co).
