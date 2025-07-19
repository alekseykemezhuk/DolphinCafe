import UIKit
import SnapKit

class OnboardingContentViewController: UIViewController {
    
    // MARK: - Properties

    private let pageControl = UIPageControl()
    private let featureDescriptionlabel = UILabel()
    var featureDescription = ""
    var numberOfPages = 0
    var currentPageIndex = 0
    
    // MARK: - VC Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupHierarchy()
        setupConstraints()
        setupAppearance()
    }
    
    // MARK: - Flow Methods

    private func setupHierarchy() {
        view.addSubview(featureDescriptionlabel)
        view.addSubview(pageControl)
    }
    
    private func setupConstraints() {
        featureDescriptionlabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    private func setupAppearance() {
        featureDescriptionlabel.text = featureDescription
        featureDescriptionlabel.font = .preferredFont(forTextStyle: .extraLargeTitle)
        featureDescriptionlabel.numberOfLines = 0
        
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPageIndex
    }
    
}
