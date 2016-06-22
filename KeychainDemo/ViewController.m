//
//  ViewController.m
//  KeychainDemo
//
//  Created by ios1 on 16/6/21.
//  Copyright © 2016年 buyforyou. All rights reserved.
//

#import "ViewController.h"
#import "KeychainWrapper.h"
@interface ViewController (){

    KeychainWrapper *wrapper;
}
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    wrapper = [[KeychainWrapper alloc]init];
    //从keychain中获取用户名和密码
    _userName.text = [wrapper myObjectForKey:(id)kSecAttrAccount];
    _passWord.text = [wrapper myObjectForKey:(id)kSecValueData];
    
 
} 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveClick:(UIButton *)sender {
    [self.view endEditing:YES];
    if (_userName.text.length == 0 || _passWord.text.length ==0) {
        _resultLabel.text = @"请输入用户名和密码";
        return;
    }
  
    //将用户名和密码保存到keychain中
    [wrapper mySetObject:_userName.text forKey:(id)kSecAttrAccount];
    [wrapper mySetObject:_passWord.text forKey:(id)kSecValueData];
    
    
}
- (IBAction)deleteClick:(UIButton *)sender {
    [wrapper resetKeychainItem];
    _userName.text = @"";
    _passWord.text = @"";
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];

}

@end
