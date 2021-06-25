//
//  ViewController.swift
//  CollectionView
//
//  Created by sam on 2020/09/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var collectionView : UICollectionView!
    
    var CategoryArr = ["다이어트" , "근육량 증가", "체력 증진" , "자세교정", "체력 증진" , "자세교정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("뷰시작")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
       // self.collectionView.allowsMultipleSelection = true
        self.collectionView.isScrollEnabled = true
     //   self.collectionView.isPagingEnabled = true
   
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var i = 0
        if indexPath.row == 1 {
            i = 10
        }
        return CGSize(width: 100+i, height: 50)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryArr.count//갯수
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier:"CollectionCell", for: indexPath) as! CollectionCell
        
        cell.categoryBtn.setTitle(CategoryArr[indexPath.row], for: .normal)
        
        cell.backgroundColor = .orange
   
        return cell
        
    }
    
    
    let w = UIScreen.main.bounds.width
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 2   {
            self.collectionView.setContentOffset(CGPoint(x: 175 / 2 , y:0), animated: true)
        }
        if indexPath.row == 3   {
            self.collectionView.setContentOffset(CGPoint(x: 175 , y:0), animated: true)
        }
        if indexPath.row >= 4 {
//            self.collectionView.setContentOffset(CGPoint(x: self.collectionView.frame.width , y:0), animated: true)
            self.collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }

        print("------\(indexPath.item)클릭했다")
        print("ok")
    }

    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier:"CollectionCell", for: indexPath) as? CollectionCell else {
                   return true
               }
               if cell.isSelected {
                collectionView.deselectItem(at: indexPath, animated: true)
                   return false
               } else {
                   return true
               }
    }
    
  
    
    
}


