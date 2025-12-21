// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

import UIKit

/// Base container for flex layouts
@MainActor
public struct FlexContainer: FlexComponent {
    let direction: Flex.Direction
    let children: [FlexComponent]
    private var modifiers: [(Flex) -> Void] = []

    init(direction: Flex.Direction, @FlexLayoutBuilder children: () -> FlexComponent) {
        self.direction = direction
        let child = children()
        if let group = child as? FlexGroup {
            self.children = group.components
        } else if child is EmptyFlexComponent {
            self.children = []
        } else {
            self.children = [child]
        }
    }

    private init(direction: Flex.Direction, children: [FlexComponent], modifiers: [(Flex) -> Void]) {
        self.direction = direction
        self.children = children
        self.modifiers = modifiers
    }

    @discardableResult
    public func applyToFlex(_ flex: Flex) -> Flex {
        let containerFlex = flex.addItem().direction(direction)

        // Apply modifiers to the container
        modifiers.forEach { $0(containerFlex) }

        // Add children
        children.forEach { child in
            child.applyToFlex(containerFlex)
        }

        return containerFlex
    }

    public func extractViews() -> [UIView] {
        children.flatMap { $0.extractViews() }
    }

    // MARK: - Private modifier chaining helper

    private func chain(_ modifier: @escaping (Flex) -> Void) -> FlexContainer {
        var newModifiers = modifiers
        newModifiers.append(modifier)
        return FlexContainer(direction: direction, children: children, modifiers: newModifiers)
    }
}

// MARK: - Container creation functions

/// Creates a vertical flex container (column direction)
@MainActor
public func VFlex(@FlexLayoutBuilder children: () -> FlexComponent) -> FlexContainer {
    FlexContainer(direction: .column, children: children)
}

/// Creates a horizontal flex container (row direction)
@MainActor
public func HFlex(@FlexLayoutBuilder children: () -> FlexComponent) -> FlexContainer {
    FlexContainer(direction: .row, children: children)
}

// MARK: - Direction, wrap, flow

public extension FlexContainer {
    func direction(_ value: Flex.Direction) -> FlexContainer {
        chain { $0.direction(value) }
    }

    func wrap(_ value: Flex.Wrap) -> FlexContainer {
        chain { $0.wrap(value) }
    }

    func layoutDirection(_ value: Flex.LayoutDirection) -> FlexContainer {
        chain { $0.layoutDirection(value) }
    }
}

// MARK: - Justify, alignment

public extension FlexContainer {
    func justifyContent(_ value: Flex.JustifyContent) -> FlexContainer {
        chain { $0.justifyContent(value) }
    }

    func alignItems(_ value: Flex.AlignItems) -> FlexContainer {
        chain { $0.alignItems(value) }
    }

    func alignSelf(_ value: Flex.AlignSelf) -> FlexContainer {
        chain { $0.alignSelf(value) }
    }

    func alignContent(_ value: Flex.AlignContent) -> FlexContainer {
        chain { $0.alignContent(value) }
    }
}

// MARK: - Grow / shrink / basis

public extension FlexContainer {
    func grow(_ value: CGFloat) -> FlexContainer {
        chain { $0.grow(value) }
    }

    func shrink(_ value: CGFloat) -> FlexContainer {
        chain { $0.shrink(value) }
    }

    func basis(_ value: CGFloat?) -> FlexContainer {
        chain { $0.basis(value) }
    }

    func basis(_ percent: FPercent) -> FlexContainer {
        chain { $0.basis(percent) }
    }
}

// MARK: - Width / height / size

public extension FlexContainer {
    func width(_ value: CGFloat?) -> FlexContainer {
        chain { $0.width(value) }
    }

    func width(_ percent: FPercent) -> FlexContainer {
        chain { $0.width(percent) }
    }

    func height(_ value: CGFloat?) -> FlexContainer {
        chain { $0.height(value) }
    }

    func height(_ percent: FPercent) -> FlexContainer {
        chain { $0.height(percent) }
    }

    func size(_ size: CGSize?) -> FlexContainer {
        chain { $0.size(size) }
    }

    func size(_ sideLength: CGFloat) -> FlexContainer {
        chain { $0.size(sideLength) }
    }

    func minWidth(_ value: CGFloat?) -> FlexContainer {
        chain { $0.minWidth(value) }
    }

    func minWidth(_ percent: FPercent) -> FlexContainer {
        chain { $0.minWidth(percent) }
    }

    func maxWidth(_ value: CGFloat?) -> FlexContainer {
        chain { $0.maxWidth(value) }
    }

    func maxWidth(_ percent: FPercent) -> FlexContainer {
        chain { $0.maxWidth(percent) }
    }

    func minHeight(_ value: CGFloat?) -> FlexContainer {
        chain { $0.minHeight(value) }
    }

    func minHeight(_ percent: FPercent) -> FlexContainer {
        chain { $0.minHeight(percent) }
    }

    func maxHeight(_ value: CGFloat?) -> FlexContainer {
        chain { $0.maxHeight(value) }
    }

    func maxHeight(_ percent: FPercent) -> FlexContainer {
        chain { $0.maxHeight(percent) }
    }

    func aspectRatio(_ value: CGFloat?) -> FlexContainer {
        chain { $0.aspectRatio(value) }
    }
}

// MARK: - Position

public extension FlexContainer {
    func position(_ value: Flex.Position) -> FlexContainer {
        chain { $0.position(value) }
    }

    func left(_ value: CGFloat) -> FlexContainer {
        chain { $0.left(value) }
    }

    func left(_ percent: FPercent) -> FlexContainer {
        chain { $0.left(percent) }
    }

    func top(_ value: CGFloat) -> FlexContainer {
        chain { $0.top(value) }
    }

    func top(_ percent: FPercent) -> FlexContainer {
        chain { $0.top(percent) }
    }

    func right(_ value: CGFloat) -> FlexContainer {
        chain { $0.right(value) }
    }

    func right(_ percent: FPercent) -> FlexContainer {
        chain { $0.right(percent) }
    }

    func bottom(_ value: CGFloat) -> FlexContainer {
        chain { $0.bottom(value) }
    }

    func bottom(_ percent: FPercent) -> FlexContainer {
        chain { $0.bottom(percent) }
    }

    func start(_ value: CGFloat) -> FlexContainer {
        chain { $0.start(value) }
    }

    func start(_ percent: FPercent) -> FlexContainer {
        chain { $0.start(percent) }
    }

    func end(_ value: CGFloat) -> FlexContainer {
        chain { $0.end(value) }
    }

    func end(_ percent: FPercent) -> FlexContainer {
        chain { $0.end(percent) }
    }

    func horizontally(_ value: CGFloat) -> FlexContainer {
        chain { $0.horizontally(value) }
    }

    func horizontally(_ percent: FPercent) -> FlexContainer {
        chain { $0.horizontally(percent) }
    }

    func vertically(_ value: CGFloat) -> FlexContainer {
        chain { $0.vertically(value) }
    }

    func vertically(_ percent: FPercent) -> FlexContainer {
        chain { $0.vertically(percent) }
    }

    func all(_ value: CGFloat) -> FlexContainer {
        chain { $0.all(value) }
    }

    func all(_ percent: FPercent) -> FlexContainer {
        chain { $0.all(percent) }
    }
}

// MARK: - Margins

public extension FlexContainer {
    func marginTop(_ value: CGFloat) -> FlexContainer {
        chain { $0.marginTop(value) }
    }

    func marginTop(_ percent: FPercent) -> FlexContainer {
        chain { $0.marginTop(percent) }
    }

    func marginLeft(_ value: CGFloat) -> FlexContainer {
        chain { $0.marginLeft(value) }
    }

    func marginLeft(_ percent: FPercent) -> FlexContainer {
        chain { $0.marginLeft(percent) }
    }

    func marginBottom(_ value: CGFloat) -> FlexContainer {
        chain { $0.marginBottom(value) }
    }

    func marginBottom(_ percent: FPercent) -> FlexContainer {
        chain { $0.marginBottom(percent) }
    }

    func marginRight(_ value: CGFloat) -> FlexContainer {
        chain { $0.marginRight(value) }
    }

    func marginRight(_ percent: FPercent) -> FlexContainer {
        chain { $0.marginRight(percent) }
    }

    func marginStart(_ value: CGFloat) -> FlexContainer {
        chain { $0.marginStart(value) }
    }

    func marginStart(_ percent: FPercent) -> FlexContainer {
        chain { $0.marginStart(percent) }
    }

    func marginEnd(_ value: CGFloat) -> FlexContainer {
        chain { $0.marginEnd(value) }
    }

    func marginEnd(_ percent: FPercent) -> FlexContainer {
        chain { $0.marginEnd(percent) }
    }

    func marginHorizontal(_ value: CGFloat) -> FlexContainer {
        chain { $0.marginHorizontal(value) }
    }

    func marginHorizontal(_ percent: FPercent) -> FlexContainer {
        chain { $0.marginHorizontal(percent) }
    }

    func marginVertical(_ value: CGFloat) -> FlexContainer {
        chain { $0.marginVertical(value) }
    }

    func marginVertical(_ percent: FPercent) -> FlexContainer {
        chain { $0.marginVertical(percent) }
    }

    func margin(_ insets: UIEdgeInsets) -> FlexContainer {
        chain { $0.margin(insets) }
    }

    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexContainer {
        chain { $0.margin(directionalInsets) }
    }

    func margin(_ value: CGFloat) -> FlexContainer {
        chain { $0.margin(value) }
    }

    func margin(_ percent: FPercent) -> FlexContainer {
        chain { $0.margin(percent) }
    }

    func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexContainer {
        chain { $0.margin(vertical, horizontal) }
    }

    func margin(_ vertical: FPercent, _ horizontal: FPercent) -> FlexContainer {
        chain { $0.margin(vertical, horizontal) }
    }

    func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexContainer {
        chain { $0.margin(top, horizontal, bottom) }
    }

    func margin(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexContainer {
        chain { $0.margin(top, horizontal, bottom) }
    }

    func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexContainer {
        chain { $0.margin(top, left, bottom, right) }
    }

    func margin(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexContainer {
        chain { $0.margin(top, left, bottom, right) }
    }
}

// MARK: - Paddings

public extension FlexContainer {
    func paddingTop(_ value: CGFloat) -> FlexContainer {
        chain { $0.paddingTop(value) }
    }

    func paddingTop(_ percent: FPercent) -> FlexContainer {
        chain { $0.paddingTop(percent) }
    }

    func paddingLeft(_ value: CGFloat) -> FlexContainer {
        chain { $0.paddingLeft(value) }
    }

    func paddingLeft(_ percent: FPercent) -> FlexContainer {
        chain { $0.paddingLeft(percent) }
    }

    func paddingBottom(_ value: CGFloat) -> FlexContainer {
        chain { $0.paddingBottom(value) }
    }

    func paddingBottom(_ percent: FPercent) -> FlexContainer {
        chain { $0.paddingBottom(percent) }
    }

    func paddingRight(_ value: CGFloat) -> FlexContainer {
        chain { $0.paddingRight(value) }
    }

    func paddingRight(_ percent: FPercent) -> FlexContainer {
        chain { $0.paddingRight(percent) }
    }

    func paddingStart(_ value: CGFloat) -> FlexContainer {
        chain { $0.paddingStart(value) }
    }

    func paddingStart(_ percent: FPercent) -> FlexContainer {
        chain { $0.paddingStart(percent) }
    }

    func paddingEnd(_ value: CGFloat) -> FlexContainer {
        chain { $0.paddingEnd(value) }
    }

    func paddingEnd(_ percent: FPercent) -> FlexContainer {
        chain { $0.paddingEnd(percent) }
    }

    func paddingHorizontal(_ value: CGFloat) -> FlexContainer {
        chain { $0.paddingHorizontal(value) }
    }

    func paddingHorizontal(_ percent: FPercent) -> FlexContainer {
        chain { $0.paddingHorizontal(percent) }
    }

    func paddingVertical(_ value: CGFloat) -> FlexContainer {
        chain { $0.paddingVertical(value) }
    }

    func paddingVertical(_ percent: FPercent) -> FlexContainer {
        chain { $0.paddingVertical(percent) }
    }

    func padding(_ insets: UIEdgeInsets) -> FlexContainer {
        chain { $0.padding(insets) }
    }

    func padding(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexContainer {
        chain { $0.padding(directionalInsets) }
    }

    func padding(_ value: CGFloat) -> FlexContainer {
        chain { $0.padding(value) }
    }

    func padding(_ percent: FPercent) -> FlexContainer {
        chain { $0.padding(percent) }
    }

    func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexContainer {
        chain { $0.padding(vertical, horizontal) }
    }

    func padding(_ vertical: FPercent, _ horizontal: FPercent) -> FlexContainer {
        chain { $0.padding(vertical, horizontal) }
    }

    func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexContainer {
        chain { $0.padding(top, horizontal, bottom) }
    }

    func padding(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexContainer {
        chain { $0.padding(top, horizontal, bottom) }
    }

    func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexContainer {
        chain { $0.padding(top, left, bottom, right) }
    }

    func padding(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexContainer {
        chain { $0.padding(top, left, bottom, right) }
    }
}

// MARK: - Gap

public extension FlexContainer {
    func columnGap(_ value: CGFloat) -> FlexContainer {
        chain { $0.columnGap(value) }
    }

    func rowGap(_ value: CGFloat) -> FlexContainer {
        chain { $0.rowGap(value) }
    }

    func gap(_ value: CGFloat) -> FlexContainer {
        chain { $0.gap(value) }
    }
}

// MARK: - Visual properties

public extension FlexContainer {
    func backgroundColor(_ color: UIColor) -> FlexContainer {
        chain { $0.backgroundColor(color) }
    }

    func cornerRadius(_ value: CGFloat) -> FlexContainer {
        chain { $0.cornerRadius(value) }
    }

    func border(_ width: CGFloat, _ color: UIColor) -> FlexContainer {
        chain { $0.border(width, color) }
    }
}

// MARK: - Display

public extension FlexContainer {
    func display(_ value: Flex.Display) -> FlexContainer {
        chain { $0.display(value) }
    }

    func boxSizing(_ value: Flex.BoxSizing) -> FlexContainer {
        chain { $0.boxSizing(value) }
    }

    func isIncludedInLayout(_ included: Bool) -> FlexContainer {
        chain { $0.isIncludedInLayout(included) }
    }

    func markDirty() -> FlexContainer {
        chain { $0.markDirty() }
    }
}
