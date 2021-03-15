//
//  GetTheOffers.swift
//  LeetCode_Swift
//
//  Created by Jianzhimao on 2020/6/19.
//  Copyright © 2020 softlipa. All rights reserved.
//

/// LeetCode里面剑指offer的题
import Foundation

// MARK: - 面试题58 - II. 左旋转字符串
//字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。
//
//示例 1：
//
//输入: s = "abcdefg", k = 2
//输出: "cdefgab"
//示例 2：
//
//输入: s = "lrloseumgh", k = 6
//输出: "umghlrlose"
//
//限制：
//
//1 <= k < s.length <= 10000

class Solution_58 {
    // 方案一： 利用字符串集合API removeFirst()和append()。
    // 思路是找到n的对应数组中的下标，以下标为分割线，将下标之前的元素全部移除，随后挨个
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        if s.count == 0 || n <= 0 || n > s.count {
            return s
        }
        // 如果n等于数组总长度，则不改动
        if n == s.count {
            return s
        }
        
        var s = s
        
        for (i,v) in s.enumerated() {
            if i < n {
                s.append(v)
            }
            // 移除pivot点(i == n的时候)前面的所有元素
            if i == n {
                s.removeFirst(i)
            }
        }
        return s
    }
}

/// 二分查找
class Solution_binarySearch {
    func search(array: Array<Int>, item: Int) -> Int {
        guard array.count != 0 else {
            return -1
        }
        
        // 2个变量记录low和high
        // 开始循环查找，渐渐缩小范围
        // 用标量记录找到的中间值
        var low = 0
        var high = array.count - 1
        
        while (low <= high) {
            var mid = (low + high) / 2
            print("\(array[mid])")
        }
        return -1
    }
}
