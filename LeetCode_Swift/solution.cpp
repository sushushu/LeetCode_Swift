//
//  solution.cpp
//  LeetCode_Swift
//
//  Created by Jianzhimao on 2020/6/6.
//  Copyright © 2020 softlipa. All rights reserved.
//

#include "solution.hpp"
#include <iostream>

class solution {
    void solut(std::string str) {
        int change_num='a'-'A';
        std::string res="";
        
        for(auto s:str)
        {
            if(s>='A'&&s<='Z') res+=(s+change_num);
            else res+=s;
        }
//        return res;
    }
};


