final class OnboardingContentViewModel {
    
    // MARK: - Properties
    
    let feature: Feature
    let numberOfPages: Int
    let currentPageIndex: Int
    let doneButtonTitle = "Got it!"
    var featureTitle: String { feature.title }
    var featureDescription: String { feature.description }
    var isLastPage: Bool {
        currentPageIndex == numberOfPages - 1
    }
    
    // MARK: - Init
    
    init(feature: Feature, numberOfPages: Int, currentPageIndex: Int) {
        self.feature = feature
        self.numberOfPages = numberOfPages
        self.currentPageIndex = currentPageIndex
    }
    
}
