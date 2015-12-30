//
//  Random.m
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/24.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import "Random.h"

@implementation Random
+ (NSArray *)product_random_number_array :(NSMutableArray *)number
{
    NSMutableArray *startArray = [[NSMutableArray alloc]initWithArray:number];
    NSMutableArray  *resultArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < number.count; i ++)
    {
        int k = arc4random()%startArray.count;
        resultArray[i] = startArray[k];
        startArray[k] = [startArray lastObject];//为了更好的乱序，交换下位置
        [startArray removeLastObject];
        
    }
    return resultArray;
}
@end
