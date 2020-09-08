

import Foundation
import UIKit


extension String {
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
    // 编码
    func base64Encoding()->String
    {
        let plainData = self.data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return base64String!
        
    }
    
    /**
     
     *   解码
     
     */
    
    func base64Decoding()->String
    {
        let decodedData = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        let decodedString = NSString(data: decodedData! as Data, encoding: String.Encoding.utf8.rawValue)! as String
        return decodedString
        
    }
   
    
}


extension String {
    func toDictionary() -> [String:AnyObject]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)]) as? [String:AnyObject]
            } catch let error as NSError {
                MLog(error)
            }
        }
        return nil
    }
    
  

    var yep_embeddedURLs: [NSURL] {

        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return []
        }

        var URLs = [NSURL]()

        detector.enumerateMatches(in: self, options: [], range: NSMakeRange(0, (self as NSString).length)) { result, flags, stop in

            if let URL = result?.url {
                URLs.append(URL as NSURL)
            }
        }
        
        return URLs
    }
}
//MARK:字符串操作
extension String {
    /// 截取第一个到第任意位置
    ///
    /// - Parameter end: 结束的位值
    /// - Returns: 截取后的字符串
    func stringCut(end: Int) ->String{
        if end <= 0 || self.count == 0 {
            return ""
        }
        let i = end < self.count ? end : self.count-1
        
      
        let sInde = index(startIndex, offsetBy: i)
        return String(self[..<sInde])
    }
//    let newStr = String(str[..<index]) // = str.substring(to: index) In Swift 3
//    let newStr = String(str[index...]) // = str.substring(from: index) In Swif 3
//    let newStr = String(str[range]) // = str.substring(with: range) In Swift 3
    
    /// 截取任意位置到结束
    ///
    /// - Parameter end:
    /// - Returns: 截取后的字符串
    func stringCutToEnd(star: Int) -> String {
        if star <= 0 {
            return ""
        }
        if !(star < self.count) { return "" }
        let sRang = index(startIndex, offsetBy: star)..<endIndex
        return  String(self[sRang])
    }
    
    /// 字符串任意位置插入
    ///
    /// - Parameters:
    ///   - content: 插入内容
    ///   - locat: 插入的位置
    /// - Returns: 添加后的字符串
    func stringInsert(content: String,locat: Int) -> String {
        if locat <= 0 {
            return ""
        }
        if !(locat < self.count) { return "" }
        let str1 = stringCut(end: locat)
        let str2 = stringCutToEnd(star: locat)
        return str1 + content + str2
    }
    
    /// 计算字符串的尺寸
    ///
    /// - Parameters:
    ///   - text: 字符串
    ///   - rectSize: 容器的尺寸
    ///   - fontSize: 字体
    /// - Returns: 尺寸
    func  getStringSize( rectSize: CGSize,fontSize: UIFont) -> CGSize {
        let str = self as NSString
        let rect = str.boundingRect(with: rectSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:  fontSize], context: nil)
        return rect.size
    }
    
    
    /// 输入字符串 输出数组
    /// e.g  "qwert" -> ["q","w","e","r","t"]
    /// - Returns: ["q","w","e","r","t"]
    func stringToArr() -> [String] {
        let num = self.count
        if !(num > 0) { return [""] }
        var arr: [String] = []
        for i in 0..<num {
            let tempStr: String = self[self.index(self.startIndex, offsetBy: i)].description
            arr.append(tempStr)
        }
        return arr
    }
    
    /// 字符串截取         3  6
    /// e.g let aaa = "abcdefghijklmnopqrstuvwxyz"  -> "cdef"
    /// - Parameters:
    ///   - start: 开始位置 3
    ///   - end: 结束位置 6
    /// - Returns: 截取后的字符串 "cdef"
    func startToEnd(start: Int,end: Int) -> String {
        if start <= 0 || end <= 0 {
            return ""
        }
        if !(end < self.count) || start > end { return "取值范围错误" }
        var tempStr: String = ""
        for i in start...end {
            let temp: String = self[self.index(self.startIndex, offsetBy: i - 1)].description
            tempStr += temp
        }
        return tempStr
    }
    
    /// 字符URL格式化
    ///
    /// - Returns: 格式化的 url
    func stringEncoding() -> String {
        let url = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        return url!
    }
    
    func countInt()->Int
    {
        if self.count == 0 {
            return 0
        }
        var number = 0
        for i in 0...self.count - 1 {
            let c: unichar = (self as NSString).character(at: i)
            
            if (c >= 0x4E00) {
                number += 2
            }else {
                number += 1
            }
        }
        return number
    }
    
    func CGFloatValue() -> CGFloat? {
       
        guard let doubleValue = Double(self) else {
            return 0.0
        }
        
        return CGFloat(doubleValue)
    }
    
}



