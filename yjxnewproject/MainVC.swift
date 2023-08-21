//
//  NewVC.swift
//  yjxnewproject
//
//  Created by 闫继祥 on 2019/8/27.
//  Copyright © 2019 闫继祥. All rights reserved.
//

import UIKit


class MainVC: UIViewController ,UITableViewDelegate, UITableViewDataSource{
   
    
    
    
    var tableView:UITableView!
    var dataArray = NSMutableArray.init()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("--------000-----%f",self.tableView.frame.size.height);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), style: .plain)
        // Do any additional setup after loading the view.
        tableView.dataSource = self;
        tableView.register(MainTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.delegate = self;
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = UIEdgeInsets.zero
        // 设置预估行高 --> 先让 tableView 能滚动，在滚动的时候再去计算显示的 cell 的真正的行高，并且调整 tabelView 的滚动范围
        tableView.estimatedRowHeight = 30
        view.addSubview(tableView)
       
        self.getDta()
    }
    
    func getDta(){
        for _ in 0..<10 {
            let model = DataModel.init()
            model.headerIconStr = "zhanweitu"
            model.nameStr = "小刚"
            model.timeStr = "2019-09-08"
            model.levelStr = "知名博主"
            model.titleStr = "我是标题"
            model.detailStr = "我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述我是详细描述"
            model.imgArray = ["zhanweitu","zhanweitu","zhanweitu","zhanweitu","zhanweitu","zhanweitu","zhanweitu"];
            self.dataArray.add(model)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model:DataModel = self.dataArray[indexPath.row] as! DataModel
   
        let cell : MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        
        cell.getValue(model: model)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100;
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
