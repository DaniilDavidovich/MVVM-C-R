import UIKit

class OnboardingViewController: UIViewController {
    
    var endOnboarding: () -> () = { }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var viewOne: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var viewTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var viewThree: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("End Onboarding", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupScrollView()
        setupLayout()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(viewOne)
        contentView.addSubview(viewTwo)
        contentView.addSubview(viewThree)
        viewThree.addSubview(button)
    }
    
    private func setupLayout() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView).multipliedBy(3)
        }
        
        viewOne.snp.makeConstraints { make in
            make.top.leading.bottom.height.equalToSuperview()
            make.width.height.equalTo(scrollView)
        }
        
        viewTwo.snp.makeConstraints { make in
            make.leading.equalTo(viewOne.snp.trailing)
            make.top.width.height.equalTo(scrollView)
        }
        
        viewThree.snp.makeConstraints { make in
            make.leading.equalTo(viewTwo.snp.trailing)
            make.top.width.height.equalTo(scrollView)
        }
        
        button.snp.makeConstraints { make in
            make.center.equalTo(viewThree)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
    }
    
    @objc
    func buttonTapped() {
        endOnboarding()
    }
}
