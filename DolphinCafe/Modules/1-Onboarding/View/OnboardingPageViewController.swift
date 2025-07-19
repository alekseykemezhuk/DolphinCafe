import UIKit
import SnapKit

class OnboardingPageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    private let featureDescriptionArray = [
        "Test 1", "Test 2", "Test 3"
    ]
    
    // MARK: - VC Lifecycle

    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let contentViewController = makeContentViewController(atIndex: 0) {
            setViewControllers([contentViewController], direction: .forward, animated: false)
        }
    }

    // MARK: - Flow Methods

    private func makeContentViewController (atIndex index: Int) -> OnboardingContentViewController? {
        guard featureDescriptionArray.indices.contains(index) else { return nil }
        let contentViewController = OnboardingContentViewController()
        contentViewController.featureDescription = featureDescriptionArray[index]
        contentViewController.numberOfPages = featureDescriptionArray.count
        contentViewController.currentPageIndex = index
        return contentViewController
    }
}

    // MARK: - DataSource

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let contentViewController = viewController as? OnboardingContentViewController else {
            return UIViewController() }
        let currentPageIndex = contentViewController.currentPageIndex
        let previousPageIndex = currentPageIndex - 1
        return makeContentViewController(atIndex: previousPageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let contentViewController = viewController as? OnboardingContentViewController else {
            return UIViewController() }
        let currentPageIndex = contentViewController.currentPageIndex
        let nextPageIndex = currentPageIndex + 1
        return makeContentViewController(atIndex: nextPageIndex)
    }
    
    
}


