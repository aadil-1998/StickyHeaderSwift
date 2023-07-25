//
//  HeaderViewController.swift
//  DemoPi
//
//  Created by 2022M19 on 24/07/23.
//

import UIKit

class HeaderViewController: UIViewController {

    //MARK: - Outlet
    
    
    //------------------------------------------------------
    
    //MARK: - Class Variable
    
    private let viewModel = ViewModel()
    var lastProgress: CGFloat = .zero
    var lastMinHeaderHeight: CGFloat = .zero
    var covernitialHeight: CGFloat!
    var stickyCover = true


    //------------------------------------------------------
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupViewModelObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.update(with: lastProgress, minHeaderHeight: lastMinHeaderHeight)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //------------------------------------------------------
    
    //MARK: - Memory Management Method
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        debugPrint("‼️‼️‼️ deinit : \(self) ‼️‼️‼️")
    }
    
    //------------------------------------------------------
    
    //MARK: - Custom Method
    
    /**
     Basic view setup of the screen.
     */
    private func setUpView() {
        self.applyStyle()
    }
    
    private func applyStyle(){
        
    }
    
    func update(with progress: CGFloat, minHeaderHeight: CGFloat){
        lastProgress = progress
        lastMinHeaderHeight = minHeaderHeight
        
        let y = progress * (view.frame.height - minHeaderHeight)
        
        guard covernitialHeight != nil else {
            return
        }
           
        let topLimit = covernitialHeight - minHeaderHeight
        if y > topLimit{
            if stickyCover{
                self.stickyCover = false
            }
        }else{
            let scale = min(1, (1-progress*1.3))
            let t = CGAffineTransform(scaleX: scale, y: scale)
            
            if !stickyCover{
                self.stickyCover = true
            }
        }
    }

    
    /**
     Setup all view model observer and handel data and erros.
     */
    private func setupViewModelObserver() {
        // Result binding observer
    }
    
    //------------------------------------------------------
    
    //MARK: - Action Method
    
    
    //------------------------------------------------------
}

