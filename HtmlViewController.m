#import "HtmlViewController.h"

@implementation HtmlViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSURL *baseURL = [[NSURL alloc] initFileURLWithPath:resourcePath];
    
    if (_content) {
        [self.webView loadHTMLString:_content baseURL:baseURL];
    } else {
        // Display the "About iGoat" splash screen as a default.
        NSError *error;
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"splash" ofType:@"html"];
        NSString *fileContents = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        
        [self.webView loadHTMLString:[NSString stringWithFormat:fileContents, version] baseURL:baseURL];
    }
}

@end
