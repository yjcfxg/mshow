# mshow这个直播项目基于IJKMediaFramework，需要自己下载
推流完成后，需要拉流才能进行完整的直播。拉流我们采用的也是一个开源的第三方库IJKMediaFramework。
这个库本质是一个播放器，能播放flv格式的播放器。用起来和ios自带的AVPlayer很相似。<br>
实现功能：1.拉流播放。2.监听。<br>
# 一.创建占位图和卡顿占位动效，代码如下：
//直播前的占位图片
- (UIImageView *)placeHolderView<br>
{
    if (!_placeHolderView) {
        _placeHolderView = [[UIImageView alloc] init];
        _placeHolderView.frame = self.view.bounds;<br>
        _placeHolderView.image = [UIImage imageNamed:@"profile_user_414x414"];<br>
        // 强制布局
        [_placeHolderView layoutIfNeeded];
    }<br>
    return _placeHolderView;
}
//卡顿占位动效<br>
- (void)showActivityView{
    if (!_activity) {  
        _activity= [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activity.frame = CGRectMake((SCREAM_WEIGHT-100)*0.5, (SCREAM_HIGHT-100)*0.5, 100, 100);
    }
    [self.activity startAnimating];<br>
    [self.view addSubview:self.activity];<br>
}
//关闭卡顿占位动效<br>
- (void)stopActivityView{
    if ([_activity isAnimating]) {
        [_activity startAnimating];
    }
    [_activity removeFromSuperview];<br>
    _activity = nil;
}
# 二.拉流播放（创建播放器播放），代码如下：<br>

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.placeHolderView];
    [self showActivityView];
    
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    [options setPlayerOptionIntValue:1  forKey:@"videotoolbox"];
    
    // 帧速率(fps) （可以改，确认非标准桢率会导致音画不同步，所以只能设定为15或者29.97）
    [options setPlayerOptionIntValue:29.97 forKey:@"r"];
    // -vol——设置音量大小，256为标准音量。（要设置成两倍音量时则输入512，依此类推
    [options setPlayerOptionIntValue:512 forKey:@"vol"];
    
    IJKFFMoviePlayerController *moviePlayer = [[IJKFFMoviePlayerController alloc] initWithContentURLString:PLAY_URL withOptions:options];
    moviePlayer.view.frame = self.view.bounds;
    
    moviePlayer.scalingMode = IJKMPMovieScalingModeAspectFill;
    // 设置自动播放(必须设置为NO, 防止自动播放, 才能更好的控制直播的状态)
    moviePlayer.shouldAutoplay = NO;
    // 默认不显示
    moviePlayer.shouldShowHudView = NO;
    [self.view insertSubview:moviePlayer.view atIndex:0];
    
    [moviePlayer prepareToPlay];
    
    self.moviePlayer = moviePlayer;
    // 设置监听
    [self addObserver];
    
    [self.view addSubview:self.outBtn];
}
</br>
# 三.设置监听（主要是监听缓存情况），代码如下：<br>

- (void)addObserver
{
   <br> //监听加载状态改变通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStateDidChange:) name:IJKMPMoviePlayerLoadStateDidChangeNotification object:self.moviePlayer];<br>
}

- (void)loadStateDidChange:(NSNotification *) notification<br>
{
    //状态为缓冲几乎完成，可以连续播放<br>
    if ((self.moviePlayer.loadState & IJKMPMovieLoadStatePlaythroughOK) != 0) {
        if (!self.moviePlayer.isPlaying) {
            //开始播放<br>
            [self.moviePlayer play];<br>
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (_placeHolderView) {
                    [_placeHolderView removeFromSuperview];
                    _placeHolderView = nil;
                }<br>
                [self stopActivityView];<br>
            });
        }else{
            // 如果是网络状态不好, 断开后恢复, 也需要去掉加载 <br>
            if ([_activity isAnimating]) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self stopActivityView];<br>
                });
            }
        }
    }<br>
    //缓冲中
    else if (self.moviePlayer.loadState & IJKMPMovieLoadStateStalled){
        [self showActivityView];<br>
        /*  
            这里主播可能已经结束直播了。我们需要请求服务器查看主播是否已经结束直播。
            方法：<br>
            1、从服务器获取主播是否已经关闭直播。<br>
                优点：能够正确的获取主播端是否正在直播。
                缺点：主播端异常crash的情况下是没有办法通知服务器该直播关闭的。
            2、用户http请求该地址，若请求成功表示直播未结束，否则结束<br>
                优点：能够真实的获取主播端是否有推流数据
                缺点：如果主播端丢包率太低，但是能够恢复的情况下，数据请求同样是失败的。
         */<br>
    }
}</br>
