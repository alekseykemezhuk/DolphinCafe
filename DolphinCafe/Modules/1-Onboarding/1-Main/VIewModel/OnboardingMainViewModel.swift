final class OnboardingMainViewModel {
    
    let features = [
        Feature(title: "Hello!",
                description: "Welcome to Dolphin Cafe app!"),
        Feature(title: "What is this for",
                description: "Here you can place an order, check our menu or use your loyalty card"),
        Feature(title: "We appreciate you",
                description: "Thanks for being part of our community. Enjoy your experience!")]

    var numberOfFeatures: Int {
        return features.count
    }
    
    func featureTitle(atIndex index: Int) -> String {
        return features[index].title
    }
    
    func featureDescription(atIndex index: Int) -> String {
        return features[index].description
    }

    
}
