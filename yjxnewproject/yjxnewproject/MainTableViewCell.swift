//
//  NewTableViewCell.swift
//  yjxnewproject
//
//  Created by 闫继祥 on 2019/8/27.
//  Copyright © 2019 闫继祥. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell ,UICollectionViewDataSource,UICollectionViewDelegate,SDPhotoBrowserDelegate{
    
    var imgArr : NSArray?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //去掉选中样式
        self.selectionStyle =  UITableViewCell.SelectionStyle.none
        self.contentView.addSubview(headerIcon)
        self.contentView.addSubview(nameL)
        self.contentView.addSubview(titleL)
        self.contentView.addSubview(detailL)
        self.contentView.addSubview(levelL)
        self.contentView.addSubview(timeL)
        self.contentView.addSubview(collectionView)
        
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        headerIcon.mas_makeConstraints { (make:MASConstraintMaker!) in
            
            make.left.mas_equalTo()(10);
            make.top.mas_equalTo()(15);
            make.width.mas_equalTo()(50);
            make.height.mas_equalTo()(50);
            
        }
        
        timeL.mas_makeConstraints { (make:MASConstraintMaker!) in
            
            make.right.mas_equalTo()(self.contentView.mas_right)?.offset()(-10);
            make.top.mas_equalTo()(15);
            make.width.mas_equalTo()(120);
            make.height.mas_equalTo()(20);
            
        }
        
        nameL.mas_makeConstraints { (make:MASConstraintMaker!) in
            
            make.left.mas_equalTo()(self.headerIcon.mas_right)?.offset()(10);
            make.top.mas_equalTo()(15);
            make.width.mas_equalTo()(self.contentView.bounds.size.width-self.headerIcon.bounds.size.width-30-self.timeL.bounds.size.width);
            make.height.mas_equalTo()(20);
            
        }
        
        
        levelL.mas_makeConstraints { (make:MASConstraintMaker!) in
            
            make.left.mas_equalTo()(self.headerIcon.mas_right)?.offset()(10);
            make.top.mas_equalTo()(self.nameL.mas_bottom)?.offset()(10);
            make.width.mas_equalTo()(self.contentView.bounds.size.width-self.headerIcon.bounds.size.width-30);
            make.height.mas_equalTo()(20);
            
        }
        
        
        
        titleL.mas_makeConstraints { (make:MASConstraintMaker!) in
            
            make.left.mas_equalTo()(self.contentView.mas_left)?.offset()(10);
            make.right.mas_equalTo()(self.contentView.mas_right)?.offset()(-10);
            make.top.mas_equalTo()(self.headerIcon.mas_bottom)?.offset()(15);
            
        }
        
        detailL.mas_makeConstraints { (make:MASConstraintMaker!) in
            
            make.left.mas_equalTo()(self.contentView.mas_left)?.offset()(10);
            make.right.mas_equalTo()(self.contentView.mas_right)?.offset()(-10);
            make.top.mas_equalTo()(self.titleL.mas_bottom)?.offset()(15);
            
        }
        
        collectionView.mas_makeConstraints { (make:MASConstraintMaker!) in
            
            make.top.mas_equalTo()(self.detailL.mas_bottom)?.offset()(15);
            make.bottom.mas_equalTo()(self.contentView.mas_bottom)?.offset()(-15);
            
            make.width.mas_equalTo()(UIScreen.main.bounds.size.width);
            
            make.height.equalTo()(1.0)?.priority()
        }
        
        super.updateConstraints()
    }
    
    func getValue(model:DataModel) -> Void {
        headerIcon.image = UIImage(named: model.headerIconStr ?? "zhanweitu")
        nameL.text = model.nameStr
        timeL.text = model.timeStr
        titleL.text = model.titleStr
        detailL.text = model.detailStr
        
        //字间距
        titleL.setColumnSpace(2.0)
        
        //行间距
        detailL.setRowSpace(10.0)
        //字间距
        detailL.setColumnSpace(2.0)
        levelL.text = model.levelStr
        self.imgArr = model.imgArray
        self.reloadCell()
    }
    
    //刷新collectionview
    func reloadCell(){
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        self.collectionView.setNeedsLayout()
        collectionView.mas_updateConstraints { (make:MASConstraintMaker!) in
            
            make.height.equalTo()(self.collectionView.collectionViewLayout.collectionViewContentSize.height)
        }
    }
    
    //头像
    lazy var headerIcon : UIImageView = {
        var img = UIImageView()
        img = UIImageView.init(frame: CGRect.zero)
        img.backgroundColor = UIColor.white
        img.clipsToBounds = true
        img.layer.cornerRadius = 25
        return img
    }()
    
    //昵称
    lazy var nameL : UILabel = {
        var nameLabel = UILabel()
        nameLabel = UILabel.init(frame: CGRect.zero)
        nameLabel.backgroundColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        return nameLabel
    }()
    
    //等级描述
    lazy var levelL : UILabel = {
        var levelLabel = UILabel()
        levelLabel = UILabel.init(frame: CGRect.zero)
        levelLabel.backgroundColor = UIColor.white
        levelLabel.font = UIFont.systemFont(ofSize: 13)
        levelLabel.textColor = UIColor.lightGray
        return levelLabel
    }()
    
    //时间
    lazy var timeL : UILabel = {
        var timeLabel = UILabel()
        timeLabel = UILabel.init(frame: CGRect.zero)
        timeLabel.backgroundColor = UIColor.white
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        timeLabel.textColor = UIColor.lightGray
        timeLabel.textAlignment = NSTextAlignment.right
        return timeLabel
    }()
    
    //标题
    lazy var titleL : UILabel = {
        var titleLabel = UILabel()
        titleLabel = UILabel.init(frame: CGRect.zero)
        titleLabel.backgroundColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return titleLabel
    }()
    
    //详细描述
    lazy var detailL : UILabel = {
        var detailLabel = UILabel()
        detailLabel = UILabel.init(frame: CGRect.zero)
        detailLabel.backgroundColor = UIColor.white
        detailLabel.font = UIFont.systemFont(ofSize: 15)
        detailLabel.numberOfLines = 0;
        return detailLabel
    }()
    
    //图片
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: ((UIScreen.main.bounds.size.width) - (5*10))/4, height: ((UIScreen.main.bounds.size.width) - (5*10))/4)
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:1.0), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImgCollectionViewCell.classForCoder(), forCellWithReuseIdentifier:"cell")
        
        
        return collectionView
        
    }()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imgArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ImgCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImgCollectionViewCell
        let imgStr:String = imgArr?[indexPath.item] as! String
        cell.img.image = UIImage.init(named: imgStr)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let browser = SDPhotoBrowser()
        
        //显示图片UIImageView的父控件
        browser.sourceImagesContainerView =  self.collectionView
        
        //显示图片的总数量
        browser.imageCount = self.imgArr?.count ?? 0
        
        //
        if self.imgArr?.count ?? 0 > (indexPath.item) {
            browser.currentImageIndex = (indexPath.item)
        }
        else
        {
            //要显示的当前图片下标位置
            browser.currentImageIndex = 0
        }
        
        browser.delegate = self
        browser.show()
        
    }
    
    //返回当前UIImageView显示的图片
    func photoBrowser(_ browser: SDPhotoBrowser!, placeholderImageFor index: Int) -> UIImage! {
        
      
        let imageView = UIImage.init(named: "zhanweitu")
            
        return imageView
        
        
    }
    
    //设置要显示图片资源的地址
//    func photoBrowser(_ browser: SDPhotoBrowser!, highQualityImageURLFor index: Int) -> URL! {
//
//        let model = self.imgArr?[index]
//
//        let url = URL(string: model.storeBigImg!)
//
//        return url
//
//    }
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
