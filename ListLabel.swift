//
//  ListLabel.swift
//  vpn
//
//  Created by 张灏 on 2017/7/4.
//  Copyright © 2017年 张灏. All rights reserved.
//

import Foundation

class ListLabel: UILabel, ListComponent
{
    @IBInspectable var componentID: String = "";
    
    var content: String = "111";
    
    override func draw(_ rect: CGRect) {
        super.draw(rect);
        
        if(ListCell.registerToListCell(id: getComponentID(), component: self) == nil)
        {
            print("\(self) can not find ListCell in its parent views");
        }
    }
    
    public func setComponentValue(value: String)
    {
        DispatchQueue.main.async{
            self.text = value;
        };
    }
    
    public func getComponentID() -> String
    {
        return componentID;
    }
}
