// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/bank.jce'
// **********************************************************************

#import "JceObjectV2.h"

@interface ApolloTRespWeiXiRefundOrder : JceObjectV2

@property (nonatomic, retain, JV2_PROP_GS_V2(result_code,setResult_code:)) NSString* JV2_PROP_NM(r,0,result_code);
@property (nonatomic, retain, JV2_PROP_GS_V2(transaction_id,setTransaction_id:)) NSString* JV2_PROP_NM(r,1,transaction_id);
@property (nonatomic, retain, JV2_PROP_GS_V2(out_trade_no,setOut_trade_no:)) NSString* JV2_PROP_NM(r,2,out_trade_no);
@property (nonatomic, retain, JV2_PROP_GS_V2(out_refund_no,setOut_refund_no:)) NSString* JV2_PROP_NM(r,3,out_refund_no);
@property (nonatomic, retain, JV2_PROP_GS_V2(refund_id,setRefund_id:)) NSString* JV2_PROP_NM(r,4,refund_id);
@property (nonatomic, retain, JV2_PROP_GS_V2(refund_channel,setRefund_channel:)) NSString* JV2_PROP_NM(r,5,refund_channel);
@property (nonatomic, assign, JV2_PROP_GS_V2(refund_fee,setRefund_fee:)) JceInt32 JV2_PROP_NM(r,6,refund_fee);
@property (nonatomic, assign, JV2_PROP_GS_V2(total_fee,setTotal_fee:)) JceInt32 JV2_PROP_NM(r,7,total_fee);

@end
