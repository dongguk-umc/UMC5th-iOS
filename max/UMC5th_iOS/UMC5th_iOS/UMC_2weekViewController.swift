
import UIKit

class UMC_2weekViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var productList : [Product] = [
        Product(name: "에어팟 맥스", image: "max1", location: "서울시 성북구", howMuch: "490,000원"),
        Product(name: "에어팟 맥스 검정색", image: "max2", location: "서울시 성북구", howMuch: "370,000원"),
        Product(name: "에어팟 맥스 플박", image: "max3", location: "서울시 중구", howMuch: "550,000원"),
        Product(name: "양파", image: "max5", location: "서울시 중구", howMuch: "100,000원"),
        Product(name: "메가 하이볼", image: "max4", location: "서울시 성북구", howMuch: "4,000원"),
       ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
               
        self.collectionView.collectionViewLayout = createCompositionalLayout()
    }

}

extension UMC_2weekViewController{
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout {
        // 콤포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout{
            // 만들게 되면 튜플 (키: 값, 키: 값) 의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute 는 고정값, estimated 는 추측, fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 20, trailing: 2)
            
            // 변경할 부분
            let groupHeight =  NSCollectionLayoutDimension.fractionalWidth(1/2)
            
            // 그룹사이즈
            let grouSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹사이즈로 그룹 만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: grouSize, subitems: [item, item, item])
            
            // 변경할 부분
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: grouSize, subitem: item, count: 1)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .groupPaging
            
            // 섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0)
            return section
        }
        return layout
    }
}


extension UMC_2weekViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        let product : Product = productList[indexPath.item]
        
        cell.image.image = UIImage(named: product.image
                                   
        )
        cell.name.text = product.name
        cell.location.text = product.location
        cell.price.text = product.howMuch
        
        return cell
    }
    
}
