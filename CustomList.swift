//
//  CustomList.swift
//  vpn
//
//  Created by 张灏 on 2017/7/4.
//  Copyright © 2017年 张灏. All rights reserved.
//

import Foundation

class CustomList: UITableView, UITableViewDataSource
{
    @IBInspectable var cellNibName: String = "";
    @IBInspectable var cellHeight: CGFloat = 128;
    
    private var listData: [[String: String]] = [];
    
    private var onCellClick: ((Int, String)-> Void)?;
    
    override func draw(_ rect: CGRect)
    {
        super.draw(rect);
        if(cellNibName != "")
        {
            self.register(UINib.init(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellNibName);
            self.rowHeight = cellHeight;
            self.dataSource = self;
        }
    }
    
    public func addCellData(data: [String: String])-> Void
    {
        listData.append(data);
    }
    
    public func getCellData(index: Int)-> [String: String]?
    {
        if(index >= 0 && listData.count > index)
        {
            return listData[index];
        }
        return nil
    }
    
    public func clearData()-> Void
    {
        listData.removeAll();
    }
    
    public func mdfCellData(index: Int, data: [String: String])-> Void
    {
        return;
        if(index >= 0 && listData.count > index)
        {
            listData[index] = data;
            let cell: ListCell = self.dequeueReusableCell(withIdentifier: cellNibName, for: IndexPath.init(item: index, section: index)) as! ListCell;
            if(cell.isLoaded())
            {
                cell.setCellValues(dicValues: data);
                cell.setOnClick(onClick: {componentID in
                    self.onCellClick?(index, componentID);
                });
            }
        }
    }
    
    public func setOnCellClickListener(onClick: @escaping (Int, String)-> Void)-> Void
    {
        onCellClick = onClick;
    }
    
    public func reloadCell()-> Void
    {
        reloadData();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return listData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: ListCell = tableView.dequeueReusableCell(withIdentifier: cellNibName, for: indexPath) as! ListCell;
        cell.setCellValues(dicValues: listData[indexPath.row]);
        cell.setOnClick(onClick: {componentID in
            self.onCellClick?(indexPath.row, componentID);
        });
        return cell;
    }
}
