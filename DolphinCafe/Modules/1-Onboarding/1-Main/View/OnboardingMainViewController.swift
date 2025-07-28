import UIKit
import SnapKit

final class OnboardingMainViewController: UIPageViewController {
    
    // MARK: - Properties
    
    private var viewModel = OnboardingMainViewModel()
    
    // MARK: - Init

    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        dataSource = self
        
        if let contentViewController = makeContentViewController(atIndex: 0) {
            setViewControllers([contentViewController], direction: .forward, animated: false)
        }
    }

    // MARK: - Flow Methods

    private func makeContentViewController (atIndex index: Int) -> OnboardingContentViewController? {
        guard viewModel.features.indices.contains(index) else { return nil }
        let contentViewModel = OnboardingContentViewModel(
            feature: viewModel.features[index],
            numberOfPages: viewModel.numberOfFeatures,
            currentPageIndex: index
        )
        let contentViewController = OnboardingContentViewController(viewModel: contentViewModel)
        return contentViewController
    }
}

    // MARK: - DataSource

extension OnboardingMainViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let contentViewController = viewController as? OnboardingContentViewController else {
            return UIViewController() }
        let currentPageIndex = contentViewController.viewModel.currentPageIndex
        let previousPageIndex = currentPageIndex - 1
        return makeContentViewController(atIndex: previousPageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let contentViewController = viewController as? OnboardingContentViewController else {
            return UIViewController() }
        let currentPageIndex = contentViewController.viewModel.currentPageIndex
        let nextPageIndex = currentPageIndex + 1
        return makeContentViewController(atIndex: nextPageIndex)
    }
    
    
}


