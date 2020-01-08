//
//  ClassView.swift
//  StackViewAutoLayoutTest
//
//  Created by TechFun on 11/27/19.
//  Copyright © 2019 MyintZu. All rights reserved.
//

import UIKit

class ClassView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var testLabel: UILabel!
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       
       func commonInit() {
        Bundle.main.loadNibNamed("ClassPickerView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
       }

}
