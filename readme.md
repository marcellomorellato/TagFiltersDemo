# Tag Filter View Demo

This project demonstrates a simple implementation of a tag filter view using SwiftUI and UIKit interoperability.

## Overview

The Tag Filter View allows users to select or deselect tags from a list of available tags. It consists of a horizontal scrollable list of buttons representing tags. When a tag is selected, it is highlighted with a blue background and white text. When deselected, the tag has a white background with blue text.

The project includes:

- `TagFilterView`: A SwiftUI view that displays the tag filter interface.
- `TagFilterViewModel`: An ObservableObject that manages the state and logic of the tag filter.
- `Tag`: A struct representing a tag with an identifier, name, and optional 'All' flag.
- `ViewController`: A UIKit view controller that hosts the `TagFilterView` using `UIHostingController`.
- `README.md`: This documentation file.

## Requirements

- Xcode 12.0 or later
- Swift 5.3 or later
- iOS 14.0 or later

## Usage

To use the `TagFilterView` in your own project:

1. Copy the `TagFilterView.swift`, `TagFilterViewModel.swift`, and `Tag.swift` files into your Xcode project.
2. If your project uses UIKit, you can integrate the `TagFilterView` by creating a `UIHostingController` in your view controller, similar to the implementation in `ViewController.swift`.
3. Ensure you have set up the constraints properly to position the `TagFilterView` within your view hierarchy.

