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
import FlexLayout
import PinLayout

/// Simple ResultBuilder example with one state change
class SimpleResultBuilderViewController: BaseViewController {

    // MARK: - State

    private var isExpanded = false {
        didSet {
            view.setNeedsLayout()
        }
    }

    // MARK: - UI Components

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ResultBuilder Example"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap the button to see conditional rendering"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()

    private let toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Details", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "✅ Declarative syntax\n✅ if/else support\n✅ Auto view management\n✅ QuickLayout-style"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()

    // MARK: - View (HasFlexBody)

    private var contentView: UIView!

    // MARK: - Initialization

    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var flexView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        flexView = SimpleFlexBodyView(
            titleLabel: titleLabel,
            descriptionLabel: descriptionLabel,
            toggleButton: toggleButton,
            detailsLabel: detailsLabel,
            isExpanded: isExpanded
        )
        view.addSubview(flexView)
        toggleButton.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)

    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        flexView.pin.all(view.pin.safeArea)
    }

    @objc private func toggleButtonTapped() {
        isExpanded.toggle()
        toggleButton.setTitle(isExpanded ? "Hide Details" : "Show Details", for: .normal)

        if let flexView = flexView as? SimpleFlexBodyView {
            flexView.updateExpanded(isExpanded)

            // QuickLayout 스타일 애니메이션
            UIView.animate(withDuration: 0.3, delay: 0, options: [.beginFromCurrentState, .curveEaseInOut]) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

// MARK: - Simple FlexBody View

private class SimpleFlexBodyView: UIView, HasFlexBody {
    private let titleLabel: UILabel
    private let descriptionLabel: UILabel
    private let toggleButton: UIButton
    private let detailsLabel: UILabel
    private var isExpanded: Bool

    var flexBody: FlexContainer {
        VFlex {
            titleLabel
                .marginBottom(16)

            descriptionLabel
                .marginBottom(24)

            toggleButton
                .height(isExpanded ? 200 : 100)
                .marginBottom(16)

            // Conditional rendering - shows/hides based on state
            if isExpanded {
                detailsLabel
                    .padding(16)
                    .backgroundColor(.systemGray6)
                    .cornerRadius(8)
            }
        }
        .padding(16)
    }

    init(titleLabel: UILabel,
         descriptionLabel: UILabel,
         toggleButton: UIButton,
         detailsLabel: UILabel,
         isExpanded: Bool) {
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
        self.toggleButton = toggleButton
        self.detailsLabel = detailsLabel
        self.isExpanded = isExpanded

        super.init(frame: .zero)
        backgroundColor = .white
        setupFlexLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateExpanded(_ expanded: Bool) {
        isExpanded = expanded
        setNeedsLayout()
        
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layoutFlexBody()

        
    }
}
