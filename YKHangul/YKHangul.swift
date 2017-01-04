//
//  YKHangul.swift
//  
//
//  Created by yojkim on 2017. 1. 4..
//  Copyright ©2017 Yong Jae Kim. All rights reserved.
//

import Foundation

public class YKHangul {
    
    private let startOfHangul: UInt32 = 44032 // 한글 유니코드 시작값
    private let endOfHangul: UInt32 = 55215   // 한글 유니코드 끝값
    
    private let initialConsonantArray = [
        "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"
    ]
    private let medialConsonantArray = [
        "ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"
    ]
    private let finalConsonantArray = [
        " ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"
    ]
    
    public enum ConsonantType {
        case Initial    // 초성
        case Medial     // 중성
        case Final      // 종성
    }
    
    public func getStringConsonant(string: String, consonantType: ConsonantType) -> String {
        
        return self._extractConsonantValue(string: string, consonantType: consonantType)
        
    }
    
    private func _extractConsonantValue(string: String, consonantType: ConsonantType) -> String {
        
        var resultString = String()
        
        for unicode in string.unicodeScalars {
            let currentUnicodeValue = unicode.value
            
            // 유니코드 값이 한글 범위인 경우
            if ( startOfHangul <= currentUnicodeValue &&
                endOfHangul >= currentUnicodeValue ) {
                
                var currentCharacter: String!
                
                switch consonantType {
                case .Initial:
                    currentCharacter = initialConsonantArray[Int(((currentUnicodeValue - startOfHangul) / 28) / 21)]
                    break
                case .Medial:
                    currentCharacter = medialConsonantArray[Int(((currentUnicodeValue - startOfHangul) / 28) % 21)]
                    break
                case .Final:
                    currentCharacter = finalConsonantArray[Int((currentUnicodeValue - startOfHangul) % 28)]
                    break
                }
                
                resultString.append(currentCharacter)
                
            } else { // 유니코드 값이 한글 범위가 아닌 경우
                if let scalar = UnicodeScalar(currentUnicodeValue) {
                    resultString.append(Character(scalar))
                }
            }
        }
        
        return resultString
    }
    
}


