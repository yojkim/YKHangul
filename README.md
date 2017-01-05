## Usage

* Create an YKHangul class in any swift file

```swift
class ViewController {

    // Create UILabel
    @IBOutlet var stringLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangulSystem = YKHangul()
        
        /* result = ㅇㄴㅎㅅㅇ ㅈㄴ yojkim ㅇㄴㄷ. */
        stringLabel.text = hangulSystem.getStringConsonant(string: "안녕하세요 저는 yojkim 입니다.",
                                                           consonantType: .Initial)
    }
}
```

* You can use different type of consonant

```
.Initial // 초성
.Medial  // 중성 
.Final   // 종성
```

* Character except Korean represents originally
