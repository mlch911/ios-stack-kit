//
//  ScrollStacks.swift
//
//
//  Created by Russell Warwick on 02/05/2021.
//

import UIKit

// MARK: - UIView Extension Variants

public extension UIView {

    @discardableResult
    func VScroll(spacing: CGFloat = .zero, useSafeArea: Bool = false, constraint: Bool = false, @UIViewBuilder views: () -> [UIView]) -> ScrollViewBuilder {
		let scrollView = ScrollViewBuilder(axis: .vertical, spacing: spacing, views: views)
        
        VStack(useSafeArea: useSafeArea, constraint: constraint) { scrollView }
        
        return scrollView
    }
    
    @discardableResult
    func HScroll(spacing: CGFloat = .zero, useSafeArea: Bool = false, constraint: Bool = false, @UIViewBuilder views: () -> [UIView]) -> ScrollViewBuilder {
		let scrollView = ScrollViewBuilder(axis: .horizontal, spacing: spacing, views: views)
        
		VStack(useSafeArea: useSafeArea, constraint: constraint) { scrollView }
        
        return scrollView
    }
}

// MARK: - Class Variants

public class HScroll: ScrollViewBuilder {
    public init(spacing: CGFloat = .zero, @UIViewBuilder views: () -> [UIView]) {
        super.init(axis: .horizontal, spacing: spacing, views: views)
    }
    
    public required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public class VScroll: ScrollViewBuilder {
    public init(spacing: CGFloat = .zero, @UIViewBuilder views: () -> [UIView]) {
        super.init(axis: .vertical, spacing: spacing, views: views)
    }
    
    public required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
