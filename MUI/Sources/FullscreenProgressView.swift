//
//  FullscreenProgressView.swift
//  METBase
//
//  Created by Naohiro Hamada on 2020/09/10.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import UIKit

public final class FullscreenProgressView: UIView {
    
    private static var nib: UINib {
        UINib(nibName: "FullscreenProgressView",
              bundle: Bundle(for: FullscreenProgressView.self))
    }
    
    @IBOutlet private weak var dimmingView: UIView!
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    
    public var dimmingViewBackgroundColor: UIColor? {
        set {
            dimmingView.backgroundColor = newValue
        }
        get {
            dimmingView.backgroundColor
        }
    }
    
    public var indicatorStyle: UIActivityIndicatorView.Style {
        set {
            indicatorView.style = newValue
        }
        get {
            indicatorView.style
        }
    }
    
    public var indicatorColor: UIColor? {
        set {
            indicatorView.color = newValue
        }
        get {
            indicatorView.color
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    private func setup() {
        guard let v = FullscreenProgressView.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError()
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        v.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(v)
        NSLayoutConstraint.activate([self.leadingAnchor.constraint(equalTo: v.leadingAnchor),
                                     self.trailingAnchor.constraint(equalTo: v.trailingAnchor),
                                     self.topAnchor.constraint(equalTo: v.topAnchor),
                                     self.bottomAnchor.constraint(equalTo: v.bottomAnchor),])
        
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        guard let superview = self.superview else {
            return
        }
        
        NSLayoutConstraint.activate([self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                                     self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                                     self.topAnchor.constraint(equalTo: superview.topAnchor),
                                     self.bottomAnchor.constraint(equalTo: superview.bottomAnchor),])
        
        indicatorView.startAnimating()
    }
    
    public override func removeFromSuperview() {
        indicatorView.stopAnimating()
        
        super.removeFromSuperview()
    }
}
