extension UIView {
    enum Direction { case left, right, top, bottom }
    
    @discardableResult
    func snap(inside view: UIView, with insets: UIEdgeInsets) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor
            .constraint(equalTo: view.topAnchor, constant: insets.top)
            .isActive = true
        self.bottomAnchor
            .constraint(equalTo: view.bottomAnchor, constant: -insets.bottom)
            .isActive = true
        self.leadingAnchor
            .constraint(equalTo: view.leadingAnchor, constant: insets.left)
            .isActive = true
        self.trailingAnchor
            .constraint(equalTo: view.trailingAnchor, constant: -insets.right)
            .isActive = true
        
        return self
    }
    
    @discardableResult
    func snap(to view: UIView, from direction: Direction, at distance: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        switch direction {
        case .top:
            self.bottomAnchor
                .constraint(equalTo:  view.topAnchor,
                            constant: distance)
                .isActive = true
        case .bottom:
            self.topAnchor
                .constraint(equalTo:  view.bottomAnchor,
                            constant: distance)
                .isActive = true
        case .left:
            self.trailingAnchor
                .constraint(equalTo:  view.leadingAnchor,
                            constant: distance)
                .isActive = true
        case .right:
            self.leadingAnchor
                .constraint(equalTo:  view.trailingAnchor,
                            constant: distance)
                .isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func snap(inside view: UIView, from direction: Direction, at distance: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        switch direction {
        case .top:
            self.topAnchor
                .constraint(equalTo:  view.topAnchor,
                            constant: distance)
                .isActive = true
        case .bottom:
            self.bottomAnchor
                .constraint(equalTo:  view.bottomAnchor,
                            constant: -distance)
                .isActive = true
        case .left:
            self.leadingAnchor
                .constraint(equalTo:  view.leadingAnchor,
                            constant: distance)
                .isActive = true
        case .right:
            self.trailingAnchor
                .constraint(equalTo:  view.trailingAnchor,
                            constant: -distance)
                .isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func setSize(heigth: CGFloat? = nil, width: CGFloat? = nil) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let h = heigth {
            self.heightAnchor.constraint(equalToConstant: h).isActive = true
        }
        if let w = width {
            self.widthAnchor.constraint(equalToConstant: w).isActive = true
        }
        
        return self
    }
}
