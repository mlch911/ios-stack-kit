//
//  Spacer.swift
//  
//
//  Created by Russell Warwick on 03/07/2021.
//

import UIKit

@objcMembers
public final class Spacer: UIView {
	
	public static func auto() -> Spacer {
		let s = Spacer()
		s.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
		s.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
		s.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
		s.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
		return s
	}
	
    // MARK: - Init
    
    public init() {
        super.init(frame: .zero)
    }
    
	public convenience init(square: CGFloat) {
		self.init(w: square, h: square)
	}

    public init(w: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: w).isActive = true
    }
    
    public init(h: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: h).isActive = true
    }
	
	public init(w: CGFloat, h: CGFloat) {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		widthAnchor.constraint(equalToConstant: w).isActive = true
		heightAnchor.constraint(equalToConstant: h).isActive = true
	}

    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
