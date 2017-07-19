//
//  ListImage.swift
//  vpn
//
//  Created by 张灏 on 2017/7/4.
//  Copyright © 2017年 张灏. All rights reserved.
//

import Foundation

class ListImage: UIImageView, ListComponent
{
    @IBInspectable var componentID: String = "";
    
    override func draw(_ rect: CGRect) {
        super.draw(rect);
        if(ListCell.registerToListCell(id: getComponentID(), component: self) == nil)
        {
            print("\(self) can not find ListCell in its parent views");
        }
    }
    
    public func getComponentID() -> String
    {
        return componentID;
    }
    
    public func setComponentValue(value: String)
    {
        if(value != "")
        {
            CommonUtil.Instance.loadImageFrom(url: value, onLoadFinish: {image in
                self.image = image;
            });
        }
    }
}
