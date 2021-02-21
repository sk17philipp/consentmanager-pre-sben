//
//  CMPDataStoragePrivateUserDefaults.h
//  GDPR
//

#import <Foundation/Foundation.h>

@interface CMPDataStoragePrivateUserDefaults : NSObject
+(NSString *)consentToolUrl;

+(void)setConsentToolUrl:(NSString *)consentToolUrl;

+(NSString *)lastRequested;

+(void)setLastRequested:(NSString *)lastAccepted;

+(NSString *)lastAccepted;

+(void)setLastAccepted:(NSString *)lastAccepted;

+(void)clearContents;
@end
