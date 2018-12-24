//
//  AtonementNotice.m
//  GDRMMobile
//
//  Created by yu hongwu on 12-11-15.
//
//

#import "AtonementNotice.h"
#import "Systype.h"

@implementation AtonementNotice

@dynamic myid;
@dynamic caseinfo_id;
@dynamic citizen_name;
@dynamic code;
@dynamic date_send;
//@dynamic check_organization;
@dynamic case_desc;
@dynamic witness;
@dynamic pay_reason;
@dynamic pay_mode;
@dynamic organization_id;
@dynamic remark;
@dynamic isuploaded;

- (NSString *)organization_info_part1{
    return [[self subString2:self.organization_id] objectAtIndex:0];
}
- (NSString *)organization_info_part2{
    return [[self subString2:self.organization_id] objectAtIndex:1];
}

- (NSString *)check_organization{
    return [[Systype typeValueForCodeName:@"复核单位"] objectAtIndex:0];;
}
- (NSString *) signStr{
    if (![self.caseinfo_id isEmpty]) {
        return [NSString stringWithFormat:@"caseinfo_id == %@", self.caseinfo_id];
    }else{
        return @"";
    }
}

+ (NSArray *)AtonementNoticesForCase:(NSString *)caseID{
    NSManagedObjectContext *context=[[AppDelegate App] managedObjectContext];
    NSEntityDescription *entity=[NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"caseinfo_id==%@",caseID];
    fetchRequest.predicate=predicate;
    fetchRequest.entity=entity;
    return [context executeFetchRequest:fetchRequest error:nil];
}

- (NSString *)organization_info{
    return self.organization_id;
}

- (NSString *)bank_name{
    return [[Systype typeValueForCodeName:@"交款地点"] objectAtIndex:0];
}
-(NSArray *) subString2:(NSString *)str {
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    if (str != nil){
        
        //从开始截取到指定索引字符   但不包含此字符  。
        NSString * tempStr1 = [str substringToIndex:str.length/2-1];
        
        //从指定字符串截取到末尾
        NSString * tempStr2 = [str substringFromIndex:str.length/2-1];
        
        [array addObject:tempStr1];
        
        [array addObject:tempStr2];
    }
    
    return array;
}
@end
