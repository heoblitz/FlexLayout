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

/// Extension to add FlexLayout modifier methods directly to UIView
/// This allows QuickLayout-style syntax without the .flex prefix
public extension UIView {

    // MARK: - Direction, wrap, flow

    func direction(_ value: Flex.Direction) -> FlexModifier {
        FlexModifier(view: self) { $0.direction(value) }
    }

    func wrap(_ value: Flex.Wrap) -> FlexModifier {
        FlexModifier(view: self) { $0.wrap(value) }
    }

    func layoutDirection(_ value: Flex.LayoutDirection) -> FlexModifier {
        FlexModifier(view: self) { $0.layoutDirection(value) }
    }

    // MARK: - Justify, alignment

    func justifyContent(_ value: Flex.JustifyContent) -> FlexModifier {
        FlexModifier(view: self) { $0.justifyContent(value) }
    }

    func alignItems(_ value: Flex.AlignItems) -> FlexModifier {
        FlexModifier(view: self) { $0.alignItems(value) }
    }

    func alignSelf(_ value: Flex.AlignSelf) -> FlexModifier {
        FlexModifier(view: self) { $0.alignSelf(value) }
    }

    func alignContent(_ value: Flex.AlignContent) -> FlexModifier {
        FlexModifier(view: self) { $0.alignContent(value) }
    }

    // MARK: - Grow / shrink / basis

    func grow(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.grow(value) }
    }

    func shrink(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.shrink(value) }
    }

    func basis(_ value: CGFloat?) -> FlexModifier {
        FlexModifier(view: self) { $0.basis(value) }
    }

    func basis(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.basis(percent) }
    }

    // MARK: - Width / height / size

    func width(_ value: CGFloat?) -> FlexModifier {
        FlexModifier(view: self) { $0.width(value) }
    }

    func width(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.width(percent) }
    }

    func height(_ value: CGFloat?) -> FlexModifier {
        FlexModifier(view: self) { $0.height(value) }
    }

    func height(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.height(percent) }
    }

    func size(_ size: CGSize?) -> FlexModifier {
        FlexModifier(view: self) { $0.size(size) }
    }

    func size(_ sideLength: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.size(sideLength) }
    }

    func minWidth(_ value: CGFloat?) -> FlexModifier {
        FlexModifier(view: self) { $0.minWidth(value) }
    }

    func minWidth(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.minWidth(percent) }
    }

    func maxWidth(_ value: CGFloat?) -> FlexModifier {
        FlexModifier(view: self) { $0.maxWidth(value) }
    }

    func maxWidth(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.maxWidth(percent) }
    }

    func minHeight(_ value: CGFloat?) -> FlexModifier {
        FlexModifier(view: self) { $0.minHeight(value) }
    }

    func minHeight(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.minHeight(percent) }
    }

    func maxHeight(_ value: CGFloat?) -> FlexModifier {
        FlexModifier(view: self) { $0.maxHeight(value) }
    }

    func maxHeight(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.maxHeight(percent) }
    }

    func aspectRatio(_ value: CGFloat?) -> FlexModifier {
        FlexModifier(view: self) { $0.aspectRatio(value) }
    }

    func aspectRatio(of imageView: UIImageView) -> FlexModifier {
        FlexModifier(view: self) { $0.aspectRatio(of: imageView) }
    }

    // MARK: - Position

    func position(_ value: Flex.Position) -> FlexModifier {
        FlexModifier(view: self) { $0.position(value) }
    }

    func left(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.left(value) }
    }

    func left(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.left(percent) }
    }

    func top(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.top(value) }
    }

    func top(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.top(percent) }
    }

    func right(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.right(value) }
    }

    func right(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.right(percent) }
    }

    func bottom(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.bottom(value) }
    }

    func bottom(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.bottom(percent) }
    }

    func start(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.start(value) }
    }

    func start(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.start(percent) }
    }

    func end(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.end(value) }
    }

    func end(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.end(percent) }
    }

    func horizontally(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.horizontally(value) }
    }

    func horizontally(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.horizontally(percent) }
    }

    func vertically(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.vertically(value) }
    }

    func vertically(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.vertically(percent) }
    }

    func all(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.all(value) }
    }

    func all(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.all(percent) }
    }

    // MARK: - Margins

    func marginTop(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.marginTop(value) }
    }

    func marginTop(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.marginTop(percent) }
    }

    func marginLeft(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.marginLeft(value) }
    }

    func marginLeft(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.marginLeft(percent) }
    }

    func marginBottom(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.marginBottom(value) }
    }

    func marginBottom(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.marginBottom(percent) }
    }

    func marginRight(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.marginRight(value) }
    }

    func marginRight(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.marginRight(percent) }
    }

    func marginStart(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.marginStart(value) }
    }

    func marginStart(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.marginStart(percent) }
    }

    func marginEnd(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.marginEnd(value) }
    }

    func marginEnd(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.marginEnd(percent) }
    }

    func marginHorizontal(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.marginHorizontal(value) }
    }

    func marginHorizontal(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.marginHorizontal(percent) }
    }

    func marginVertical(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.marginVertical(value) }
    }

    func marginVertical(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.marginVertical(percent) }
    }

    func margin(_ insets: UIEdgeInsets) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(insets) }
    }

    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(directionalInsets) }
    }

    func margin(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(value) }
    }

    func margin(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(percent) }
    }

    func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(vertical, horizontal) }
    }

    func margin(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(vertical, horizontal) }
    }

    func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(top, horizontal, bottom) }
    }

    func margin(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(top, horizontal, bottom) }
    }

    func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(top, left, bottom, right) }
    }

    func margin(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.margin(top, left, bottom, right) }
    }

    // MARK: - Paddings

    func paddingTop(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingTop(value) }
    }

    func paddingTop(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingTop(percent) }
    }

    func paddingLeft(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingLeft(value) }
    }

    func paddingLeft(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingLeft(percent) }
    }

    func paddingBottom(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingBottom(value) }
    }

    func paddingBottom(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingBottom(percent) }
    }

    func paddingRight(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingRight(value) }
    }

    func paddingRight(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingRight(percent) }
    }

    func paddingStart(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingStart(value) }
    }

    func paddingStart(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingStart(percent) }
    }

    func paddingEnd(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingEnd(value) }
    }

    func paddingEnd(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingEnd(percent) }
    }

    func paddingHorizontal(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingHorizontal(value) }
    }

    func paddingHorizontal(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingHorizontal(percent) }
    }

    func paddingVertical(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingVertical(value) }
    }

    func paddingVertical(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.paddingVertical(percent) }
    }

    func padding(_ insets: UIEdgeInsets) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(insets) }
    }

    func padding(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(directionalInsets) }
    }

    func padding(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(value) }
    }

    func padding(_ percent: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(percent) }
    }

    func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(vertical, horizontal) }
    }

    func padding(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(vertical, horizontal) }
    }

    func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(top, horizontal, bottom) }
    }

    func padding(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(top, horizontal, bottom) }
    }

    func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(top, left, bottom, right) }
    }

    func padding(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifier {
        FlexModifier(view: self) { $0.padding(top, left, bottom, right) }
    }

    // MARK: - Gap

    func columnGap(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.columnGap(value) }
    }

    func rowGap(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.rowGap(value) }
    }

    func gap(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.gap(value) }
    }

    // MARK: - Visual properties

    func flexBackgroundColor(_ color: UIColor) -> FlexModifier {
        FlexModifier(view: self) { $0.backgroundColor(color) }
    }

    func flexCornerRadius(_ value: CGFloat) -> FlexModifier {
        FlexModifier(view: self) { $0.cornerRadius(value) }
    }

    func flexBorder(_ width: CGFloat, _ color: UIColor) -> FlexModifier {
        FlexModifier(view: self) { $0.border(width, color) }
    }

    // MARK: - Display

    func display(_ value: Flex.Display) -> FlexModifier {
        FlexModifier(view: self) { $0.display(value) }
    }

    func boxSizing(_ value: Flex.BoxSizing) -> FlexModifier {
        FlexModifier(view: self) { $0.boxSizing(value) }
    }

    func isIncludedInLayout(_ included: Bool) -> FlexModifier {
        FlexModifier(view: self) { $0.isIncludedInLayout(included) }
    }

    func markDirty() -> FlexModifier {
        FlexModifier(view: self) { $0.markDirty() }
    }
}
