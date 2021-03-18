#import "IphFlutterPlugin.h"

#import "Razorpay/Razorpay-swift.h"
#import <WebKit/WebKit.h>

@interface IphFlutterPlugin() <RazorpayPaymentCompletionProtocol, WKNavigationDelegate>
    @property (nonatomic, strong) RazorpayCheckout *razorpay;
    @property (nonatomic, strong) WKWebView *webView;

    // Razor Pay API KEY
    @property (nonatomic, strong) NSString *apiKey;
    // Razor Pay ORDER API EndPoint
    @property (nonatomic, strong) NSString *apiEndPoint;
    // Razor Pay API Auth KEY
    @property (nonatomic, strong) NSString *apiAuthKey;

    // Razor Pay Create order response
    @property (nonatomic, strong) NSMutableDictionary * orderRequestData;
    @property (nonatomic, strong) NSDictionary * orderResponseData;

    // Razor Pay Create payment
    @property (nonatomic, strong) NSMutableDictionary * paymentRequestData;

@end


@implementation IphFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"iph_flutter"
            binaryMessenger:[registrar messenger]];
  IphFlutterPlugin* instance = [[IphFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}


- (void)viewDidLoad {
    self.apiEndPoint = @"https://api.razorpay.com/v1/orders";
    self.apiKey = @"rzp_test_XXXXXXXXXXXXXXXXXXXXXX";
    self.apiAuthKey = @"Basic XXXXXXXXXXXXXXXXXXXXXXXXXXX";


    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];//Property 'view' not found on object of type 'IphFlutterPlugin *'
    self.webView.navigationDelegate = self;
    self.razorpay = [RazorpayCheckout initWithKey:self.apiKey andDelegate:self withPaymentWebView:self.webView];
    /*[self.view addSubview:webView];*/

}
- (void)onPaymentError:(int32_t)code description:(NSString * _Nonnull)str {

}

- (void)onPaymentSuccess:(NSString * _Nonnull)payment_id {

}
@end
