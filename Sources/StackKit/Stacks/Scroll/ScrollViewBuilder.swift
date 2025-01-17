//
//  ScrollViewBuilder.swift
//  
//
//  Created by Russell Warwick on 04/07/2021.
//

import UIKit

open class ScrollViewBuilder: UIView {
    
    // MARK: - UI
        
    public let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsHorizontalScrollIndicator = false
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
        
	public let stackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // MARK: - Init
    
	public init(axis: NSLayoutConstraint.Axis, spacing: CGFloat, @UIViewBuilder views: () -> [UIView]) {
        
        super.init(frame: .zero)
            
        addSubview(scrollView)
        scrollView.addSubview(stackView)
		stackView.spacing = spacing
        
        if axis == .vertical {
            stackView.axis = .vertical
            stackView.widthAnchor.constraint(equalTo:scrollView.widthAnchor).isActive = true
        } else {
            stackView.axis = .horizontal
            stackView.heightAnchor.constraint(equalTo:scrollView.heightAnchor).isActive = true
        }

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.topAnchor.constraint(equalTo:topAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        ])

        stackView.addArrangedSubViews(views())
    }

    required public init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public extension ScrollViewBuilder {

    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        stackView.spacing = spacing
        return self
    }

    @discardableResult
    func margin(_ margins: UIEdgeInsets) -> Self {
        stackView.margin(margins)
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        stackView.alignment = alignment
        return self
    }
	
	@discardableResult
	func distribution(_ distribution: UIStackView.Distribution) -> Self {
		stackView.distribution = distribution
		return self
	}
    
    @discardableResult
    func showVerticalIndicators(_ value: Bool) -> Self {
        scrollView.showsVerticalScrollIndicator = value
        return self
    }
    
    @discardableResult
    func showHorizontalIndicators(_ value: Bool) -> Self {
        scrollView.showsHorizontalScrollIndicator = value
        return self
    }
    
    @discardableResult
    func alwaysBounceHorizontal(_ value: Bool) -> Self {
        scrollView.alwaysBounceHorizontal = value
        return self
    }
    
    @discardableResult
    func alwaysBounceVertical(_ value: Bool) -> Self {
        scrollView.alwaysBounceVertical = value
        return self
    }
    
    @discardableResult
    func scrollDelegate(_ delegate: UIScrollViewDelegate) -> Self {
        scrollView.delegate = delegate
        return self
    }
}
