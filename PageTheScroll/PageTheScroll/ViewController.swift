//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Shashank.Rao on 10/17/16.
//  Copyright © 2016 Shashank.Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {



    @IBOutlet weak var scrollView: UIScrollView!
    
   
    var currentPage:Int = 0
    
    var images = [UIImageView]()
    

    @IBAction func swiped(_ sender: AnyObject) {
        
        if let swipeGesture = sender as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    //scrollView.scr
                    print("Swiped right")
                    scrollView.mov
                case UISwipeGestureRecognizerDirection.left:
                    print("Swiped left")
                default:
                    break
                }
            }
        
    }
    

    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.size.width)
        
      
         print("Current page \(currentPage)" )
    }

    func moveScrollView(direction: Int){
        currentPage = currentPage + direction
        let point: CGPoint = CGPoint(x: scrollView.frame.size.width * CGFloat(currentPage), y: 0.0)
        scrollView.setContentOffset(point, animated: true)
        
        // Create a animation to increase the actual icon on screen
        UIView.animate(withDuration: 0.4){
            self.images[self.currentPage].transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
            
            // Revert icon size of the non-active pages
            for x in 0..<self.images.count {
                if (x != self.currentPage) {
                    self.images[x].transform = CGAffineTransform.identity
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        var contentWidth: CGFloat = 0.0
        for x in 0...2{
            let image = UIImage(named:"icon\(x).png")
            let imageView = UIImageView(image: image);
            images .append(imageView)
            
            
            var newX: CGFloat = 0.0
            newX = scrollView.frame.size.width/2 + scrollView.frame.size.width * CGFloat(x)
            contentWidth += newX
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x:newX-75,y:(scrollView.frame.size.height/2)-75,width:150,height:150)
            
        }
        
        //scrollView.backgroundColor = UIColor.purple
        scrollView.contentSize = CGSize(width:contentWidth, height:view.frame.size.height)
        scrollView.clipsToBounds=false;
    }


}

