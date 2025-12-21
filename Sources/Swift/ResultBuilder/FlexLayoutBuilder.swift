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

/// A custom result builder for constructing flex layouts declaratively
@resultBuilder
@MainActor
public struct FlexLayoutBuilder {

    /// Build empty block
    public static func buildBlock() -> FlexComponent {
        EmptyFlexComponent()
    }

    /// Build a single component
    public static func buildBlock(_ component: FlexComponent) -> FlexComponent {
        component
    }

    /// Build multiple components (2-10 components)
    public static func buildBlock(_ c1: FlexComponent, _ c2: FlexComponent) -> FlexComponent {
        FlexGroup([c1, c2])
    }

    public static func buildBlock(_ c1: FlexComponent, _ c2: FlexComponent, _ c3: FlexComponent) -> FlexComponent {
        FlexGroup([c1, c2, c3])
    }

    public static func buildBlock(_ c1: FlexComponent, _ c2: FlexComponent, _ c3: FlexComponent, _ c4: FlexComponent) -> FlexComponent {
        FlexGroup([c1, c2, c3, c4])
    }

    public static func buildBlock(_ c1: FlexComponent, _ c2: FlexComponent, _ c3: FlexComponent, _ c4: FlexComponent, _ c5: FlexComponent) -> FlexComponent {
        FlexGroup([c1, c2, c3, c4, c5])
    }

    public static func buildBlock(_ c1: FlexComponent, _ c2: FlexComponent, _ c3: FlexComponent, _ c4: FlexComponent, _ c5: FlexComponent, _ c6: FlexComponent) -> FlexComponent {
        FlexGroup([c1, c2, c3, c4, c5, c6])
    }

    public static func buildBlock(_ c1: FlexComponent, _ c2: FlexComponent, _ c3: FlexComponent, _ c4: FlexComponent, _ c5: FlexComponent, _ c6: FlexComponent, _ c7: FlexComponent) -> FlexComponent {
        FlexGroup([c1, c2, c3, c4, c5, c6, c7])
    }

    public static func buildBlock(_ c1: FlexComponent, _ c2: FlexComponent, _ c3: FlexComponent, _ c4: FlexComponent, _ c5: FlexComponent, _ c6: FlexComponent, _ c7: FlexComponent, _ c8: FlexComponent) -> FlexComponent {
        FlexGroup([c1, c2, c3, c4, c5, c6, c7, c8])
    }

    public static func buildBlock(_ c1: FlexComponent, _ c2: FlexComponent, _ c3: FlexComponent, _ c4: FlexComponent, _ c5: FlexComponent, _ c6: FlexComponent, _ c7: FlexComponent, _ c8: FlexComponent, _ c9: FlexComponent) -> FlexComponent {
        FlexGroup([c1, c2, c3, c4, c5, c6, c7, c8, c9])
    }

    public static func buildBlock(_ c1: FlexComponent, _ c2: FlexComponent, _ c3: FlexComponent, _ c4: FlexComponent, _ c5: FlexComponent, _ c6: FlexComponent, _ c7: FlexComponent, _ c8: FlexComponent, _ c9: FlexComponent, _ c10: FlexComponent) -> FlexComponent {
        FlexGroup([c1, c2, c3, c4, c5, c6, c7, c8, c9, c10])
    }

    /// Build from an expression
    public static func buildExpression(_ component: FlexComponent) -> FlexComponent {
        component
    }

    /// Build from a UIView
    public static func buildExpression(_ view: UIView) -> FlexComponent {
        view
    }

    /// Build from an optional component (if without else)
    public static func buildOptional(_ component: FlexComponent?) -> FlexComponent {
        component ?? EmptyFlexComponent()
    }

    /// Build from a conditional (if-else) - first branch
    public static func buildEither(first component: FlexComponent) -> FlexComponent {
        component
    }

    /// Build from a conditional (if-else) - second branch
    public static func buildEither(second component: FlexComponent) -> FlexComponent {
        component
    }

    /// Build an array of components (for loops)
    public static func buildArray(_ components: [FlexComponent]) -> FlexComponent {
        FlexGroup(components)
    }

    /// Build limited availability
    public static func buildLimitedAvailability(_ component: FlexComponent) -> FlexComponent {
        component
    }
}
