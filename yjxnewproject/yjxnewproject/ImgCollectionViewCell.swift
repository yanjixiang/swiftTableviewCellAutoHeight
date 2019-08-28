//
//  ImgCollectionViewCell.swift
//  yjxnewproject
//
//  Created by 闫继祥 on 2019/8/28.
//  Copyright © 2019 闫继祥. All rights reserved.
//

import UIKit

class ImgCollectionViewCell: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        
        self.addSubview(img)
        
        img.mas_makeConstraints { (make:MASConstraintMaker!) in
            
            make.left.top()?.right()?.bottom().mas_equalTo()(0);
           
        }
    }
    
    
    lazy var img : UIImageView = {
        var imgView = UIImageView()
        imgView = UIImageView.init(frame: CGRect.zero)
        imgView.backgroundColor = UIColor.white
        return imgView
    }()
    
}
