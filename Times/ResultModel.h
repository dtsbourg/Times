//
//  ResultModel.h
//  Times
//
//  Created by Dylan Bourgeois on 10/04/14.
//  Copyright (c) 2014 Dylan Bourgeois. All rights reserved.
//

#import "JSONModel.h"
#import "ArticleModel.h"

@interface ResultModel : JSONModel

@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSString *copyright;
@property (strong, nonatomic) NSArray* results;

@end
