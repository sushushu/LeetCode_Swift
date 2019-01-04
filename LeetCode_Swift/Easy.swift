//
//  Q771.swift
//  LeetCode_Swift
//
//  Created by softlipa on 2018/12/31.
//  Copyright © 2018年 softlipa. All rights reserved.
//

import Foundation


// https://leetcode-cn.com/problems/two-sum/
//给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
//
//你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
class Solution_1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map:[Int:Int] = [:]
        for (index,value) in nums.enumerated() {
            let tmpValue = target - value;
            if map[tmpValue] != nil {
                return [nums.index(of: tmpValue)!,index]
            }
            map[value] = tmpValue
        }
        return []
    }
}


// https://leetcode-cn.com/problems/jewels-and-stones/
//给定字符串J 代表石头中宝石的类型，和字符串 S代表你拥有的石头。 S 中每个字符代表了一种你拥有的石头的类型，你想知道你拥有的石头中有多少是宝石。
//
//J 中的字母不重复，J 和 S中的所有字符都是字母。字母区分大小写，因此"a"和"A"是不同类型的石头。
class Solution_771 {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let JArray = Array(J.characters) // 取出2个字符串的每一个字符存进数组
        let SArray = Array(S.characters)
        var res = 0

        if (J.count > 50) || (S.count > 50) {
            print("不能超过50个字符~")
            return 0
        } else {
            for j in SArray { // 遍历2个数组的元素进行比较
                for i in JArray {
                    if j == i {
                        print("命中了 \(i) == \(j)")
                        res += 1
                    }
                }
            }
            return res;
        }
    }
}


// https://leetcode-cn.com/problems/unique-email-addresses/
//每封电子邮件都由一个本地名称和一个域名组成，以 @ 符号分隔。
//
//例如，在 alice@leetcode.com中， alice 是本地名称，而 leetcode.com 是域名。
//
//除了小写字母，这些电子邮件还可能包含 ',' 或 '+'。
//
//如果在电子邮件地址的本地名称部分中的某些字符之间添加句点（'.'），则发往那里的邮件将会转发到本地名称中没有点的同一地址。例如，"alice.z@leetcode.com” 和 “alicez@leetcode.com” 会转发到同一电子邮件地址。 （请注意，此规则不适用于域名。）
//
//如果在本地名称中添加加号（'+'），则会忽略第一个加号后面的所有内容。这允许过滤某些电子邮件，例如 m.y+name@email.com 将转发到 my@email.com。 （同样，此规则不适用于域名。）
//
//可以同时使用这两个规则。
//
//给定电子邮件列表 emails，我们会向列表中的每个地址发送一封电子邮件。实际收到邮件的不同地址有多少？
class Solution_929 {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var tmpList = Array<String>()
        var resList = Array<String>()
        // 规则处理
        for email in emails {
            var prefix = String(email.split(separator: "@", maxSplits: 1, omittingEmptySubsequences: false)[0])
            let suffix = String(email.split(separator: "@", maxSplits: 1, omittingEmptySubsequences: false)[1])
            prefix = String(prefix.split(separator: "+", maxSplits: 1, omittingEmptySubsequences: false)[0]) // 碰到+号只取前面的部分
            prefix = prefix.replacingOccurrences(of: ".", with: "") // 碰到.号 去除
            tmpList.append("\(prefix)@\(suffix)") // 重组邮箱 加进数组做去重处理
        }
        // 去重处理
        for value in tmpList {
            if !resList.contains(value) {
                resList.append(value)
            }
        }
//        print(resList)
        return resList.count
    }
}


// https://leetcode-cn.com/problems/to-lower-case/
// 大写转小写
class Solution_709 {
    func toLowerCase(_ str: String) -> String {
        // return str.lowercased(with: nil)
        // return str.lowercased()
        return str.localizedLowercase
    }
}


// https://leetcode-cn.com/problems/sort-array-by-parity/
//给定一个非负整数数组 A，返回一个由 A 的所有偶数元素组成的数组，后面跟 A 的所有奇数元素。
//
//你可以返回满足此条件的任何数组作为答案。
class Solution_905 {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var evenNumber = Array<Int>()
        var unevenNumber = Array<Int>()
        for (_,value) in A.enumerated() {
            if value%2 == 0 { // 偶数
                evenNumber.append(value)
            } else {
                unevenNumber.append(value)
            }
        }
        evenNumber.append(contentsOf: unevenNumber)
        print(evenNumber)
        return evenNumber
    }
}


// https://leetcode-cn.com/problems/n-repeated-element-in-size-2n-array/
//在大小为 2N 的数组 A 中有 N+1 个不同的元素，其中有一个元素重复了 N 次。
//
//返回重复了 N 次的那个元素。
class Solution_961 {
    func repeatedNTimes(_ A: [Int]) -> Int {
        var tmp = Array<Int>()
        for (_,value) in A.enumerated() { // 由题可知必定有一个数重复了2次
            if tmp.contains(value) {
                // print(value)
                return value
            } else {
                tmp.append(value)
            }
        }
        return 0
    }
}

// https://leetcode-cn.com/problems/flipping-an-image/
//给定一个二进制矩阵 A，我们想先水平翻转图像，然后反转图像并返回结果。
//
//水平翻转图片就是将图片的每一行都进行翻转，即逆序。例如，水平翻转 [1, 1, 0] 的结果是 [0, 1, 1]。
//
//反转图片的意思是图片中的 0 全部被 1 替换， 1 全部被 0 替换。例如，反转 [0, 1, 1] 的结果是 [1, 0, 0]。
class Solution_832 {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var tmp1 = Array<[Int]>()
        for i in A {
            var tmp2 = Array<Int>()
            for j in i.reversed() { // 水平翻转接
                var tmp3 : Int
                if j == 1 { // 反转
                    tmp3 = 0
                } else {
                    tmp3 = 1
                }
                tmp2.append(tmp3)
            }
            tmp1.append(tmp2)
        }
//        print(tmp1)
        return tmp1
    }
}
