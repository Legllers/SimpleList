//
//  ListComponent.swift
//  vpn
//
//  Created by 张灏 on 2017/7/4.
//  Copyright © 2017年 张灏. All rights reserved.
//

import Foundation

public protocol ListComponent
{
    func setComponentValue(value: String)-> Void;
    func getComponentID()-> String;
}
