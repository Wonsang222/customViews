//
//  TransitionViewController.swift
//  practice
//
//  Created by Wonsang Hwang on 2/19/25.
//

import UIKit

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        return PresentTransitionAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        return nil
    }
}


class PresentTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let homeVC = transitionContext.viewController(forKey: .from) as! ViewController
        let detailVC = transitionContext.viewController(forKey: .to) as! DetailViewController
        
        let homeImgFrame = homeVC.selectedImageFrame
        let homeImage = homeVC.selectedImage
        let homeLabelFrame = homeVC.selectedLabelFrame
        
        containerView.backgroundColor = .white
        homeVC.view.alpha = 0
        detailVC.view.alpha = 0
        
        let imageView = UIImageView(image: homeImage)
        imageView.frame = homeImgFrame!
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        containerView.addSubview(imageView)
        
        let mylabel = UILabel(frame: homeLabelFrame!)
        mylabel.text = homeVC.selectedString
        
        containerView.addSubview(mylabel)
        
        let detailImageFrame = detailVC.bigImageView.frame
        
        let duration = transitionDuration(using: transitionContext)
        containerView.addSubview(detailVC.view)
        
        // addsubview 이건 비동기 처리함.. 그래서 다음 코드가 먼저 실행됨
        detailVC.view.layoutIfNeeded()
        // 레이아웃 갱신하고 뭔갈 해야할때 사용함
        
        detailVC.view.alpha = 0
        UIView.animate(withDuration: duration) {
            imageView.frame = detailImageFrame
            mylabel.frame = detailVC.detailLabel.frame
        } completion: { _ in
            homeVC.view.alpha = 1
            imageView.removeFromSuperview()
            mylabel.removeFromSuperview()
            detailVC.view.alpha = 1
            transitionContext.completeTransition(true)
        }
        
        
    }
    
    
}
