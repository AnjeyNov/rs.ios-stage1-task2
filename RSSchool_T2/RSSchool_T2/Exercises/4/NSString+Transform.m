#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSMutableDictionary<NSString*, NSNumber*> *alphabet =[[NSMutableDictionary alloc] initWithDictionary: @{
        @"q" : @0,
        @"w" : @0,
        @"e" : @0,
        @"r" : @0,
        @"t" : @0,
        @"y" : @0,
        @"u" : @0,
        @"i" : @0,
        @"o" : @0,
        @"p" : @0,
        @"a" : @0,
        @"s" : @0,
        @"d" : @0,
        @"f" : @0,
        @"g" : @0,
        @"h" : @0,
        @"j" : @0,
        @"k" : @0,
        @"l" : @0,
        @"z" : @0,
        @"x" : @0,
        @"c" : @0,
        @"v" : @0,
        @"b" : @0,
        @"n" : @0,
        @"m" : @0
    } copyItems:YES];
    
    NSMutableString *tempString = [[NSMutableString alloc] initWithString:[self lowercaseString]];
    for(NSInteger index = 0; index < [tempString length]; index++) {
        NSString *currentSymbol = [tempString substringWithRange:NSMakeRange(index, 1)];
        alphabet[currentSymbol] = [[NSNumber alloc] initWithInt:[alphabet[currentSymbol] intValue] + 1];
    }
    
    BOOL flag = YES;
    
    for(NSString *key in alphabet) {
        if([alphabet[key] intValue] == 0) {
            flag = NO;
            break;
        }
    }
    
    //NSMutableDictionary<NSNumber* , NSMutableArray* > *countingString = [NSMutableDictionary new];
    NSMutableArray *strings = [[NSMutableArray alloc] initWithArray:[self componentsSeparatedByString:@" "] copyItems:YES];
    [strings removeObject:@""];
    if([strings count] == 0){
        return @"";
    }
    
    NSMutableArray<NSString*> *countingStrings = [NSMutableArray new];
    NSMutableArray<NSNumber*> *counters = [NSMutableArray new];
    for(NSString *str in strings){
        NSArray *counting = nil;
        if(flag) {
            counting = [NSString countAndUpperVowelInString:str];
        } else {
            counting = [NSString countAndUpperConsonantInString: str];
        }
        [countingStrings addObject:[counting firstObject]];
        [counters addObject:[counting lastObject]];
    }
    
    NSMutableString *resultString = [NSMutableString new];
    NSNumber *min = [[NSNumber alloc] initWithInt:0];
    while([countingStrings count] != 0) {
        for(NSInteger index = 0; index < [countingStrings count];) {
            if([counters[index] compare:min] == NSOrderedSame) {
                [resultString appendString:countingStrings[index]];
                [resultString appendString:@" "];
                [counters removeObjectAtIndex:index];
                [countingStrings removeObjectAtIndex:index];
            } else {
                index++;
            }
        }
        min = [[NSNumber alloc] initWithInt:[min intValue]+1];
    }
    resultString = [resultString substringWithRange:NSMakeRange(0, [resultString length]-1)];
    
//    strings = [countingString keysSortedByValueUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
//        return [obj1 compare:obj2];
//    }];

    return resultString;
}

+(NSArray*)countAndUpperVowelInString:(NSString *)string {
    NSInteger count = 0;
    NSString *currentSymbol = nil;
    NSString *symbols = @"AEIOUYaeiouy";
    NSMutableString *tempString = [NSMutableString new];
    for(NSInteger index = 0; index < [string length]; index++) {
        currentSymbol = [string substringWithRange:NSMakeRange(index, 1)];
        if([symbols containsString:currentSymbol]) {
            count++;
            currentSymbol = [currentSymbol uppercaseString];
        }
        [tempString appendString:currentSymbol];
    }
    NSMutableString *result = [[NSMutableString alloc] initWithFormat:@"%ld", (long)count];
    [result appendString:tempString];
    return @[result, [[NSNumber alloc] initWithInt:(int)count]];
}

+(NSArray*)countAndUpperConsonantInString:(NSString *)string {
    NSInteger count = 0;
    NSString *currentSymbol = nil;
    NSString *symbols = @"BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz";
    NSMutableString *tempString = [NSMutableString new];
    for(NSInteger index = 0; index < [string length]; index++) {
        currentSymbol = [string substringWithRange:NSMakeRange(index, 1)];
        if([symbols containsString:currentSymbol]) {
            count++;
            currentSymbol = [currentSymbol uppercaseString];
        }
        [tempString appendString:currentSymbol];
    }
    NSMutableString *result = [[NSMutableString alloc] initWithFormat:@"%ld", (long)count];
    [result appendString:tempString];
    return @[result, [[NSNumber alloc] initWithInt:(int)count]];
}

@end
