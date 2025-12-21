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

/// Example demonstrating the new ResultBuilder syntax
/// QuickLayout-style declarative layout with HasFlexBody protocol
class ResultBuilderExampleView: UIView, HasFlexBody {

    // MARK: - State

    private var isExpanded = false {
        didSet {
            setNeedsLayout()
        }
    }

    private var showOptionalContent = true {
        didSet {
            setNeedsLayout()
        }
    }

    // MARK: - UI Components

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "flexlayout-logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ResultBuilder Example"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "QuickLayout-style declarative syntax"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "FlexLayout now supports SwiftUI-like declarative syntax with ResultBuilder. No more nested .define closures!"
        label.numberOfLines = 0
        return label
    }()

    private let expandButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Details", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "✅ Declarative syntax\n✅ if/else support\n✅ Auto view management\n✅ Type-safe\n✅ 100% compatible"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private let toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        return toggle
    }()

    private let toggleLabel: UILabel = {
        let label = UILabel()
        label.text = "Show optional content"
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private let optionalContentLabel: UILabel = {
        let label = UILabel()
        label.text = "This content is conditionally rendered using if statement!"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()

    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap the button above to see conditional rendering in action!"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()

    // MARK: - FlexBody (Declarative Layout)

    var flexBody: FlexContainer {
        VFlex {
            // Header Section with Image and Text
            HFlex {
                logoImageView
                    .width(80)
                    .height(80)

                VFlex {
                    titleLabel
                    subtitleLabel
                        .marginTop(4)
                }
                .paddingLeft(12)
                .grow(1)
            }
            .marginBottom(16)

            // Description
            descriptionLabel
                .marginBottom(16)

            // Expand Button
            expandButton
                .height(44)
                .marginBottom(16)

            // Conditional: Details (if expanded)
            if isExpanded {
                detailsLabel
                    .padding(12)
                    .marginBottom(16)
            }

            // Toggle Section
            HFlex {
                toggleLabel
                    .grow(1)
                toggleSwitch
            }
            .alignItems(.center)
            .marginBottom(16)

            // Conditional: Optional Content (if switch is on)
            if showOptionalContent {
                optionalContentLabel
                    .padding(12)
                    .marginBottom(16)
            }

            // Divider
            divider
                .height(1)
                .marginBottom(16)

            // Bottom Label
            bottomLabel
        }
        .padding(16)
    }

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        backgroundColor = .white

        // Setup actions
        expandButton.addTarget(self, action: #selector(expandButtonTapped), for: .touchUpInside)
        toggleSwitch.addTarget(self, action: #selector(toggleSwitchChanged), for: .valueChanged)

        // Setup flex layout
        setupFlexLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .white

        expandButton.addTarget(self, action: #selector(expandButtonTapped), for: .touchUpInside)
        toggleSwitch.addTarget(self, action: #selector(toggleSwitchChanged), for: .valueChanged)

        setupFlexLayout()
    }

    // MARK: - Actions

    @objc private func expandButtonTapped() {
        isExpanded.toggle()
        expandButton.setTitle(isExpanded ? "Hide Details" : "Show Details", for: .normal)
    }

    @objc private func toggleSwitchChanged() {
        showOptionalContent = toggleSwitch.isOn
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutFlexBody()
    }
}
