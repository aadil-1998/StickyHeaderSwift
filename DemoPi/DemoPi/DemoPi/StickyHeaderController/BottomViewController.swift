//
//  BottomViewController.swift
//  DemoPi
//
//  Created by 2022M19 on 24/07/23.
//

import UIKit

class BottomViewController: UIViewController,PagerAwareProtocol {
    
    
    //MARK: - Outlet
    @IBOutlet weak var vwPageView: CommonPageView!
    @IBOutlet weak var segMenu: SegmentedControllerClass!
    //------------------------------------------------------
    
    //MARK: - Class Variable
    
//    private let viewModel = ViewModel()
    var pageDelegate: BottomPageDelegate?

    var selectedIndex: Int = 0 {
        didSet {
//            self.viewModel.updateRows(self.selectedIndex)
            self.vwPageView.setViewController(index: self.selectedIndex)
//            self.colType.reloadData()
//            self.colType.scrollToItem(at: IndexPath(item: self.selectedIndex, section: 0), at: .centeredHorizontally, animated: true)
            pageDelegate?.tp_pageViewController(self.vwPageView.arrViewController[self.selectedIndex], didSelectPageAt: self.selectedIndex)
        }
    }


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
        
        pageDelegate?.tp_pageViewController(self.vwPageView.arrViewController[self.selectedIndex], didSelectPageAt: self.selectedIndex)
    }
    
    private func applyStyle(){
        
        self.vwPageView.setUpView()
        //guard let details = self.viewModel.collegeDetails.value else {return}
        
        let vc = ListViewController.instantiate(fromAppStoryboard: .MainStoryBoard)
        vc.color = .brown
        let vc1 = ListViewController.instantiate(fromAppStoryboard: .MainStoryBoard)
        vc1.color = .cyan
        let vc2 = ListViewController.instantiate(fromAppStoryboard: .MainStoryBoard)
        vc2.color = .magenta
        
        self.vwPageView.arrViewController = [vc,vc1,vc2]
        self.vwPageView.delegate = self
        self.vwPageView.setViewController(index: self.selectedIndex)
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

//------------------------------------------------------
//MARK: - BottomViewController
extension BottomViewController {
    
    var currentViewController: UIViewController?{
        return self.vwPageView.arrViewController[self.selectedIndex]
    }
    
    var pagerTabHeight: CGFloat?{
        return 44
    }
}

//------------------------------------------------------
//MARK: - CommonPageDelegate
extension BottomViewController: CommonPageProtocol {
    func scrollingDidEnd(index: Int) {
        self.selectedIndex = index
        self.segMenu.selectedSegmentIndex = index
    }
}
