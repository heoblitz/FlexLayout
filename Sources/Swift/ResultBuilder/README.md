# FlexLayout ResultBuilder

QuickLayout-style declarative syntax for FlexLayout using ResultBuilder.

## Overview

This extension adds ResultBuilder support to FlexLayout with a QuickLayout-inspired API, allowing you to write layouts declaratively using a `flexBody` property.

## Features

- ✅ **QuickLayout-style API**: Declarative `flexBody` property
- ✅ **No .flex prefix**: Use modifiers directly on UIView
- ✅ **Auto View Management**: Automatic addSubview/removeSubview with diff algorithm
- ✅ **Full if/else Support**: Conditional layouts work perfectly
- ✅ **100% Backward Compatible**: Existing code continues to work
- ✅ **Protocol-based**: Simple `HasFlexBody` protocol

## Quick Example

### Traditional FlexLayout:

```swift
class MyView: UIView {
    private let rootFlexContainer = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(rootFlexContainer)

        rootFlexContainer.flex.direction(.column).padding(16).define { flex in
            flex.addItem().direction(.row).define { flex in
                flex.addItem(imageView).width(100)
                flex.addItem(titleLabel).grow(1).marginLeft(12)
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.frame = bounds
        rootFlexContainer.flex.layout()
    }
}
```

### With ResultBuilder (QuickLayout style):

```swift
class MyView: UIView, HasFlexBody {

    var flexBody: FlexContainer {
        VFlex {
            HFlex {
                imageView.width(100)
                titleLabel.grow(1).marginLeft(12)
            }
        }
        .padding(16)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFlexLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutFlexBody()
    }
}
```

## Usage

### 1. Conform to `HasFlexBody`

```swift
class MyView: UIView, HasFlexBody {
    // Your implementation
}
```

### 2. Define `flexBody` property

```swift
var flexBody: FlexContainer {
    VFlex {
        titleLabel
        imageView.width(200).height(200)
        descriptionLabel.marginTop(16)
    }
    .padding(16)
}
```

### 3. Call setup and layout methods

```swift
override init(frame: CGRect) {
    super.init(frame: frame)
    setupFlexLayout()  // ← Call once in init
}

override func layoutSubviews() {
    super.layoutSubviews()
    layoutFlexBody()   // ← Call in layoutSubviews
}
```

## Conditional Layouts

### if/else

```swift
var flexBody: FlexContainer {
    VFlex {
        titleLabel

        if isLoggedIn {
            profileView
        } else {
            loginButton
        }
    }
}
```

### Conditional with Details

```swift
var flexBody: FlexContainer {
    VFlex {
        headerLabel

        if showDetails {
            detailsLabel
                .marginTop(8)
        }

        if items.isEmpty {
            emptyStateView
        } else {
            itemsListView
        }
    }
}
```

### switch/case

```swift
var flexBody: FlexContainer {
    VFlex {
        titleLabel

        switch state {
        case .loading:
            loadingIndicator
        case .error(let message):
            errorLabel
        case .success:
            contentView
        }
    }
}
```

## Advanced Examples

### Nested Containers

```swift
var flexBody: FlexContainer {
    VFlex {
        // Header
        HFlex {
            logoView.width(40).height(40)
            titleLabel.grow(1).marginLeft(12)
        }
        .height(60)
        .padding(16)
        .flexBackgroundColor(.systemGray6)

        // Content
        VFlex {
            contentLabel.grow(1)
        }
        .padding(16)

        // Footer
        HFlex {
            cancelButton.grow(1).height(44)
            confirmButton.grow(1).height(44).marginLeft(12)
        }
        .padding(16)
    }
}
```

### State-based UI

```swift
enum ViewState {
    case empty
    case loading
    case loaded(items: [Item])
    case error(String)
}

var flexBody: FlexContainer {
    VFlex {
        headerLabel

        if case .empty = state {
            emptyStateView
        } else if case .loading = state {
            loadingIndicator
        } else if case .loaded(let items) = state {
            VFlex {
                // Render items
            }
        } else if case .error(let message) = state {
            errorView
        }
    }
}
```

### Updating State

When state changes, just call `setNeedsLayout()`:

```swift
private var isLoggedIn = false {
    didSet {
        setNeedsLayout()  // ← Triggers layoutSubviews → layoutFlexBody
    }
}
```

## Available Modifiers

All FlexLayout modifiers work without `.flex` prefix:

### Size & Constraints
- `width(_:)`, `height(_:)`, `size(_:)`
- `minWidth(_:)`, `maxWidth(_:)`, `minHeight(_:)`, `maxHeight(_:)`
- `grow(_:)`, `shrink(_:)`, `basis(_:)`
- `aspectRatio(_:)`

### Spacing
- `margin(_:)`, `marginTop(_:)`, `marginLeft(_:)`, etc.
- `padding(_:)`, `paddingTop(_:)`, `paddingLeft(_:)`, etc.
- `gap(_:)`, `rowGap(_:)`, `columnGap(_:)`

### Alignment
- `justifyContent(_:)`, `alignItems(_:)`, `alignSelf(_:)`, `alignContent(_:)`

### Direction & Wrap
- `direction(_:)`, `wrap(_:)`, `layoutDirection(_:)`

### Visual (with `flex` prefix to avoid conflicts)
- `flexBackgroundColor(_:)`, `flexCornerRadius(_:)`, `flexBorder(_:_:)`

## How It Works

### 1. Protocol Extension

`HasFlexBody` provides default implementations:
- `setupFlexLayout()` - Sets up the container and initial layout
- `layoutFlexBody()` - Updates the layout when bounds change

### 2. View Hierarchy Management

The system automatically:
- Adds new views to the hierarchy
- Removes views that are no longer in the layout
- Maintains correct view ordering
- Uses efficient diff algorithm (like QuickLayout)

### 3. Layout Update Flow

```
State changes
    ↓
setNeedsLayout()
    ↓
layoutSubviews()
    ↓
layoutFlexBody()
    ↓
Read flexBody property
    ↓
Diff & update view hierarchy
    ↓
Apply flex layout
```

## Examples

See `Examples.swift` for complete working examples:

- **BasicExampleView** - Simple layout with image and labels
- **ConditionalExampleView** - Login/logout states with if/else
- **ComplexExampleView** - Shopping cart with multiple states (empty, loading, loaded, error)

## Best Practices

1. **Always call `setupFlexLayout()` in init**
   ```swift
   override init(frame: CGRect) {
       super.init(frame: frame)
       setupFlexLayout()  // ← Required
   }
   ```

2. **Always call `layoutFlexBody()` in layoutSubviews**
   ```swift
   override func layoutSubviews() {
       super.layoutSubviews()
       layoutFlexBody()  // ← Required
   }
   ```

3. **Trigger layout updates with `setNeedsLayout()`**
   ```swift
   private var state: State = .initial {
       didSet {
           setNeedsLayout()  // ← Recommended
       }
   }
   ```

4. **Use computed property for `flexBody`**
   - Don't cache the body
   - Let it re-compute on each layout
   - This enables reactive UI

## Migration Guide

### From Traditional FlexLayout

**Before:**
```swift
class MyView: UIView {
    private let rootFlexContainer = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(rootFlexContainer)
        rootFlexContainer.flex.define { flex in
            flex.addItem(titleLabel)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.frame = bounds
        rootFlexContainer.flex.layout()
    }
}
```

**After:**
```swift
class MyView: UIView, HasFlexBody {
    var flexBody: FlexContainer {
        VFlex {
            titleLabel
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFlexLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutFlexBody()
    }
}
```

## Requirements

- iOS 13.0+
- Swift 5.5+
- FlexLayout (existing dependency)

## Files

- `FlexComponent.swift` - Core protocol
- `FlexGroup.swift` - Component grouping
- `FlexLayoutBuilder.swift` - ResultBuilder implementation
- `FlexContainer.swift` - VFlex & HFlex
- `FlexModifier.swift` - Modifier wrapper
- `UIView+FlexComponent.swift` - UIView conformance
- `UIView+FlexModifiers.swift` - Modifier methods
- `UIView+FlexLayoutBody.swift` - HasFlexBody protocol & implementation
- `Examples.swift` - Usage examples
