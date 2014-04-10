//
//  ArticleModel.h
//  Times
//
//  Created by Dylan Bourgeois on 10/04/14.
//  Copyright (c) 2014 Dylan Bourgeois. All rights reserved.
//

#import "JSONModel.h"
#import "MediaModel.h"

@interface ArticleModel : JSONModel

@property(nonatomic, strong) NSString* abstract;
@property(nonatomic, strong) MediaModel*media;

@end
