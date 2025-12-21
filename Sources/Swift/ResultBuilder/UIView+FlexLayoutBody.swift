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

/// Protocol for views that have a declarative flex body
/// Similar to QuickLayout's HasBody protocol
@MainActor
public protocol HasFlexBody: UIView {
    /// The declarative flex layout body
    /// Implement this property to define your layout
    var flexBody: FlexContainer { get }
}

/// Storage for flex layout state
private class FlexBodyState {
    var rootContainerView: UIView?
    var activeSubviews: [UIView] = []
    var isInitialized = false
}

private var flexBodyStateKey: UInt8 = 0

// MARK: - HasFlexBody Default Implementation

public extension HasFlexBody {

    /// Call this in your init to set up the flex layout
    func setupFlexLayout() {
        let state = getFlexBodyState()
        guard !state.isInitialized else { return }

        // Create root container
        let container = UIView()
        addSubview(container)
        state.rootContainerView = container
        state.isInitialized = true

        // Initial layout
        updateFlexLayout()
    }

    /// Call this in layoutSubviews to update the layout
    func layoutFlexBody() {
        updateFlexLayout()

        guard let rootContainer = getFlexBodyState().rootContainerView else { return }

        // Position root container to fill the view
        rootContainer.frame = bounds

        // Perform flex layout
        rootContainer.flex.layout()
    }

    // MARK: - Private

    private func updateFlexLayout() {
        let state = getFlexBodyState()
        guard let rootContainer = state.rootContainerView else { return }

        // Get the flex body
        let body = flexBody

        // Extract views from the body
        let newViews = body.extractViews()

        // Update view hierarchy using diff
        updateViewHierarchy(container: rootContainer, newViews: newViews, state: state)

        // Clear existing flex layout
        rootContainer.subviews.forEach { $0.removeFromSuperview() }

        // Apply flex layout
        body.applyToFlex(rootContainer.flex)

        // Store current views
        state.activeSubviews = newViews
    }

    private func getFlexBodyState() -> FlexBodyState {
        if let state = objc_getAssociatedObject(self, &flexBodyStateKey) as? FlexBodyState {
            return state
        }

        let newState = FlexBodyState()
        objc_setAssociatedObject(self, &flexBodyStateKey, newState, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return newState
    }

    private func updateViewHierarchy(container: UIView, newViews: [UIView], state: FlexBodyState) {
        let oldViews = state.activeSubviews

        // Calculate diff
        let diff = newViews.difference(from: oldViews)

        // Apply changes
        for change in diff {
            switch change {
            case .insert(let offset, let view, _):
                // Add new view
                if offset < container.subviews.count {
                    container.insertSubview(view, at: offset)
                } else {
                    container.addSubview(view)
                }

            case .remove(_, let view, _):
                // Remove old view
                view.removeFromSuperview()
            }
        }
    }
}
