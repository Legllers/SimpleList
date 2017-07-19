//
//  ListCell.swift
//  vpn
//
//  Created by 张灏 on 2017/7/4.
//  Copyright © 2017年 张灏. All rights reserved.
//

import Foundation

class ListCell: UITableViewCell
{
    private var dicComponents: [String: ListComponent] = [:];
    private var loaded: Bool = false;
    private var cellData: [String: String]?;
    
    private var onCellClick: ((String)-> Void)?;
    
    override func draw(_ rect: CGRect)
    {
        super.draw(rect);
    }
    
    public func isLoaded()-> Bool
    {
        return loaded;
    }
    
    public func setCellValues(dicValues: [String: String])-> Void
    {
        cellData = dicValues;
        for (key, value) in dicValues
        {
            if(dicComponents[key] != nil)
            {
                dicComponents[key]?.setComponentValue(value: value);
            }
        }
    }
    
    public func setOnClick(onClick: @escaping (String)-> Void)-> Void
    {
        onCellClick = onClick;
    }
    
    public static func registerToListCell(id: String, component: UIView)-> ListCell?
    {
        if(component is ListComponent)
        {
            var parentView: UIView? = component.superview;
            while (parentView != nil)
            {
                if(parentView is ListCell)
                {
                    (parentView as! ListCell).registerComponent(id: id, component: component as! ListComponent);
                    return (parentView as! ListCell);
                }
                else
                {
                    parentView = parentView?.superview;
                }
            }
        }
        return nil;
    }
    
    private func registerComponent(id: String, component: ListComponent)-> Void
    {
        dicComponents[id] = component;
        if(cellData != nil)
        {
            component.setComponentValue(value: cellData![id] ?? "");
            if(component is ListButton)
            {
                (component as! ListButton).setOnClick(onClick: {
                    self.onCellClick?(id);
                });
            }
        }
    }
}
