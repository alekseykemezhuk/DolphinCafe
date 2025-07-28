import UIKit
import SnapKit

final class OnboardingContentViewController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel: OnboardingContentViewModel
    private let layout = OnboardingLayout.self
    private let featureTitle = UILabel()
    private let featureDescriptionLabel = UILabel()
    private let doneButton = UIButton(configuration: .filled())
    private let pageControl = UIPageControl()
    
    // MARK: - Init
    
    init(viewModel: OnboardingContentViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VC Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupHierarchy()
        setupConstraints()
        setupAppearance()
        setupActions()
    }
    
    // MARK: - Flow Methods

    private func setupHierarchy() {
        view.addSubview(featureTitle)
        view.addSubview(featureDescriptionLabel)
        view.addSubview(doneButton)
        view.addSubview(pageControl)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        featureTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeArea).offset(layout.halfDefaultOffset)
            make.leading.trailing.equalTo(safeArea).inset(layout.halfDefaultOffset)
        }
        
        featureDescriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(featureTitle).offset(layout.defaultOffset)
            make.leading.trailing.equalTo(safeArea).inset(layout.halfDefaultOffset)
        }
        
        doneButton.snp.makeConstraints { make in
            make.bottom.equalTo(pageControl.snp.top).offset(-layout.halfDefaultOffset)
            make.leading.trailing.equalTo(safeArea).inset(layout.defaultOffset)
            make.height.equalTo(doneButton.snp.width).multipliedBy(layout.buttonHeightRatio)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeArea).offset(-layout.pageControlBottomSpacing)
        }
    }
    
    private func setupAppearance() {
        featureTitle.text = viewModel.featureTitle
        featureTitle.textAlignment = .center
        featureTitle.adjustsFontSizeToFitWidth = true 
        featureTitle.font = .preferredFont(forTextStyle: .extraLargeTitle)
        
        featureDescriptionLabel.text = viewModel.featureDescription
        featureDescriptionLabel.textAlignment = .center
        featureDescriptionLabel.adjustsFontSizeToFitWidth = true
        featureDescriptionLabel.font = .systemFont(ofSize: 35)
        featureDescriptionLabel.numberOfLines = 0
        
        doneButton.isHidden = !viewModel.isLastPage
        doneButton.setTitle(viewModel.doneButtonTitle, for: .normal)
        doneButton.titleLabel?.numberOfLines = 1
        doneButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        pageControl.numberOfPages = viewModel.numberOfPages
        pageControl.currentPage = viewModel.currentPageIndex
    }
    
    private func setupActions() {
        doneButton.addAction(UIAction { _ in
            //action
        }, for: .touchUpInside)
    }
    
}
