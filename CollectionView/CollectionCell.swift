//
//  CollectionCell.swift
//  CollectionView
//
//  Created by sam on 2020/09/22.
//

import UIKit

class CollectionCell: UICollectionViewCell {

@IBOutlet weak var categoryBtn: UIButton!
  
    
    
    override var isSelected: Bool {
            didSet {
              
                if isSelected{
                    categoryBtn.backgroundColor = .blue
                    backgroundColor = .blue
                }else{
                    categoryBtn.backgroundColor = .white
                    backgroundColor = .orange
                }

            }
        }
}
