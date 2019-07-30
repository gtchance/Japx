//
//  DecoderTester.m
//  Japx_Tests
//
//  Created by Nikola Majcen on 29/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Japx_Tests-Swift.h"
@import Japx;

@interface DecoderTester : XCTestCase

@end

@implementation DecoderTester

- (void)testArticlePerson
{
    BOOL correctlyParsed = [AdditionalFunctions doesWithJsonFromFileNamed:@"ArticlePerson-JsonApi"
                                                   containsEverethingFrom:@"ArticlePerson-Json"
                                                        afterParsingBlock:^id _Nonnull(NSData * _Nonnull data) {
                                                            return [JAPXDecoder jsonObjectWithData:data includeList:nil error:nil];
                                                        }];
    XCTAssertTrue(correctlyParsed);
}

- (void)testMissingRelationship
{
    BOOL correctlyParsed = [AdditionalFunctions doesWithJsonFromFileNamed:@"MissingRelationship-JsonApi"
                                                   containsEverethingFrom:@"MissingRelationship-Json"
                                                        afterParsingBlock:^id _Nonnull(NSData * _Nonnull data) {
                                                            return [JAPXDecoder jsonObjectWithData:data includeList:nil error:nil];
                                                        }];
    XCTAssertTrue(correctlyParsed);
}

- (void)testArticleExample
{
    BOOL correctlyParsed = [AdditionalFunctions doesWithJsonFromFileNamed:@"ArticleExample-JsonApi"
                                                   containsEverethingFrom:@"ArticleExample-Json"
                                                        afterParsingBlock:^id _Nonnull(NSData * _Nonnull data) {
                                                            return [JAPXDecoder jsonObjectWithData:data includeList:nil error:nil];
                                                        }];
    XCTAssertTrue(correctlyParsed);
}

- (void)testRecursiveSampleWithIncludeList
{
    NSString *includeList = @"author.article.author";
    BOOL correctlyParsed = [AdditionalFunctions doesWithJsonFromFileNamed:@"RecursivSample-JsonApi"
                                                   containsEverethingFrom:@"RecursivSample-Json"
                                                        afterParsingBlock:^id _Nonnull(NSData * _Nonnull data) {
                                                            return [JAPXDecoder jsonObjectWithData:data includeList:includeList error:nil];
                                                        }];
    XCTAssertTrue(correctlyParsed);
}

- (void)testRecursiveSampleWithEmptyRelationshipList
{
    NSString *includeList = @"author.article.author,author.categories";
    BOOL correctlyParsed = [AdditionalFunctions doesWithJsonFromFileNamed:@"EmptyRelationship-JsonApi"
                                                   containsEverethingFrom:@"EmptyRelationship-Json"
                                                        afterParsingBlock:^id _Nonnull(NSData * _Nonnull data) {
                                                            return [JAPXDecoder jsonObjectWithData:data includeList:includeList error:nil];
                                                        }];
    XCTAssertTrue(correctlyParsed);
}

- (void)testRecursiveSampleWithEmptyRelationshipListDeep
{
    NSString *includeList = @"author.article.author.categories,author.categories";
    BOOL correctlyParsed = [AdditionalFunctions doesWithJsonFromFileNamed:@"EmptyRelationship-JsonApi"
                                                   containsEverethingFrom:@"EmptyRelationshipDeep-Json"
                                                        afterParsingBlock:^id _Nonnull(NSData * _Nonnull data) {
                                                            return [JAPXDecoder jsonObjectWithData:data includeList:includeList error:nil];
                                                        }];
    XCTAssertTrue(correctlyParsed);
}

- (void)testRecursiveSampleWithMissinRelationshipIcludeObject
{
    NSString *includeList = @"author.article.author,author.categories";
    BOOL correctlyParsed = [AdditionalFunctions doesWithJsonFromFileNamed:@"RelationshipNoInclude-JsonApi"
                                                   containsEverethingFrom:@"RelationshipNoInclude-Json"
                                                        afterParsingBlock:^id _Nonnull(NSData * _Nonnull data) {
                                                            return [JAPXDecoder jsonObjectWithData:data includeList:includeList error:nil];
                                                        }];
    XCTAssertTrue(correctlyParsed);
}

@end
