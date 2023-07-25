//
//  MainViewController.swift
//  DemoPi
//
//  Created by 2022M19 on 24/07/23.
//

import UIKit

class MainViewController: UIViewController,TPDataSource,TPProgressDelegate {

    //MARK: - Outlet
    
    
    //------------------------------------------------------
    
    //MARK: - Class Variable
    
    private let viewModel = ViewModel()
    var headerVC: HeaderViewController!
    var bottomVC: BottomViewController!
    //------------------------------------------------------
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupViewModelObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        
        DispatchQueue.main.async {
            self.tp_configure(with: self, delegate: self)
        }
    }
    
    private func applyStyle(){
        
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
    
    func headerViewController() -> UIViewController {
        headerVC = HeaderViewController.instantiate(fromAppStoryboard: .MainStoryBoard)
        return headerVC!

    }
    
    func bottomViewController() -> UIViewController & PagerAwareProtocol {
        self.bottomVC = BottomViewController.instantiate(fromAppStoryboard: .MainStoryBoard)
        return self.bottomVC
    }
    
    func minHeaderHeight() -> CGFloat {
        return (topInset + 0)
    }
    
    func tp_scrollView(_ scrollView: UIScrollView, didUpdate progress: CGFloat) {
        headerVC?.update(with: progress, minHeaderHeight: minHeaderHeight())

    }
    
    func tp_scrollViewDidLoad(_ scrollView: UIScrollView) {
        print("")
    }
}


