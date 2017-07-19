//
//  ListButton.swift
//  vpn
//
//  Created by 张灏 on 2017/7/4.
//  Copyright © 2017年 张灏. All rights reserved.
//

import Foundation

class ListButton: UIButton, ListComponent
{
    @IBInspectable var componentID: String = "";
    
    private var onButtonClick: (()-> Void)?;
    
    override func draw(_ rect: CGRect) {
        super.draw(rect);
        
        if(ListCell.registerToListCell(id: getComponentID(), component: self) == nil)
        {
            print("\(self) can not find ListCell in its parent views");
        }
        
        self.addTarget(self, action: #selector(onClick), for: UIControlEvents.touchDown);
    }
    
    public func getComponentID() -> String
    {
        return componentID;
    }
    
    public func setComponentValue(value: String)
    {
        titleLabel?.text = value;
    }
    
    public func setOnClick(onClick: @escaping ()-> Void)-> Void
    {
        onButtonClick = onClick;
    }
    
    func onClick(_ sender: Any)-> Void
    {
        onButtonClick?();
    }
}
