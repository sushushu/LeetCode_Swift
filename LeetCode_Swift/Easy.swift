//
//  Q771.swift
//  LeetCode_Swift
//
//  Created by softlipa on 2018/12/31.
//  Copyright © 2018年 softlipa. All rights reserved.
//

import Foundation


// MARK: - 找出和为目标值的那 两个 整数，并返回他们的数组下标。

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


// MARK: - J和S宝石问题

// https://leetcode-cn.com/problems/jewels-and-stones/
//给定字符串J 代表石头中宝石的类型，和字符串 S代表你拥有的石头。 S 中每个字符代表了一种你拥有的石头的类型，你想知道你拥有的石头中有多少是宝石。
//
//J 中的字母不重复，J 和 S中的所有字符都是字母。字母区分大小写，因此"a"和"A"是不同类型的石头。
class Solution_771 {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        if (J.count > 50) || (S.count > 50 || J.count == 0 || S.count == 0) {
            print("异常")
            return 0
        }
        
        let m_sArray = Array(S)
        var m_set = Set<Character>() // Set合集是高阶函数，具有确保里面的值唯一的特性
        
        for j in m_sArray { // 遍历2个数组的元素进行比较
            if !m_set.contains(j) {
                m_set.insert(j)
            }
        }
        return m_set.count;
    }
    
    // 直接利用filter()函数
//    func numJewelsInStones(_ J: String, _ S: String) -> Int {
////        return S.filter { J.contains($0) }.count
//
//             let nums = S.filter {
//                    J.contains($0)
//                }
//                return nums.count
//
//    }
}


// MARK: - 电子邮件字符替换

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


// MARK: - 大写转小写

// https://leetcode-cn.com/problems/to-lower-case/
// 大写转小写
class Solution_709 {
    // 高阶函数解决办法
//        func toLowerCase11(_ str: String) -> String {
//    //        // return str.lowercased(with: nil)
//             return str.lowercased()
//            
//        }
    
    // 字典解决办法写法，和官方的localizedLowercase()函数差不多内存和时间消耗
    func toLowerCase(_ str: String) -> String {
        let dict = ["A":"a",
                    "B":"b",
                    "C":"c",
                    "D":"d",
                    "E":"e",
                    "F":"f",
                    "G":"g",
                    "H":"h",
                    "I":"i",
                    "J":"j",
                    "K":"k",
                    "L":"l",
                    "M":"m",
                    "N":"n",
                    "O":"o",
                    "P":"p",
                    "Q":"q",
                    "R":"r",
                    "S":"s",
                    "T":"t",
                    "U":"u",
                    "V":"v",
                    "W":"w",
                    "X":"x",
                    "Y":"y",
                    "Z":"z",
                    ] // 因为字母是有限且是规定好的，可以直接用字典定义出来
        
        var ret = ""
        for s in str { // 遍历入参字符串
            if dict.keys.contains(String(s)) { // 判断是否包含在字典key里面
                ret.append(String(dict[String(s)] ?? "")) // 如果包含在字典的key里面，直接利用K-V取出值(dict["key"])， 也就是利用大写字母取出小写字母
            } else {
                ret.append(String(s))
            }
        }
        return ret
    }
}


// MARK: -

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
//                var tmp3 : Int
//                if j == 1 {
//                    tmp3 = 0
//                } else {
//                    tmp3 = 1
//                }
                tmp2.append(j^1) // 反转  j^1更优雅一点
            }
            tmp1.append(tmp2)
        }
//        print(tmp1)
        return tmp1
    }
}


// https://leetcode-cn.com/problems/unique-morse-code-words/
//国际摩尔斯密码定义一种标准编码方式，将每个字母对应于一个由一系列点和短线组成的字符串， 比如: "a" 对应 ".-", "b" 对应 "-...", "c" 对应 "-.-.", 等等。
//为了方便，所有26个英文字母对应摩尔斯密码表如下：
//[".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
//给定一个单词列表，每个单词可以写成每个字母对应摩尔斯密码的组合。例如，"cab" 可以写成 "-.-..--..."，(即 "-.-." + "-..." + ".-"字符串的结合)。我们将这样一个连接过程称作单词翻译。
class Solution_804 {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        var alphabet = Dictionary<String,String> () // 字母表莫尔斯密码字典
        let charAry = Array("abcdefghijklmnopqrstuvwxyz")
        let morseAry = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var res = Array<String>()
        var resList = Array<String>()
        
        for (index,value) in charAry.enumerated() {
            alphabet[String(value)] = morseAry[index] // String(value):char转string , 映射字母表莫尔斯密码成字典
        }
        
        for (_,value) in words.enumerated() { // 遍历 ["gin", "zen", "gig", "msg"]
            var tmp = ""
            for (_,value1) in String(value).enumerated() { // 遍历 "gin"
                tmp.append(alphabet[String(value1)]!)
            }
            res.append(tmp) // "gin" => "--...-."
        }
        
        for (_,value) in res.enumerated() { // 去重
            if !resList.contains(value) {
                resList.append(value)
            }
        }
        
        return resList.count
    }
}


// https://leetcode-cn.com/problems/robot-return-to-origin/ 657. 机器人能否返回原点
//在二维平面上，有一个机器人从原点 (0, 0) 开始。给出它的移动顺序，判断这个机器人在完成移动后是否在 (0, 0) 处结束。
//
//移动顺序由字符串表示。字符 move[i] 表示其第 i 次移动。机器人的有效动作有 R（右），L（左），U（上）和 D（下）。如果机器人在完成所有动作后返回原点，则返回 true。否则，返回 false。
//
//注意：机器人“面朝”的方向无关紧要。 “R” 将始终使机器人向右移动一次，“L” 将始终向左移动等。此外，假设每次移动机器人的移动幅度相同。
class Solution_657 {
    func judgeCircle(_ moves: String) -> Bool {
        var paths = ["L":-1,"R":1,"U":10,"D":-10]
        var LRTmp = 0
        var UDTmp = 0
        
        for element in moves {
            if element == "L" || element == "R" {
                LRTmp += paths[String(element)]!
            } else {
                UDTmp += paths[String(element)]!
            }
        }
        return !Bool(truncating: NSNumber.init(value: LRTmp + UDTmp))
    }
}


// https://leetcode-cn.com/problems/sort-array-by-parity-ii/  922. 按奇偶排序数组 II
//给定一个非负整数数组 A， A 中一半整数是奇数，一半整数是偶数。
//对数组进行排序，以便当 A[i] 为奇数时，i 也是奇数；当 A[i] 为偶数时， i 也是偶数。
//你可以返回任何满足上述条件的数组作为答案。
class Solution_922 {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var evenNumber = Array<Int>()
        var unevenNumber = Array<Int>()
        var res = Array<Int>()
        // 先把奇偶抽取出来
        for (_,value) in A.enumerated() {
            if value%2 == 0 { // 偶数
               evenNumber.append(value)
            } else {
               unevenNumber.append(value)
            }
        }
        // 根据数组下标的奇偶重新排列
        for (index,_) in A.enumerated() {
            if index%2 == 0 { // 偶数
                res.append(evenNumber[index/2])
            } else { // 奇数
                res.append(unevenNumber[(index-1)/2])
            }
        }
//        print(res)
        return res
    }
}


// https://leetcode-cn.com/problems/hamming-distance/
//两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。
//给出两个整数 x 和 y，计算它们之间的汉明距离。
class Solution_461 {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        print(String(x ^ y, radix: 2).replacingOccurrences(of: "0", with: "").count) // 异或操作 http://www.runoob.com/cplusplus/cpp-operators.html 
        return 0
    }
}


// https://leetcode-cn.com/problems/peak-index-in-a-mountain-array/
//我们把符合下列属性的数组 A 称作山脉：
//A.length >= 3
//存在 0 < i < A.length - 1 使得A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1]
//给定一个确定为山脉的数组，返回任何满足 A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1] 的 i 的值。
class Solution_852 {
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        var biggest = 0
        var res = Int()
        for (index,value) in A.enumerated() {
            while (biggest < value) { // 找最大
                biggest = value
//                print(index,value)
                res = index // 找最大值对应的下标
            }
        }
        
//        let tmp = A.max() // 或者用系统API
//        for (index,value) in A.enumerated() {
//            if tmp == value {
//                res = index
//            }
//        }
        return res
    }
}

// https://leetcode-cn.com/problems/di-string-match/
//给定只含 "I"（增大）或 "D"（减小）的字符串 S ，令 N = S.length。
//
//返回 [0, 1, ..., N] 的任意排列 A 使得对于所有 i = 0, ..., N-1，都有：
//
//如果 S[i] == "I"，那么 A[i] < A[i+1]
//如果 S[i] == "D"，那么 A[i] > A[i+1]
// 注意审题: N = S.length ；[0, 1, ..., N] 的任意排列 A 使得对于所有 i = 0, ..., N-1；传入的数组下标从0开始的，输出的数组
// 没有彻底搞懂
class Solution_942 {
    func diStringMatch(_ S: String) -> [Int] {
        var res =  Array<Int>()
        var left = 0
        var right = S.count
        
        for value in S {
            if value == "I" {
                res.append(left)
                left += 1
            } else {
                res.append(right)
                right -= 1
            }
        }
        res.append(left)
        
        return res
    }
}


// https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
//请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点，你将只被给定要求被删除的节点。
//
//现有一个链表 -- head = [4,5,1,9]，它可以表示为:
//示例 1:
//
//输入: head = [4,5,1,9], node = 5
//输出: [4,1,9]
//解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
//说明:
//
//链表至少包含两个节点。
//链表中所有节点的值都是唯一的。
//给定的节点为非末尾节点并且一定是链表中的一个有效节点。
//不要从你的函数中返回任何结果。
class Solution_237 {
    // 单链表结构
    public class SingleLinkedListNode<T> {
        var value: T
        var next: SingleLinkedListNode?
        
        public init(value: T) {
            self.value = value
            self.next = nil
        }
    }
    
    func deleteNode(node:SingleLinkedListNode<Any>) -> SingleLinkedListNode<Any> {
        node.value = node.next?.value // 先拿下一个节点的值，然后再把该节点的地址指向下一个节点，一定要注意顺序
        node.next = node.next?.next
        return node
    }
}

// https://leetcode-cn.com/problems/reverse-linked-list/
//反转一个单链表。
//
//示例:
//
//输入: 1->2->3->4->5->NULL
//输出: 5->4->3->2->1->NULL
//进阶:
//你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
class Solution_206 {
    // 单链表结构
    public class ListNode<T> {
        var value: T
        var next: ListNode?
        
        public init(value: T) {
            self.value = value
            self.next = nil
            
        }
    }
    
    func reverseList(_ head: ListNode<Any>?) -> ListNode<Any>? {
        if (head == nil || head?.next == nil) {
            return head
        }
        
        var newH:ListNode<Any>? = nil
        var head = head
        
        while head != nil {
            let tmp = head?.next
            head?.next = newH
            newH = head
            head = tmp
        }
        return newH
    }
}

// https://leetcode-cn.com/problems/linked-list-cycle/
//给定一个链表，判断链表中是否有环。
//
//为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
//
//
//
//示例 1：
//
//输入：head = [3,2,0,-4], pos = 1
//输出：true
//解释：链表中有一个环，其尾部连接到第二个节点。
//
//
//示例 2：
//
//输入：head = [1,2], pos = 0
//输出：true
//解释：链表中有一个环，其尾部连接到第一个节点。
//
//
//示例 3：
//
//输入：head = [1], pos = -1
//输出：false
//解释：链表中没有环。
//进阶：
//
//你能用 O(1)（即，常量）内存解决此问题吗？

//class Solution_141 {
//    func hasCycle(_ head: ListNode?) -> Bool {
//
//
//        return false
//    }
//}


//// https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/
//统计一个数字在排序数组中出现的次数。
//
//示例 1:
//
//输入: nums = [5,7,7,8,8,10], target = 8
//输出: 2
//示例 2:
//
//输入: nums = [5,7,7,8,8,10], target = 6
//输出: 0
//
//
//限制：
//
//0 <= 数组长度 <= 50000
class Solution_Offer {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var ret = 0
        
        for e in nums {
            if target == e {
                ret += 1
            }
        }
        
        return ret
    }
}



// MARK: - 面试题06. 从尾到头打印链表
// https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
//输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。
//
//示例 1：
//
//输入：head = [1,3,2]
//输出：[2,3,1]
class Solution_interview_06 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func reversePrint(_ head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        if head!.next == nil {
            return [head!.val]
        }
        var t = head
        var ret = [Int]()
        ret.insert(t!.val, at: 0) // 上来得先插入一个，因为下面是拿next判断的
        
        while t!.next != nil {
            t = t!.next
            ret.insert(t!.val, at: 0) // 一直插入数组最前面就能保证链表从尾到头按在数组上面
        }
        return ret
    }
}


// MARK: - 反转链表
// https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/
//定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。
//
//示例:
//
//输入: 1->2->3->4->5->NULL
//输出: 5->4->3->2->1->NULL
//
//限制：
//
//0 <= 节点个数 <= 5000

class Solution_interview_24 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    // 递归法
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        if head == nil || head?.next == nil {  // 终止条件，只剩下一个结点
//            return head
//        }
//
//        let tmp = reverseList(head?.next) // 注意该入参是head.next，所以当前第一个节点不动。为：n1->n2->...->nm  =>  n1->(nil<-n2<-...<-nm) ， n1不动
//        head?.next?.next = head // 这时候head就是n1，把n1给
//        head?.next = nil
//        return tmp
//    }
    
    
    // 第三变量，移动指针
    func reverseList(_ head: ListNode?) -> ListNode? {
         if head == nil || head?.next == nil {
             return head
         }

        var newHead:ListNode? = nil
        var head = head

        while head != nil {
            let tmp = head?.next
            head?.next = newHead;
            newHead = head;
            head = tmp
        }
//        print(newHead)
        return newHead
    }
}



// MARK: - 合并两个有序的链表
//输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。
//
//示例1：
//
//输入：1->2->4, 1->3->4
//输出：1->1->2->3->4->4
//限制：
//
//0 <= 链表长度 <= 1000
class Solution_interview_25 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2
        var root: ListNode? = ListNode(0)
        let result = root
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                root?.next = l1
                l1 = l1?.next // 移动指针
            } else {
                root?.next = l2
                l2 = l2?.next // 移动指针
            }
            root = root?.next // 移动指针
        }
        root?.next = l1 != nil ? l1 : l2 // 防止链表不平均造成剩余，这里判断一下
        return result?.next
    }
}
