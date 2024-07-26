//
//  PageViewUIKit.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 22/7/24.
//

import SwiftUI

struct PageViewUIKitController<Page : View>: UIViewControllerRepresentable {
//    typealias UIViewControllerType = <#type#>
    var pages: [Page]
    @Binding var currentPage: Int
    var backgroundColor: UIColor?
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]],
            direction: .forward,
            animated: true
        )
    }
    
    final class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewUIKitController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewUIKitController) {
            self.parent = pageViewController
            self.controllers = pageViewController.pages.map { page in
                let hostingController = UIHostingController(rootView: page)
                hostingController.view.backgroundColor = pageViewController.backgroundColor
                return hostingController
            }
            super.init()
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {return nil}
            return(index == 0 ? controllers.last : controllers[index - 1])
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index =  controllers.firstIndex(of: viewController) else {return nil}
            return(index + 1 == controllers.count ? controllers.first : controllers[index + 1])
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}
