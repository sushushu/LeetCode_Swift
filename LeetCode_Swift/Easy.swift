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
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var res : Array<Int> = []
//        for (index_i,value_i) in nums.enumerated() { // 顺序遍历
//            for (index_j,value_j) in nums.enumerated().reversed() { // 逆向遍历
//                if value_i + value_j == target { // 找到目标值
//                    if index_i == index_j { // 容错处理 比如target是28, 但是只有1个元素是14就
//                        continue
//                    }
//                    if index_i > index_j {
//                        res = [index_j,index_i]
//                    } else {
//                        res = [index_i,index_j]
//                    }
//                }
//            }
//        }
//        return res;
//    }

    
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
