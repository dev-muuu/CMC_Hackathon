//
//  WritePostViewController.swift
//  Hackathon
//
//  Created by 양채연 on 2022/09/25.
//

import UIKit
import SnapKit
import Then

class WritePostViewController: UIViewController {
    
    // MARK: - Property
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    final lazy var editTitle: UITextField = {
        let title = UITextField()
        title.placeholder = "제목을 입력하세요."
        title.font = UIFont.notosans(size: 20, family: .Bold)
       
        return title
    }()
    
    private lazy var underLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.systemGray
        
        return lineView
    }()
    
    final lazy var editContent: UITextField = {
        let content = UITextField()
        content.placeholder = "내용을 입력하세요."
        content.font = UIFont.notosans(size: 18, family: .Regular)
        
        return content
    }()
    
    // MARK: - Function

    func setUpView() {
        self.view.addSubview(baseView)
        baseView.addSubview(editTitle)
        baseView.addSubview(underLineView)
        baseView.addSubview(editContent)
    }
    
    func setUpConstraint() {
        baseView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        editTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(30)
        }
        
        underLineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(editTitle.snp.bottom).offset(3.0)
            $0.leading.equalTo(editTitle.snp.leading)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        editContent.snp.makeConstraints {
            $0.top.equalTo(editTitle.snp.bottom).offset(10)
            $0.leading.equalTo(editTitle)
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpConstraint()
    }
    

}

private extension WritePostViewController {
    func setUpNavigationBar() {
        let cancelButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeView))
        cancelButton.tintColor = .black
        navigationItem.leftBarButtonItem = cancelButton
        

        let didButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(didEditProfile))

        didButton.tintColor = .black
        navigationItem.rightBarButtonItem = didButton
    }
    
    @objc func closeView(){
        dismiss(animated: true)
    }
    
    @objc func didEditProfile(){
        print("upload")
        dismiss(animated: true)
    }
    
}
