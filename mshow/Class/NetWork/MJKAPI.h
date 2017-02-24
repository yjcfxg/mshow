//
//  MJKAPI.h
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJKAPI : NSObject

#define SERVER_HOST @"http://service.inke.com/"
//图片服务器地址
#define IMAGE_HOST @"https://img2.inke.cn/"
//热门直播
#define API_HotLive @"api/live/gettop"
/*
 http://120.55.238.158/api/live/gettop?&uid=154362385&count=5
 */
 /**
 
 {
	"dm_error": 0,
	"error_msg": "操作成功",
	"expire_time": 5,
	"lives": [
 {
 "city": "",
 "creator": {
 "birth": "2015-11-16",
 "description": "从来没这么讨厌过你～ w: meat520520",
 "emotion": "保密",
 "gender": 0,
 "gmutex": 0,
 "hometown": "浙江省&杭州市",
 "id": 5335112,
 "inke_verify": 0,
 "level": 135,
 "location": "",
 "nick": "小学妹🐣",
 "portrait": "http://img2.inke.cn/MTQ4NjgyOTMwNjE2NCMzMzIjanBn.jpg",
 "profession": "专职小可爱",
 "rank_veri": 18,
 "sex": 3,
 "third_platform": "1",
 "veri_info": "baby",
 "verified": 0,
 "verified_reason": ""
 },
 "group": 1,
 "id": "1486981147437651",
 "image": "",
 "link": 0,
 "live_type": "",
 "multi": 0,
 "name": "",
 "online_users": 12692,
 "optimal": 0,
 "pub_stat": 1,
 "room_id": 904244967,
 "rotate": 0,
 "share_addr": "http://mlive3.inke.cn/share/live.html?uid=5335112&liveid=1486981147437651&ctime=1486981147",
 "slot": 3,
 "status": 1,
 "stream_addr": "http://pull99.a8.com/live/1486981147437651.flv",
 "tag_id": 4,
 "token": "4",
 "version": 0
 },

 */
#define API_HotAD @"http://live.9158.com/Living/GetAD"
//附近的人
#define API_NearLive @"api/live/near_flow_old"
/*
http://service.inke.com/api/live/near_flow_old?&uid=154362385&latitude=40.099857&longitude=116.283423
 
 {
	"dm_error": 0,
	"error_msg": "操作成功",
	"expire_time": 60,
	"flow": [
 {
 "flow_type": "live",
 "info": {
 "city": "北京市",
 "creator": {
 "gender": 1,
 "id": 62631418,
 "level": 7,
 "nick": "甭管甭问甭操心",
 "portrait": "http://img2.inke.cn/MTQ4MjcyNTE0NDU3MyM5ODUjanBn.jpg"
 },
 "distance": "4.2km",
 "group": 60,
 "id": "1486621951312660",
 "link": 0,
 "live_type": "",
 "multi": 0,
 "name": "",
 "optimal": 0,
 "rotate": 0,
 "share_addr": "http://mlive3.inke.cn/share/live.html?uid=62631418&liveid=1486621951312660&ctime=1486621951",
 "slot": 5,
 "stream_addr": "http://pull4.a8.com/live/1486621951312660.flv?ikHost=ws&ikOp=1&CodecInfo=8192",
 "version": 0
 }
 },
 
*/

//广告地址
#define API_Advertise @"advertise/get"


/**
  api/user/info
 */
/*
http://120.55.238.158/api/user/info?&uid=154362385
*/


/*
 {
	"dm_error": 0,
	"error_msg": "操作成功",
	"logid": "164,133,175",
	"md5": "ad363d0bde915683aefe67f06e409c20",
	"server": [
 {
 "key": "USER_RECOMMEND",
 "url": "http://service.inke.com/api/user/recommend"
 },
 {
 "key": "USER_SEARCH",
 "url": "http://service.inke.com/api/user/search"
 },
 {
 "key": "USER_ACCOUT",
 "url": "http://service.inke.com/user/account/login"
 },
 {
 "key": "USER_CHECK_SESSION",
 "url": "http://service.inke.com/user/account/check_session"
 },
 {
 "key": "IMAGE_SCALE",
 "url": "http://image.scale.inke.com/imageproxy2/dimgm/scaleImage?url="
 },
 {
 "key": "IMAGE_UPLOAD",
 "url": "http://upload.inke.com/upload/image?"
 },
 {
 "key": "IMAGE",
 "url": "http://img2.inke.cn/"
 },
 {
 "key": "LIVE_USERS",
 "url": "http://service.inke.com/api/live/users"
 },
 {
 "key": "USER_INFO",
 "url": "http://service.inke.com/api/user/info"
 },
 {
 "key": "USER_RELATION_FOLLOW",
 "url": "http://service.inke.com/api/user/relation/follow"
 },
 {
 "key": "USER_RELATION_UNFOLLOW",
 "url": "http://service.inke.com/api/user/relation/unfollow"
 },
 {
 "key": "USER_RELATION_REMOVEFANS",
 "url": "http://service.inke.com/api/user/relation/removefans"
 },
 {
 "key": "USER_RELATION_FOLLOWINGS",
 "url": "http://service.inke.com/api/user/relation/followings"
 },
 {
 "key": "USER_RELATION_RELATION",
 "url": "http://service.inke.com/api/user/relation/relation"
 },
 {
 "key": "USER_FANS",
 "url": "http://service.inke.com/api/user/relation/fans"
 },
 {
 "key": "USER_RELATION_NUMRELATIONS",
 "url": "http://service.inke.com/api/user/relation/numrelations"
 },
 {
 "key": "LIVE_INFO",
 "url": "http://service.inke.com/api/live/info"
 },
 {
 "key": "LIVE_UPDATE_INFO",
 "url": "http://service.inke.com/api/live/update"
 },
 {
 "key": "LIVE_HOMEPAGE",
 "url": "http://service.inke.com/api/live/homepage"
 },
 {
 "key": "LIVE_REPORT",
 "url": "http://service.inke.com/api/live/report"
 },
 {
 "key": "LIVE_PRE",
 "url": "http://service.inke.com/api/live/pre"
 },
 {
 "key": "LIVE_START",
 "url": "http://service.inke.com/api/live/start"
 },
 {
 "key": "LIVE_STOP",
 "url": "http://service.inke.com/api/live/stop"
 },
 {
 "key": "LIVE_KEEPALIVE",
 "url": "http://service.inke.com/api/live/keepalive"
 },
 {
 "key": "PUSH_UPLOAD",
 "url": "http://service.inke.com/push/uploadreg"
 },
 {
 "key": "LIVE_STAT",
 "url": "http://service.inke.com/api/live/stat"
 },
 {
 "key": "CHAT_CFG",
 "url": "http://service.inke.com/api/chat/cfg"
 },
 {
 "key": "USER_UPDATE_INFO",
 "url": "http://service.inke.com/api/user/update_info"
 },
 {
 "key": "USER_RELATION_BATCH_FOLLOW",
 "url": "http://service.inke.com/api/user/relation/batch_follow"
 },
 {
 "key": "USER_NOTIFY_BLOCK",
 "url": "http://service.inke.com/notify/block"
 },
 {
 "key": "USER_NOTIFY_UNBLOCK",
 "url": "http://service.inke.com/notify/unblock"
 },
 {
 "key": "USER_NOTIFY_RECENT",
 "url": "http://service.inke.com/api/notify/recent"
 },
 {
 "key": "USER_NOTIFY_SWITCH",
 "url": "http://service.inke.com/notify/switch"
 },
 {
 "key": "USER_NOTIFY_STAT",
 "url": "http://service.inke.com/notify/stat"
 },
 {
 "key": "ADVERTISE_GET",
 "url": "http://service.inke.com/advertise/get"
 },
 {
 "key": "CRASH_UPLOAD",
 "url": "http://service.inke.com/log/crash/upload"
 },
 {
 "key": "VOICE_PUSH_EX",
 "url": "http://service.inke.com/log/voicepush/eupload"
 },
 {
 "key": "VOICE_RECV_EX",
 "url": "http://service.inke.com/log/voicerecv/eupload"
 },
 {
 "key": "VOICE_PUSH_QA",
 "url": "http://service.inke.com/log/voicepush/qupload"
 },
 {
 "key": "VOICE_RECV_QA",
 "url": "http://service.inke.com/log/voicerecv/qupload"
 },
 {
 "key": "IP_REFLECT",
 "url": "http://service.inke.com/log/ip/reflect"
 },
 {
 "key": "USER_ACCOUNT_GUEST_LOGIN",
 "url": "http://service.inke.com/user/account/guest_login"
 },
 {
 "key": "LIVE_TIPS",
 "url": "http://service.inke.com/api/live/tips"
 },
 {
 "key": "USER_RELATION_MUTUAL",
 "url": "http://service.inke.com/api/user/relation/mutual"
 },
 {
 "key": "LIVE_ANNOUNCEMENT",
 "url": "http://service.inke.com/api/live/announcement"
 },
 {
 "key": "LIVE_STATISTIC",
 "url": "http://service.inke.com/api/live/statistic"
 },
 {
 "key": "LIVE_OPER_AUTH",
 "url": "http://service.inke.com/live/oper/auth?"
 },
 {
 "key": "GIFT_INFO",
 "url": "http://service.inke.com/api/resource/gift_info"
 },
 {
 "key": "GIFT_RESOURCE",
 "url": "http://service.inke.com/api/resource/gift"
 },
 {
 "key": "RANK_RESOURCE",
 "url": "http://service.inke.com/api/resource/rank"
 },
 {
 "key": "USER_STATISTIC_INFO",
 "url": "http://service.inke.com/api/statistic/info"
 },
 {
 "key": "USER_RANK",
 "url": "http://service.inke.com/api/statistic/rank"
 },
 {
 "key": "PAYMENT_INFO",
 "url": "http://payment.service.inke.com/api/payment/info"
 },
 {
 "key": "PAYMENT_CREATE",
 "url": "http://payment.service.inke.com/api/payment/create"
 },
 {
 "key": "PAYMENT_NOTICE",
 "url": "http://payment.service.inke.com/api/payment/notice"
 },
 {
 "key": "PAYMENT_AGREE",
 "url": "http://paynotify.service.inke.com/payment/agree"
 },
 {
 "key": "PAYMENT_SWITCH",
 "url": "http://payment.service.inke.com/api/payment/switch"
 },
 {
 "key": "EVENT_INFO",
 "url": "http://service.inke.com/api/event/info"
 },
 {
 "key": "CONVERSION_TOKEN",
 "url": "http://service.inke.com/api/conversion/token"
 },
 {
 "key": "EVENT_TRIGGER",
 "url": "http://service.inke.com/api/event/trigger"
 },
 {
 "key": "CONVERSION_IS_BIND",
 "url": "http://service.inke.com/api/conversion/is_bind"
 },
 {
 "key": "CONVERSION_BIND",
 "url": "http://service.inke.com/api/conversion/bind"
 },
 {
 "key": "CONVERSION_PROP",
 "url": "http://service.inke.com/api/conversion/prop"
 },
 {
 "key": "CONVERSION_MONEY",
 "url": "http://service.inke.com/api/conversion/money"
 },
 {
 "key": "CONVERSION_HISTORY",
 "url": "http://service.inke.com/api/conversion/history"
 },
 {
 "key": "CONVERSION_RATE",
 "url": "http://service.inke.com/api/conversion/rate"
 },
 {
 "key": "CONVERSION_LIST",
 "url": "http://service.inke.com/api/conversion/list"
 },
 {
 "key": "RANK_INFO_PAGE",
 "url": "https://api.busi.inke.tv/user-level/index"
 },
 {
 "key": "CONVERSION_QA",
 "url": "http://www.inke.tv/privacy/exchangehelp.html"
 },
 {
 "key": "USER_STATIATIC_CONTRIBUTION",
 "url": "http://service.inke.com/api/statistic/contribution"
 },
 {
 "key": "USER_STATISTIC_INOUT",
 "url": "http://service.inke.com/api/statistic/inout"
 },
 {
 "key": "ACCOMPAYN_SEARCH",
 "url": "http://service.inke.com/api/accompany/search"
 },
 {
 "key": "LRC_DOWNLOAD",
 "url": "http://lyric.meelive.cn/lrc/"
 },
 {
 "key": "BZ_MEDIAURL",
 "url": "http://m4a.inke.cn/m4a_64"
 },
 {
 "key": "DRC_DOWNLOAD",
 "url": "http://lrc.inke.cn/drc"
 },
 {
 "key": "USER_UPDATE_PROFILE",
 "url": "http://service.inke.com/api/user/update_profile"
 },
 {
 "key": "PAYMENT_WECHAT_NOTIFY",
 "url": "http://service5.pay.ingkee.com/api/payment/wechatNotify"
 },
 {
 "key": "MESSAGE_GET",
 "url": "http://service.inke.com/api/message/get"
 },
 {
 "key": "PAYMENT_PAYECO_NOTIFY",
 "url": "http://service5.pay.ingkee.com/api/payment/payecoNotify"
 },
 {
 "key": "MESSAGE_SEND",
 "url": "http://service.inke.com/api/message/send"
 },
 {
 "key": "MESSAGE_GET_SYS",
 "url": "http://service.inke.com/api/message/get_sys"
 },
 {
 "key": "MESSAGE_SEND_GIFT",
 "url": "http://service.inke.com/api/message/send_gift"
 },
 {
 "key": "LIVE_TICKER",
 "url": "http://service.inke.com/api/live/ticker"
 },
 {
 "key": "RECORD_LIST",
 "url": "http://service.inke.com/api/record/list"
 },
 {
 "key": "RECORD_INFO",
 "url": "http://service.inke.com/api/record/info"
 },
 {
 "key": "RECORD_NUMBER",
 "url": "http://service.inke.com/api/record/number"
 },
 {
 "key": "RECORD_USERS",
 "url": "http://service.inke.com/api/record/users"
 },
 {
 "key": "RECORD_DELETE",
 "url": "http://service.inke.com/api/record/delete"
 },
 {
 "key": "RECORD_CIRCLE",
 "url": "http://service.inke.com/api/record/circle"
 },
 {
 "key": "RECORD_JOIN",
 "url": "http://service.inke.com/api/record/join"
 },
 {
 "key": "VERIFIED_RESOURCE",
 "url": "http://service.inke.com/api/resource/verified"
 },
 {
 "key": "RECORD_VIEWED_NUMBER",
 "url": "http://service.inke.com/api/record/viewed_number"
 },
 {
 "key": "COMMON_LOG",
 "url": "http://service.inke.com/log/common/upload"
 },
 {
 "key": "LIVE_GET_ALL_IDS",
 "url": "http://service.inke.com/api/live/getallids"
 },
 {
 "key": "LIVE_SIMPLE_ALL",
 "url": "http://service.inke.com/api/live/simpleall"
 },
 {
 "key": "LIVE_GET_TOP",
 "url": "http://service.inke.com/api/live/gettop"
 },
 {
 "key": "LIVE_INFOS",
 "url": "http://service.inke.com/api/live/infos"
 },
 {
 "key": "LIVE_NEXT",
 "url": "http://service.inke.com/api/live/next"
 },
 {
 "key": "LIVE_NOW_PUBLISH",
 "url": "http://service.inke.com/api/live/now_publish"
 },
 {
 "key": "LIVE_SERVICEINFO",
 "url": "http://serviceinfo.inke.com/serviceinfo/info"
 },
 {
 "key": "LIVE_SERVICEINFO_VERIFY",
 "url": "http://serviceinfo.inke.tv/serviceinfo/verify"
 },
 {
 "key": "LIVE_SERVICEINFO_UPGRADE",
 "url": "http://serviceinfo.inke.tv/serviceinfo/upgrade"
 },
 {
 "key": "CONVERSION_BIND_PHONE",
 "url": "http://service.inke.com/api/conversion/bind_phone"
 },
 {
 "key": "CONVERSION_VOICE_CODE",
 "url": "http://service.inke.com/api/conversion/voice_code"
 },
 {
 "key": "CONVERSION_IS_PHONE_BIND",
 "url": "http://service.inke.com/api/conversion/is_phone_bind"
 },
 {
 "key": "EVENT_SHARE_CALLBACK",
 "url": "http://service.inke.com/api/event/share_callback"
 },
 {
 "key": "EVENT_SHARE",
 "url": "http://service.inke.com/api/event/share"
 },
 {
 "key": "USER_BLACKSTAT",
 "url": "http://service.inke.com/api/user/blackstat"
 },
 {
 "key": "USER_BLACKLIST",
 "url": "http://service.inke.com/api/user/blacklist"
 },
 {
 "key": "USER_DELBLACK",
 "url": "http://service.inke.com/api/user/delblack"
 },
 {
 "key": "USER_BLACK",
 "url": "http://service.inke.com/api/user/black"
 },
 {
 "key": "CONVERSION_BIND_V2",
 "url": "http://service.inke.com/api/conversion/bind_v2"
 },
 {
 "key": "LIVE_HOMEPAGE_NEW",
 "url": "http://service.inke.com/api/live/homepage_new"
 },
 {
 "key": "LIVE_FRIENDLIST",
 "url": "http://service.inke.com/api/live/friendlist"
 },
 {
 "key": "LIVE_UPDATE_OTHER",
 "url": "http://service.inke.com/api/live/update_other"
 },
 {
 "key": "FEEDBACK_REPORT",
 "url": "http://www.ingkee.com/help/index/home"
 },
 {
 "key": "LIVE_CFG",
 "url": "http://service.inke.com/api/live/cfg"
 },
 {
 "key": "IM_SIGNATURE",
 "url": "http://service.inke.com/im/signature"
 },
 {
 "key": "REDPACKET_HISTORY",
 "url": "http://service.inke.com/api/redpacket/history"
 },
 {
 "key": "REDPACKET_GAIN",
 "url": "http://service.inke.com/api/redpacket/gain"
 },
 {
 "key": "REDPACKET_OPEN",
 "url": "http://service.inke.com/api/redpacket/open"
 },
 {
 "key": "REPACKET_OPER",
 "url": "http://service.inke.com/api/redpacket/oper_switch"
 },
 {
 "key": "ACCOM_SWITCH",
 "url": "http://service.inke.com/api/accompany/switch"
 },
 {
 "key": "IP_LIST",
 "url": "http://service.inke.com/api/chat/iplist"
 },
 {
 "key": "VOICE_UPLOAD",
 "url": "http://upload.inke.com/upload/voice?"
 },
 {
 "key": "VOICE_DOWNLOAD",
 "url": "http://voice.meelive.cn/"
 },
 {
 "key": "USER_PHONE_LOGIN",
 "url": "http://service.inke.com/user/account/phone_login"
 },
 {
 "key": "USER_PHONE_CODE",
 "url": "http://service.inke.com/user/account/phone_code"
 },
 {
 "key": "LIVE_CONVERSION_TICKER",
 "url": "http://service.inke.com/api/live/conversion/ticker"
 },
 {
 "key": "PAYMENT_STATUS_NOTIFY",
 "url": "http://payment.service.inke.com/api/payment/statusNotify"
 },
 {
 "key": "PAY_LOG",
 "url": "http://service.inke.com/log/pay"
 },
 {
 "key": "MANAGER_ADD",
 "url": "http://service.inke.com/api/user/manager/add"
 },
 {
 "key": "MANAGER_DEL",
 "url": "http://service.inke.com/api/user/manager/del"
 },
 {
 "key": "MANAGER_LIST",
 "url": "http://service.inke.com/api/user/manager/list"
 },
 {
 "key": "LIVE_CLASSIFYINDEX",
 "url": "http://service.inke.com/api/live/classifyindex"
 },
 {
 "key": "LIVE_AGGREGATION",
 "url": "http://service.inke.com/api/live/aggregation"
 },
 {
 "key": "LIVE_AGGREGATIONTOP",
 "url": "http://service.inke.com/api/live/aggtop"
 },
 {
 "key": "LIVE_AGGNEXT",
 "url": "http://service.inke.com/api/live/aggnext"
 },
 {
 "key": "LIKE_RESOURCE",
 "url": "http://service.inke.com/api/resource/like"
 },
 {
 "key": "EVENT_VERIFY_CFG",
 "url": "http://service.inke.com/api/event/verify/cfg"
 },
 {
 "key": "EVENT_VERIFY_INFO",
 "url": "http://service.inke.com/api/event/verify/info"
 },
 {
 "key": "LIVE_COMMON_LOG",
 "url": "http://service.inke.com/log/common/live"
 },
 {
 "key": "USER_PHONE_BIND",
 "url": "http://service.inke.com/user/account/phone_bind"
 },
 {
 "key": "USER_PHONE_IS_BIND",
 "url": "http://service.inke.com/user/account/phone_is_bind"
 },
 {
 "key": "USER_ACCOUNT_SECRET",
 "url": "http://service.inke.com/user/account/logins"
 },
 {
 "key": "USER_ACCOUNT_TOKEN",
 "url": "http://service.inke.com/user/account/token"
 },
 {
 "key": "CONVERSION_RESOURCE",
 "url": "http://service.inke.com/api/conversion/resource"
 },
 {
 "key": "LIVE_TOPICINDEX",
 "url": "http://service.inke.com/api/live/topicindex"
 },
 {
 "key": "LIVE_TOPICGET",
 "url": "http://service.inke.com/api/live/topicget"
 },
 {
 "key": "LIVE_TOPICNEXT",
 "url": "http://service.inke.com/api/live/topicnext"
 },
 {
 "key": "USER_INKE_VERIFY",
 "url": "https://v.inke.com/user/index"
 },
 {
 "key": "USER_WEIBO_BIND",
 "url": "http://service.inke.com/api/user/weibo_bind"
 },
 {
 "key": "USER_WEIBO_ISBIND",
 "url": "http://service.inke.com/api/user/weibo_isbind"
 },
 {
 "key": "USER_WEIBO_UNBIND",
 "url": "http://service.inke.com/api/user/weibo_unbind"
 },
 {
 "key": "USER_HOT_UP",
 "url": "http://v.inke.com/api/hot/up"
 },
 {
 "key": "USER_HOT_REMAIN",
 "url": "http://v.inke.com/api/hot/remain"
 },
 {
 "key": "USER_SHOW",
 "url": "http://v.inke.com/api/user/show"
 },
 {
 "key": "USER_NAME_AUTH",
 "url": "http://api.busi.inke.tv/user/auth-page"
 },
 {
 "key": "USER_AUTH_INFO",
 "url": "http://api.busi.inke.tv/user/auth-info"
 },
 {
 "key": "LIVE_LINK_NUM",
 "url": "http://service.inke.com/api/live/link_num"
 },
 {
 "key": "LIVE_LINK_LIST",
 "url": "http://service.inke.com/api/live/link_list"
 },
 {
 "key": "LIVE_LINK_KEEP",
 "url": "http://service.inke.com/api/live/link_keep"
 },
 {
 "key": "APPLE_PAY_LOG",
 "url": "http://service.inke.com/log/newpay"
 },
 {
 "key": "TOPIC_TICKER",
 "url": "http://service.inke.com/api/live/topic_ticker"
 },
 {
 "key": "TOPIC_SEARCH",
 "url": "http://service.inke.com/api/live/topic_search"
 },
 {
 "key": "RECIVE_STAT",
 "url": "http://service.inke.com/api/recive/stat"
 },
 {
 "key": "RECIVE_SWITCH",
 "url": "http://service.inke.com/api/recive/statSwitch"
 },
 {
 "key": "CONVERSION_PROP_CUSTOM",
 "url": "http://service.inke.com/api/conversion/prop_custom"
 },
 {
 "key": "CONVERSION_POINT2GOLD",
 "url": "http://service.inke.com/api/conversion/point2gold"
 },
 {
 "key": "NICK_SEARCH",
 "url": "http://api.busi.inke.tv/nick/search"
 },
 {
 "key": "LOG_BASIC_RT",
 "url": "http://maidian.inke.com/log/common"
 },
 {
 "key": "LOG_BASIC_NRT",
 "url": "http://maidian.inke.com/log/batch"
 },
 {
 "key": "LOG_LIVE_QUALITY_RT",
 "url": "http://maidian.inke.com/log/stream"
 },
 {
 "key": "LOG_CLICK_PV_NRT",
 "url": "http://maidian.inke.com/log/click"
 },
 {
 "key": "LOG_USER_ACTION_NRT",
 "url": "http://maidian.inke.com/log/action"
 },
 {
 "key": "LOG_NETWORK_CHECK",
 "url": "http://service.inke.com"
 },
 {
 "key": "MIDAS_NOTIFY",
 "url": "http://midas.open.inke.cn/notify.php"
 },
 {
 "key": "MIDAS_QUERY",
 "url": "http://midas.open.inke.cn/query.php"
 },
 {
 "key": "MIDAS_CREATE",
 "url": "http://midas.open.inke.cn/create.php"
 },
 {
 "key": "MIDAS_CANCEL",
 "url": "http://midas.open.inke.cn/cancel.php"
 },
 {
 "key": "MIDAS_SIGNIN",
 "url": "http://midas.open.inke.cn/signin.php"
 },
 {
 "key": "GET_APP_CONFIG",
 "url": "http://web.service.inke.com/app/get_app_config"
 },
 {
 "key": "GPS_LOCATE_UPDATE",
 "url": "http://service.inke.com/api/gpslocate/update"
 },
 {
 "key": "GET_SDK_MULTIMEDIA_INFO",
 "url": "http://service5.inke.tv/api/sdk_multimedia/info"
 },
 {
 "key": "LOG_BASIC_RT_BK",
 "url": "http://maidian.inke.com/log/common"
 },
 {
 "key": "LOG_BASIC_NRT_BK",
 "url": "http://maidian.inke.com/log/batch"
 },
 {
 "key": "LOG_LIVE_QUALITY_RT_BK",
 "url": "http://maidian.inke.com/log/stream"
 },
 {
 "key": "LOG_CLICK_PV_NRT_BK",
 "url": "http://maidian.inke.com/log/click"
 },
 {
 "key": "LOG_USER_ACTION_NRT_BK",
 "url": "http://maidian.inke.com/log/action"
 },
 {
 "key": "LIVE_SPECIAL",
 "url": "http://webapi.busi.inke.cn/app/livespecial"
 },
 {
 "key": "LIVE_CITY_SEARCH",
 "url": "http://service.inke.com/api/live/citysearch"
 },
 {
 "key": "TAG_RESOURCE",
 "url": "http://service.inke.com/api/resource/tag"
 },
 {
 "key": "LIVE_NEAR_RECOMMEND",
 "url": "http://service.inke.com/api/live/near_recommend"
 },
 {
 "key": "CONVERSION_POINT2GOLD_SWITCH",
 "url": "http://service.inke.com/api/conversion/point2gold_switch"
 },
 {
 "key": "FLASH_SCREEN",
 "url": "http://webapi.busi.inke.cn/app/Flash_screen"
 },
 {
 "key": "USER_ACCOUNT_TOKEN_V2",
 "url": "http://service.inke.com/user/account/token_v2"
 },
 {
 "key": "SEND_FEED",
 "url": "http://service.inke.com/api/feed/send_feed"
 },
 {
 "key": "DEL_FEED",
 "url": "http://service.inke.com/api/feed/del_feed"
 },
 {
 "key": "SYNC_FEEDS",
 "url": "http://service.inke.com/api/feed/sync_feeds"
 },
 {
 "key": "MY_FEEDS",
 "url": "http://service.inke.com/api/feed/my_feeds"
 },
 {
 "key": "FEEDS",
 "url": "http://service.inke.com/api/feed/feeds"
 },
 {
 "key": "FEED_VIEW",
 "url": "http://service.inke.com/api/feed/feed_view"
 },
 {
 "key": "FEED_SETTING",
 "url": "http://service.inke.com/api/feed/feed_setting"
 },
 {
 "key": "GET_FEED_RESOURCE",
 "url": "http://service.inke.com/api/feed/get_resource"
 },
 {
 "key": "GET_FEED_SETTING",
 "url": "http://service.inke.com/api/feed/get_setting"
 },
 {
 "key": "GET_FEED_CONFIG",
 "url": "http://service.inke.com/api/feed/get_config"
 },
 {
 "key": "RECOMMEND_AGGREGATE",
 "url": "http://service.inke.com/api/recommend/aggregate"
 },
 {
 "key": "THEME_SEARCH",
 "url": "http://service.inke.com/api/live/themesearch"
 },
 {
 "key": "UPLOAD_TOKEN",
 "url": "http://upload.inke.com/api/upload/token"
 },
 {
 "key": "DAY_BILL_BOARD_INOUT",
 "url": "http://service.inke.com/api/day_bill_board/inout"
 },
 {
 "key": "DAY_BILL_BOARD_BOARD",
 "url": "http://service.inke.com/api/day_bill_board/board"
 },
 {
 "key": "DIAGNOSIS_NET_LIST",
 "url": "http://service.inke.com/api/dns/diagnosis_list"
 },
 {
 "key": "SWIPE_INFO",
 "url": "http://webapi.busi.inke.cn/app/Swipe_info"
 },
 {
 "key": "FEEDS_GROUP",
 "url": "http://service.inke.com/api/feed/feeds_group"
 },
 {
 "key": "LIVE_LINK_ADDR",
 "url": "http://service.inke.com/api/live/link_addr"
 },
 {
 "key": "SERVICEINFO_LAYOUT",
 "url": "http://serviceinfo.inke.com/serviceinfo/layout"
 },
 {
 "key": "UA_LINK_INFO",
 "url": "http://service.inke.com/link/ipinfo"
 },
 {
 "key": "PHONE_SHOW_CONFIG",
 "url": "http://webapi.busi.inke.cn/app/bind_phone_get_show_config"
 },
 {
 "key": "USER_STATIATIC_HIDE",
 "url": "http://service.inke.com/api/statistic/hide"
 },
 {
 "key": "LIVE_TAB_SUB_STATUS",
 "url": "http://service.inke.com/api/live/tab_sub_status"
 },
 {
 "key": "LIVE_TAB_UNSUB",
 "url": "http://service.inke.com/api/live/tab_unsub"
 },
 {
 "key": "LIVE_TAB_SUB",
 "url": "http://service.inke.com/api/live/tab_sub"
 },
 {
 "key": "LIVE_NAVIGATION",
 "url": "http://service.inke.com/api/live/navigation"
 },
 {
 "key": "TAB_TICKER",
 "url": "http://webapi.busi.inke.cn/service/ticker"
 },
 {
 "key": "LIVE_ACCOMPANY_STAT",
 "url": "http://service.inke.com/api/live/accompanystat"
 },
 {
 "key": "GIFT_PACKS_INFO",
 "url": "http://giftapi.busi.inke.cn/giftpacks/gift_info"
 },
 {
 "key": "GIFT_PACKS_RECORD_REPORT",
 "url": "http://giftapi.busi.inke.cn/giftpacks/records_report"
 },
 {
 "key": "GIFT_PACKS_GIFT_ORDER_CREATE",
 "url": "http://giftapi.busi.inke.cn/giftpacks/gift_order_create"
 },
 {
 "key": "PHONE_BIND_SHOW_CHECK",
 "url": "http://service.inke.com/app/phone_bind_show_check"
 },
 {
 "key": "DIALOG_SHOW_CHECK",
 "url": "http://service.inke.com/app/dialog_show_check"
 },
 {
 "key": "ROOM_BTN_SHOW_CHECK",
 "url": "http://service.inke.com/app/room_btn_show_check"
 },
 {
 "key": "DIALOG_CLICKED",
 "url": "http://service.inke.com/app/dialog_clicked"
 },
 {
 "key": "ROOM_BTN_CLICKED",
 "url": "http://service.inke.com/app/room_btn_clicked"
 },
 {
 "key": "FEED_GATHER",
 "url": "http://service.inke.com/api/feed/gather"
 },
 {
 "key": "CERTIF_GET_SIGNATURE",
 "url": "http://api.busi.inke.cn/certification/get-signature"
 },
 {
 "key": "CERTIF_USER_INFO",
 "url": "http://api.busi.inke.cn/certification/user-info"
 },
 {
 "key": "CERTIF_AUTH_PAGE",
 "url": "http://api.busi.inke.cn/certification/auth-page"
 },
 {
 "key": "LIVE_NEAR_FLOW",
 "url": "http://service.inke.com/api/live/near_flow_old"
 },
 {
 "key": "LIVE_NEAR_SWITCH",
 "url": "http://service.inke.com/"
 },
 {
 "key": "LIVE_SHARE_ADDR",
 "url": "http://service.inke.com/api/live/share_addr"
 },
 {
 "key": "LIVE_REC_PART",
 "url": "http://service.inke.com/api/live/recpart"
 },
 {
 "key": "SWITCH_INFO",
 "url": "http://service.inke.com/api/switch/info"
 },
 {
 "key": "GET_SDK_INFO",
 "url": "http://service.inke.com/api/sdk/info"
 },
 {
 "key": "USER_ACCOUNT_CODE",
 "url": "http://service.inke.com/api/user/account/code_login"
 },
 {
 "key": "MSG_CHARGE_FAIL",
 "url": "http://service.inke.com/api/message/charge_fail"
 },
 {
 "key": "FEED_GET_MUSIC",
 "url": "http://service.inke.com/api/feed/get_music"
 },
 {
 "key": "FEED_UPLOAD_MUSIC",
 "url": "http://service.inke.com/api/feed/upload_music"
 },
 {
 "key": "GET_FEED",
 "url": "http://service.inke.com/api/feed/get_feed"
 },
 {
 "key": "USER_LABEL_TIME",
 "url": "http://service.inke.com/user/label/LabelTime"
 },
 {
 "key": "USER_FETCH_LABELS",
 "url": "http://service.inke.com/user/label/FetchLabels"
 },
 {
 "key": "USER_TAG_LABEL",
 "url": "http://service.inke.com/user/label/TagLabel"
 },
 {
 "key": "USER_TOP_LABELS",
 "url": "http://service.inke.com/user/label/TopLabels"
 },
 {
 "key": "LIVE_CHAT_COUNT",
 "url": "http://service.inke.com/api/live/chat_count"
 },
 {
 "key": "USER_LIVING",
 "url": "http://service.inke.com/api/user/living"
 },
 {
 "key": "BUS_CVSWITCH",
 "url": "http://service.inke.com/api/business/cvswitch"
 },
 {
 "key": "APP_WITHDRAWAL",
 "url": "http://act.inke.cn/app/withdrawal/index.html"
 },
 {
 "key": "LIVE_REPORT_REASON",
 "url": "http://service.inke.com/api/report/reason"
 },
 {
 "key": "PUSH_MERGE_GET_LIVING",
 "url": "http://service.inke.cn/push_merge/get_living"
 },
 {
 "key": "GAME_TAB_NAVIGATION",
 "url": "http://service.inke.cn/game/live/navigation"
 },
 {
 "key": "GAME_THEMETOP",
 "url": "http://service.inke.cn/game/live/themetop"
 },
 {
 "key": "GAME_COVER_UPLOAD",
 "url": "http://service.inke.cn/api/game/cover_upload"
 },
 {
 "key": "GAME_THEMESEARCH",
 "url": "http://service.inke.cn/game/live/themesearch"
 },
 {
 "key": "AB_TEST",
 "url": "http://service.inke.com/api/abtest/info"
 },
 {
 "key": "LIVE_RECOMMEND_DELETE",
 "url": "http://service.inke.com/api/live/recommend_delete"
 },
 {
 "key": "GAME_START_PAGE",
 "url": "http://act.inke.cn/banner/201701/game.html"
 },
 {
 "key": "VIRTUAL_FACE_RESOURCE",
 "url": "http://service.inke.com/api/resource/virtual"
 },
 {
 "key": "BUSINESS_TASKNUM",
 "url": "http://service.inke.com/api/bussiness/task_num"
 },
 {
 "key": "BUSINESS_ADPOINT",
 "url": "http://service.inke.com/api/business/adpoint"
 },
 {
 "key": "ECONOMY_MYSELF",
 "url": "http://act.inke.cn/app/economy/task.html?curr=2"
 },
 {
 "key": "ECONOMY_INDEX",
 "url": "http://act.inke.cn/app/economy/index.html"
 },
 {
 "key": "FEEDS_LIKE_LIKE",
 "url": "http://service.inke.com/api/feeds_like/like"
 },
 {
 "key": "FEEDS_LIKE_UNLIKE",
 "url": "http://service.inke.com/api/feeds_like/unlike"
 },
 {
 "key": "FEEDS_LIKE_IS_LIKED",
 "url": "http://service.inke.com/api/feeds_like/is_liked"
 },
 {
 "key": "FEEDS_TAB_TOPS",
 "url": "http://service.inke.com/api/feeds_tab/tops"
 },
 {
 "key": "FEEDS_TAB_RECOMMENDS",
 "url": "http://service.inke.com/api/feeds_tab/recommends"
 },
 {
 "key": "LIVE_GAMELIST",
 "url": "http://service.inke.com/api/live/gamelist"
 },
 {
 "key": "APP_ENTRY_SHOW_CHECK",
 "url": "http://service.inke.com/app/entry/show_check"
 },
 {
 "key": "APP_ENTRY_CLICKED",
 "url": "http://service.inke.com/app/entry/clicked"
 },
 {
 "key": "FEED_MISC",
 "url": "http://service.inke.com/api/feed/feed_misc"
 },
 {
 "key": "APP_ENTRY_SWITCH",
 "url": "http://service.inke.com/app/entry/switch"
 },
 {
 "key": "GET_FEEDS",
 "url": "http://service.inke.com/api/feed/get_feeds"
 },
 {
 "key": "USER_TRENDS",
 "url": "http://service.inke.com/api/user/trends"
 },
 {
 "key": "MEDIA_CONFIG",
 "url": "http://service.inke.com/api/media/media_config"
 },
 {
 "key": "PAY_HELP_PAGE",
 "url": "https://act.inke.cn/app/childe-page/payhelp.html"
 }
	],
	"switch": [
 {
 "default": 0,
 "name": "near_video",
 "switch": 0
 },
 {
 "default": 1,
 "name": "video_native_file_upload",
 "switch": 1
 },
 {
 "default": 0,
 "name": "ua_link",
 "switch": 0
 },
 {
 "default": 0,
 "name": "first_login_enter_room",
 "switch": 0
 },
 {
 "default": 1,
 "name": "gender_color_chat",
 "switch": 1
 },
 {
 "default": 1,
 "name": "wechat_code_login",
 "switch": 1
 },
 {
 "default": 1,
 "name": "sync_feed",
 "switch": 1
 },
 {
 "default": 1,
 "name": "multi_tab",
 "switch": 1
 },
 {
 "default": 0,
 "name": "record_share_video",
 "switch": 0
 },
 {
 "default": 1,
 "name": "gift_packs_record_report",
 "switch": 1
 },
 {
 "default": 0,
 "name": "game_start_page",
 "switch": 1
 },
 {
 "default": 1,
 "name": "video_pre_dowload",
 "switch": 1
 },
 {
 "default": 0,
 "name": "feed_gift_like",
 "switch": 0
 },
 {
 "default": 1,
 "name": "send_feed",
 "switch": 1
 },
 {
 "default": 1,
 "name": "record_screen",
 "switch": 1
 },
 {
 "default": 0,
 "name": "rec_part",
 "switch": 0
 },
 {
 "default": 1,
 "name": "video_pre_download",
 "switch": 1
 },
 {
 "default": 1,
 "name": "videochat_effect",
 "switch": 1
 },
 {
 "default": 1,
 "name": "gift_packs_info",
 "switch": 1
 },
 {
 "default": 0,
 "name": "label_the_publisher",
 "switch": 0
 },
 {
 "default": 1,
 "name": "switch_screen",
 "switch": 1
 }
	]
 }
 */
@end
