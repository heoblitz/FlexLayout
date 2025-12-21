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

/// A group of flex components
/// Used internally by ResultBuilder to group multiple components
@MainActor
public struct FlexGroup: FlexComponent {
    let components: [FlexComponent]

    init(_ components: [FlexComponent]) {
        self.components = components
    }

    @discardableResult
    public func applyToFlex(_ flex: Flex) -> Flex {
        var lastFlex = flex
        components.forEach { component in
            lastFlex = component.applyToFlex(flex)
        }
        return lastFlex
    }

    public func extractViews() -> [UIView] {
        components.flatMap { $0.extractViews() }
    }
}

/// Empty component for optional cases
@MainActor
public struct EmptyFlexComponent: FlexComponent {
    @discardableResult
    public func applyToFlex(_ flex: Flex) -> Flex {
        flex
    }

    public func extractViews() -> [UIView] {
        []
    }
}
