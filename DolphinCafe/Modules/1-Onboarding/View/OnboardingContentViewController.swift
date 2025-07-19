import UIKit
import SnapKit

class OnboardingContentViewController: UIViewController {
    
    // MARK: - Properties

    private let featureDescriptionlabel = UILabel()
    private let gotItButton = UIButton(configuration: .filled())
    private let pageControl = UIPageControl()
    var featureDescription = ""
    var numberOfPages = 0
    var currentPageIndex = 0
    var isLast = false
    
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
        view.addSubview(featureDescriptionlabel)
        view.addSubview(gotItButton)
        view.addSubview(pageControl)
    }
    
    private func setupConstraints() {
        featureDescriptionlabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        gotItButton.snp.makeConstraints { make in
            make.bottom.equalTo(pageControl.snp.top).offset(-50)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.height.equalTo(gotItButton.snp.width).multipliedBy(0.25)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    private func setupAppearance() {
        featureDescriptionlabel.text = featureDescription
        featureDescriptionlabel.font = .preferredFont(forTextStyle: .extraLargeTitle)
        featureDescriptionlabel.numberOfLines = 0
        
        gotItButton.isHidden = !isLast
        gotItButton.setTitle("Got it!", for: .normal)
        
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPageIndex
    }
    
    private func setupActions() {
        gotItButton.addAction(UIAction { _ in
            //action
        }, for: .touchUpInside)
    }
    
}
