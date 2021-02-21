//
//  ViewController.m
//  CMPConsentToolDemoApp
//

#import "ViewController.h"
#import <ConsentManager/CMPConsentTool.h>
#import <ConsentManager/CMPDataStorageV1UserDefaults.h>
#import <ConsentManager/CMPDataStorageV2UserDefaults.h>
#import <ConsentManager/CMPDataStoragePrivateUserDefaults.h>
#import <ConsentManager/CMPDataStorageConsentManagerUserDefaults.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *GDPRConsentStringLabel;
@end

@implementation ViewController
static CMPConsentTool *cmpConsentTool = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    void (^onOpen)( void );
    void (^onClose)( void );
    
    onOpen = ^(void){
        NSLog(@"opened");
    };
    
    onClose = ^(void){
         NSInteger length = [[CMPDataStorageV2UserDefaults vendorConsents] length];
         for( int i = 1; i <= length; i++){
             NSLog(@"checking vendor: %d", i );
             if( [cmpConsentTool hasVendorConsent:[[NSNumber numberWithInt:i] stringValue] vendorIsV1orV2: true]){
                 NSLog(@"has Vendor consent!");
             }
         }
         
         NSInteger plength = [[CMPDataStorageV2UserDefaults purposeConsents] length];
         for( int i = 1; i <= plength; i++){
             NSLog(@"checking purpose: %d", i );
             if( [cmpConsentTool hasPurposeConsent:[[NSNumber numberWithInt:i] stringValue] purposeIsV1orV2: true]){
                 NSLog(@"has Purpose consent!");
             }
         }
        
        NSLog(@"Gdpr Applies: %@", [CMPDataStorageV2UserDefaults gdprApplies]);
         
        NSLog(@"closed");
    };
    
    [CMPConsentTool reset];
    
    cmpConsentTool = [[CMPConsentTool alloc] init:@"www.consentmanager.net" addId:@"10640" addAppName:@"my test app" addLanguage:@"de" addViewController:self addOpenListener:onOpen addCloseListener:onClose];
    
}



- (IBAction)showGDPRConsentTool:(id)sender {
    [cmpConsentTool openCmpConsentToolView];
    
    /* Importing and exporting the cmp data: */
    /*
    NSString *cmpData = [CMPConsentTool exportCMPData];
    NSLog(@"exportet:%@", cmpData);
    [CMPConsentTool reset];
    [CMPConsentTool importCMPData:@"Q080QnNTMk80SDM2RUFmS0FCRU5BekNzQVBfQUFIX0FBQVlnRnlRQ1FBVUFDVEFGY0FOa0FlQUJFQUNmQUxRQVhJQmNrQWtBRkFBa3dCWEFEWkFIZ0FSQUFud0MwQUZ5QUtBb0FRQXJnQ0lBd0FRQlBnRm9CSUFRQXJnQ0lCUUFRQlBnRm9Cb0FRQXJnQ0lCd0FRQlBnRm9DSUFRQXJnQ0lDUUFRQlBnRm9Db0FRQXJnQ0lDd0FRQlBnRm9ESUFRQXJnQ0lEUUFRQlBnRm9Eb0FRQXJnQ0lEd0FRQlBnRm9FSUFRQXJnQ0lFUUFRQlBnRm9Fb0FRQXJnQ0lFd0FRQlBnRm9GSUFRQXJnQ0lGUUFRQlBnRm9BI19fI19zMjZfczE0MDlfczk3N19VXyMxLS0tIzF-My4yOTUzLjI4NTguMTk4Ni4yMzY"];
    cmpData = [CMPConsentTool exportCMPData];
    NSLog(@"importet:%@", cmpData);
    */
}
@end
