//
//  ViewController.m
//  RSA 加解密
//
//  Created by 张友波 on 17/5/10.
//  Copyright © 2017年 张友波. All rights reserved.
//

#import "ViewController.h"
#import "RSAEncryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //原始数据
    NSString *originalString = @"zhangyoubo";
    
    //使用.der和.p12中的公钥私钥加密解密
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
    
    
    RSAEncryptor *rsaEncryptor = [RSAEncryptor sharedInstance];
    
    BOOL hasPublicKey = [rsaEncryptor getPublicKeyRefrenceFromeData:[[NSData alloc] initWithContentsOfFile:public_key_path]];
    BOOL hasPrivateKey = [rsaEncryptor getPrivateKeyRefrenceFromData:[[NSData alloc] initWithContentsOfFile:public_key_path] password:@"123456"];
    
    if (!hasPublicKey||!hasPrivateKey) {
        
        [rsaEncryptor loadPublicKeyFromFile:public_key_path];
        [rsaEncryptor loadPrivateKeyFromFile:private_key_path password:@"123456"];
        
   }else{
        
    }
    
    NSString *encryptStr = [rsaEncryptor rsaEncryptString:originalString];
    NSString *decryptStr = [rsaEncryptor rsaDecryptString:encryptStr];
    
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", decryptStr);
    
    
  }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
