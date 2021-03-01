//
//  PageViewController.swift
//  SnowConfettiFirework
//
//  Created by Mykola Korotun on 28.02.2021.
//

import UIKit

class AnimationsPageViewController: UIPageViewController {

    // MARK: - Private methods
    private lazy var snowVC = SnowViewController()
    private lazy var confettiVC = ConfettiViewController()
    private lazy var fireworkVC = FireworkViewController()

    private var currentIndex = 0
    private lazy var pages: [UIViewController] = {
        [snowVC, confettiVC, fireworkVC].compactMap{ $0 }
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        dataSource = self
        
        if let firstViewController = pages.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }

}

// MARK: - UIPageViewControllerDataSource
extension AnimationsPageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {

        var index = indexOfViewController(viewController)

        if (index == 0) || (index == NSNotFound) {
            return nil
        }

        index -= 1

        return viewControllerAtIndex(index)
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = indexOfViewController(viewController)

        if index == NSNotFound {
            return nil
        }

        index += 1

        if index == pages.count {
            return nil
        }

        return viewControllerAtIndex(index)
    }

}

// MARK: - Helpers
fileprivate extension AnimationsPageViewController {

    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        if pages.count == 0 || index >= pages.count {
            return nil
        }

        return pages[index]
    }

    func indexOfViewController(_ viewController: UIViewController) -> Int {
        return pages.firstIndex(of: viewController) ?? NSNotFound
    }

}
