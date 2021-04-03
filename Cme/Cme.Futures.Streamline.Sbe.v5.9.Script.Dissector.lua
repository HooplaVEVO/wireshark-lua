-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Cme Futures Streamline Sbe 5.9 Protocol
local cme_futures_streamline_sbe_v5_9 = Proto("Cme.Futures.Streamline.Sbe.v5.9.Lua", "Cme Futures Streamline Sbe 5.9")

-- Component Tables
local show = {}
local format = {}
local display = {}
local dissect = {}
local size_of = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Cme Futures Streamline Sbe 5.9 Fields
cme_futures_streamline_sbe_v5_9.fields.accrual_days = ProtoField.new("Accrual Days", "cme.futures.streamline.sbe.v5.9.accrualdays", ftypes.UINT32)
cme_futures_streamline_sbe_v5_9.fields.accrued_coupons = ProtoField.new("Accrued Coupons", "cme.futures.streamline.sbe.v5.9.accruedcoupons", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.actual = ProtoField.new("Actual", "cme.futures.streamline.sbe.v5.9.actual", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x02")
cme_futures_streamline_sbe_v5_9.fields.admin_login_315 = ProtoField.new("Admin Login 315", "cme.futures.streamline.sbe.v5.9.adminlogin315", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.admin_logout_316 = ProtoField.new("Admin Logout 316", "cme.futures.streamline.sbe.v5.9.adminlogout316", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.aggressor_side = ProtoField.new("Aggressor Side", "cme.futures.streamline.sbe.v5.9.aggressorside", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.appl_id = ProtoField.new("Appl Id", "cme.futures.streamline.sbe.v5.9.applid", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.batch_total_messages = ProtoField.new("Batch Total Messages", "cme.futures.streamline.sbe.v5.9.batchtotalmessages", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.binary_packet_header = ProtoField.new("Binary Packet Header", "cme.futures.streamline.sbe.v5.9.binarypacketheader", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.block_length = ProtoField.new("Block Length", "cme.futures.streamline.sbe.v5.9.blocklength", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.cal_fut_px = ProtoField.new("Cal Fut Px", "cme.futures.streamline.sbe.v5.9.calfutpx", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.coupon_rate = ProtoField.new("Coupon Rate", "cme.futures.streamline.sbe.v5.9.couponrate", ftypes.INT32)
cme_futures_streamline_sbe_v5_9.fields.currency = ProtoField.new("Currency", "cme.futures.streamline.sbe.v5.9.currency", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.d_v_01 = ProtoField.new("D V 01", "cme.futures.streamline.sbe.v5.9.dv01", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.daily_incremental_eris_pai = ProtoField.new("Daily Incremental Eris Pai", "cme.futures.streamline.sbe.v5.9.dailyincrementalerispai", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.day = ProtoField.new("Day", "cme.futures.streamline.sbe.v5.9.day", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.end_of_event = ProtoField.new("End Of Event", "cme.futures.streamline.sbe.v5.9.endofevent", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x80")
cme_futures_streamline_sbe_v5_9.fields.eris_pai = ProtoField.new("Eris Pai", "cme.futures.streamline.sbe.v5.9.erispai", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.event_time = ProtoField.new("Event Time", "cme.futures.streamline.sbe.v5.9.eventtime", ftypes.UINT64)
cme_futures_streamline_sbe_v5_9.fields.event_type = ProtoField.new("Event Type", "cme.futures.streamline.sbe.v5.9.eventtype", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.events_group = ProtoField.new("Events Group", "cme.futures.streamline.sbe.v5.9.eventsgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.events_groups = ProtoField.new("Events Groups", "cme.futures.streamline.sbe.v5.9.eventsgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.exponent = ProtoField.new("Exponent", "cme.futures.streamline.sbe.v5.9.exponent", ftypes.INT8)
cme_futures_streamline_sbe_v5_9.fields.fair_coupon_pct = ProtoField.new("Fair Coupon Pct", "cme.futures.streamline.sbe.v5.9.faircouponpct", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.fed_funds_date = ProtoField.new("Fed Funds Date", "cme.futures.streamline.sbe.v5.9.fedfundsdate", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.fed_funds_rate = ProtoField.new("Fed Funds Rate", "cme.futures.streamline.sbe.v5.9.fedfundsrate", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.final_daily = ProtoField.new("Final Daily", "cme.futures.streamline.sbe.v5.9.finaldaily", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x01")
cme_futures_streamline_sbe_v5_9.fields.final_settlement_futures_price = ProtoField.new("Final Settlement Futures Price", "cme.futures.streamline.sbe.v5.9.finalsettlementfuturesprice", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.fixed_npv = ProtoField.new("Fixed Npv", "cme.futures.streamline.sbe.v5.9.fixednpv", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.fixed_payment = ProtoField.new("Fixed Payment", "cme.futures.streamline.sbe.v5.9.fixedpayment", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.float_npv = ProtoField.new("Float Npv", "cme.futures.streamline.sbe.v5.9.floatnpv", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.floating_payment = ProtoField.new("Floating Payment", "cme.futures.streamline.sbe.v5.9.floatingpayment", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.group_size = ProtoField.new("Group Size", "cme.futures.streamline.sbe.v5.9.groupsize", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.group_size_encoding = ProtoField.new("Group Size Encoding", "cme.futures.streamline.sbe.v5.9.groupsizeencoding", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.headline = ProtoField.new("Headline", "cme.futures.streamline.sbe.v5.9.headline", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.heart_bt_int = ProtoField.new("Heart Bt Int", "cme.futures.streamline.sbe.v5.9.heartbtint", ftypes.INT8)
cme_futures_streamline_sbe_v5_9.fields.inst_attrib_group = ProtoField.new("Inst Attrib Group", "cme.futures.streamline.sbe.v5.9.instattribgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.inst_attrib_groups = ProtoField.new("Inst Attrib Groups", "cme.futures.streamline.sbe.v5.9.instattribgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.inst_attrib_type = ProtoField.new("Inst Attrib Type", "cme.futures.streamline.sbe.v5.9.instattribtype", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.inst_attrib_value = ProtoField.new("Inst Attrib Value", "cme.futures.streamline.sbe.v5.9.instattribvalue", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.interpolation_factor = ProtoField.new("Interpolation Factor", "cme.futures.streamline.sbe.v5.9.interpolationfactor", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.last_implied_msg = ProtoField.new("Last Implied Msg", "cme.futures.streamline.sbe.v5.9.lastimpliedmsg", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x10")
cme_futures_streamline_sbe_v5_9.fields.last_quote_msg = ProtoField.new("Last Quote Msg", "cme.futures.streamline.sbe.v5.9.lastquotemsg", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x04")
cme_futures_streamline_sbe_v5_9.fields.last_stats_msg = ProtoField.new("Last Stats Msg", "cme.futures.streamline.sbe.v5.9.laststatsmsg", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x08")
cme_futures_streamline_sbe_v5_9.fields.last_trade_msg = ProtoField.new("Last Trade Msg", "cme.futures.streamline.sbe.v5.9.lasttrademsg", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x01")
cme_futures_streamline_sbe_v5_9.fields.last_volume_msg = ProtoField.new("Last Volume Msg", "cme.futures.streamline.sbe.v5.9.lastvolumemsg", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x02")
cme_futures_streamline_sbe_v5_9.fields.leg_benchmark_curve_name = ProtoField.new("Leg Benchmark Curve Name", "cme.futures.streamline.sbe.v5.9.legbenchmarkcurvename", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.leg_contract_multiplier = ProtoField.new("Leg Contract Multiplier", "cme.futures.streamline.sbe.v5.9.legcontractmultiplier", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.leg_credit_rating = ProtoField.new("Leg Credit Rating", "cme.futures.streamline.sbe.v5.9.legcreditrating", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.leg_currency = ProtoField.new("Leg Currency", "cme.futures.streamline.sbe.v5.9.legcurrency", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.leg_date_offset = ProtoField.new("Leg Date Offset", "cme.futures.streamline.sbe.v5.9.legdateoffset", ftypes.INT8)
cme_futures_streamline_sbe_v5_9.fields.leg_pay_frequencey = ProtoField.new("Leg Pay Frequencey", "cme.futures.streamline.sbe.v5.9.legpayfrequencey", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.leg_purchase_rate = ProtoField.new("Leg Purchase Rate", "cme.futures.streamline.sbe.v5.9.legpurchaserate", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.leg_ratio_qty = ProtoField.new("Leg Ratio Qty", "cme.futures.streamline.sbe.v5.9.legratioqty", ftypes.INT32)
cme_futures_streamline_sbe_v5_9.fields.leg_ref_id = ProtoField.new("Leg Ref Id", "cme.futures.streamline.sbe.v5.9.legrefid", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.leg_security_group = ProtoField.new("Leg Security Group", "cme.futures.streamline.sbe.v5.9.legsecuritygroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.leg_security_type = ProtoField.new("Leg Security Type", "cme.futures.streamline.sbe.v5.9.legsecuritytype", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.leg_side = ProtoField.new("Leg Side", "cme.futures.streamline.sbe.v5.9.legside", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.leg_symbol = ProtoField.new("Leg Symbol", "cme.futures.streamline.sbe.v5.9.legsymbol", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.lines_of_text_group = ProtoField.new("Lines Of Text Group", "cme.futures.streamline.sbe.v5.9.linesoftextgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.lines_of_text_groups = ProtoField.new("Lines Of Text Groups", "cme.futures.streamline.sbe.v5.9.linesoftextgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_feed_types_group = ProtoField.new("M D Feed Types Group", "cme.futures.streamline.sbe.v5.9.mdfeedtypesgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_feed_types_groups = ProtoField.new("M D Feed Types Groups", "cme.futures.streamline.sbe.v5.9.mdfeedtypesgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_eris_group = ProtoField.new("M D Incremental Refresh Eris Group", "cme.futures.streamline.sbe.v5.9.mdincrementalrefresherisgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_eris_groups = ProtoField.new("M D Incremental Refresh Eris Groups", "cme.futures.streamline.sbe.v5.9.mdincrementalrefresherisgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group = ProtoField.new("M D Incremental Refresh Eris Reference Data And Daily Statistics Group", "cme.futures.streamline.sbe.v5.9.mdincrementalrefresherisreferencedataanddailystatisticsgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups = ProtoField.new("M D Incremental Refresh Eris Reference Data And Daily Statistics Groups", "cme.futures.streamline.sbe.v5.9.mdincrementalrefresherisreferencedataanddailystatisticsgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_indices_group = ProtoField.new("M D Incremental Refresh Indices Group", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshindicesgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_indices_groups = ProtoField.new("M D Incremental Refresh Indices Groups", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshindicesgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_otc_group = ProtoField.new("M D Incremental Refresh Otc Group", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshotcgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_otc_groups = ProtoField.new("M D Incremental Refresh Otc Groups", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshotcgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_trade_blocks_group = ProtoField.new("M D Incremental Refresh Trade Blocks Group", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshtradeblocksgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_trade_blocks_groups = ProtoField.new("M D Incremental Refresh Trade Blocks Groups", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshtradeblocksgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_instrument_definition_eris_leg_group = ProtoField.new("M D Instrument Definition Eris Leg Group", "cme.futures.streamline.sbe.v5.9.mdinstrumentdefinitionerisleggroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.m_d_instrument_definition_eris_leg_groups = ProtoField.new("M D Instrument Definition Eris Leg Groups", "cme.futures.streamline.sbe.v5.9.mdinstrumentdefinitionerisleggroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.mantissa32 = ProtoField.new("Mantissa32", "cme.futures.streamline.sbe.v5.9.mantissa32", ftypes.INT32)
cme_futures_streamline_sbe_v5_9.fields.mantissa64 = ProtoField.new("Mantissa64", "cme.futures.streamline.sbe.v5.9.mantissa64", ftypes.INT64)
cme_futures_streamline_sbe_v5_9.fields.market_depth = ProtoField.new("Market Depth", "cme.futures.streamline.sbe.v5.9.marketdepth", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.market_sector = ProtoField.new("Market Sector", "cme.futures.streamline.sbe.v5.9.marketsector", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.match_event_indicator = ProtoField.new("Match Event Indicator", "cme.futures.streamline.sbe.v5.9.matcheventindicator", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.maturity_date = ProtoField.new("Maturity Date", "cme.futures.streamline.sbe.v5.9.maturitydate", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.maturity_month_year = ProtoField.new("Maturity Month Year", "cme.futures.streamline.sbe.v5.9.maturitymonthyear", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_entry_code = ProtoField.new("Md Entry Code", "cme.futures.streamline.sbe.v5.9.mdentrycode", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.md_entry_date = ProtoField.new("Md Entry Date", "cme.futures.streamline.sbe.v5.9.mdentrydate", ftypes.INT32)
cme_futures_streamline_sbe_v5_9.fields.md_entry_id = ProtoField.new("Md Entry Id", "cme.futures.streamline.sbe.v5.9.mdentryid", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_entry_position_no = ProtoField.new("Md Entry Position No", "cme.futures.streamline.sbe.v5.9.mdentrypositionno", ftypes.INT32)
cme_futures_streamline_sbe_v5_9.fields.md_entry_px = ProtoField.new("Md Entry Px", "cme.futures.streamline.sbe.v5.9.mdentrypx", ftypes.INT64)
cme_futures_streamline_sbe_v5_9.fields.md_entry_size = ProtoField.new("Md Entry Size", "cme.futures.streamline.sbe.v5.9.mdentrysize", ftypes.UINT64)
cme_futures_streamline_sbe_v5_9.fields.md_entry_time = ProtoField.new("Md Entry Time", "cme.futures.streamline.sbe.v5.9.mdentrytime", ftypes.INT32)
cme_futures_streamline_sbe_v5_9.fields.md_entry_type = ProtoField.new("Md Entry Type", "cme.futures.streamline.sbe.v5.9.mdentrytype", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_feed_type = ProtoField.new("Md Feed Type", "cme.futures.streamline.sbe.v5.9.mdfeedtype", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_eris_351 = ProtoField.new("Md Incremental Refresh Eris 351", "cme.futures.streamline.sbe.v5.9.mdincrementalrefresheris351", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_eris_353 = ProtoField.new("Md Incremental Refresh Eris 353", "cme.futures.streamline.sbe.v5.9.mdincrementalrefresheris353", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_eris_reference_data_and_daily_statistics_333 = ProtoField.new("Md Incremental Refresh Eris Reference Data And Daily Statistics 333", "cme.futures.streamline.sbe.v5.9.mdincrementalrefresherisreferencedataanddailystatistics333", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_indices_348 = ProtoField.new("Md Incremental Refresh Indices 348", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshindices348", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_ot_c_356 = ProtoField.new("Md Incremental Refresh Ot C 356", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshotc356", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_ot_c_366 = ProtoField.new("Md Incremental Refresh Ot C 366", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshotc366", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_trade_blocks_340 = ProtoField.new("Md Incremental Refresh Trade Blocks 340", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshtradeblocks340", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_trade_blocks_349 = ProtoField.new("Md Incremental Refresh Trade Blocks 349", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshtradeblocks349", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_trade_blocks_365 = ProtoField.new("Md Incremental Refresh Trade Blocks 365", "cme.futures.streamline.sbe.v5.9.mdincrementalrefreshtradeblocks365", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_instrument_definition_eris_363 = ProtoField.new("Md Instrument Definition Eris 363", "cme.futures.streamline.sbe.v5.9.mdinstrumentdefinitioneris363", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_instrument_definition_indices_347 = ProtoField.new("Md Instrument Definition Indices 347", "cme.futures.streamline.sbe.v5.9.mdinstrumentdefinitionindices347", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_news_indices_339 = ProtoField.new("Md News Indices 339", "cme.futures.streamline.sbe.v5.9.mdnewsindices339", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.md_update_action = ProtoField.new("Md Update Action", "cme.futures.streamline.sbe.v5.9.mdupdateaction", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.message = ProtoField.new("Message", "cme.futures.streamline.sbe.v5.9.message", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.message_header = ProtoField.new("Message Header", "cme.futures.streamline.sbe.v5.9.messageheader", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.message_sequence_number = ProtoField.new("Message Sequence Number", "cme.futures.streamline.sbe.v5.9.messagesequencenumber", ftypes.UINT32)
cme_futures_streamline_sbe_v5_9.fields.message_size = ProtoField.new("Message Size", "cme.futures.streamline.sbe.v5.9.messagesize", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.min_price_increment = ProtoField.new("Min Price Increment", "cme.futures.streamline.sbe.v5.9.minpriceincrement", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.month = ProtoField.new("Month", "cme.futures.streamline.sbe.v5.9.month", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.net_chg_prev_day = ProtoField.new("Net Chg Prev Day", "cme.futures.streamline.sbe.v5.9.netchgprevday", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.net_pct_chg = ProtoField.new("Net Pct Chg", "cme.futures.streamline.sbe.v5.9.netpctchg", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.next_fixed_payment_amount = ProtoField.new("Next Fixed Payment Amount", "cme.futures.streamline.sbe.v5.9.nextfixedpaymentamount", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.next_fixed_payment_date = ProtoField.new("Next Fixed Payment Date", "cme.futures.streamline.sbe.v5.9.nextfixedpaymentdate", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.next_floating_payment_amount = ProtoField.new("Next Floating Payment Amount", "cme.futures.streamline.sbe.v5.9.nextfloatingpaymentamount", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.next_floating_payment_date = ProtoField.new("Next Floating Payment Date", "cme.futures.streamline.sbe.v5.9.nextfloatingpaymentdate", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.nominal = ProtoField.new("Nominal", "cme.futures.streamline.sbe.v5.9.nominal", ftypes.UINT64)
cme_futures_streamline_sbe_v5_9.fields.notional_percentage_outstanding = ProtoField.new("Notional Percentage Outstanding", "cme.futures.streamline.sbe.v5.9.notionalpercentageoutstanding", ftypes.INT32)
cme_futures_streamline_sbe_v5_9.fields.npv = ProtoField.new("Npv", "cme.futures.streamline.sbe.v5.9.npv", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.null_value = ProtoField.new("Null Value", "cme.futures.streamline.sbe.v5.9.nullvalue", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x80")
cme_futures_streamline_sbe_v5_9.fields.num_in_group = ProtoField.new("Num In Group", "cme.futures.streamline.sbe.v5.9.numingroup", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.number_of_orders = ProtoField.new("Number Of Orders", "cme.futures.streamline.sbe.v5.9.numberoforders", ftypes.INT32)
cme_futures_streamline_sbe_v5_9.fields.open_close_settl_flag = ProtoField.new("Open Close Settl Flag", "cme.futures.streamline.sbe.v5.9.openclosesettlflag", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.orig_time = ProtoField.new("Orig Time", "cme.futures.streamline.sbe.v5.9.origtime", ftypes.UINT64)
cme_futures_streamline_sbe_v5_9.fields.p_v_01 = ProtoField.new("P V 01", "cme.futures.streamline.sbe.v5.9.pv01", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.packet = ProtoField.new("Packet", "cme.futures.streamline.sbe.v5.9.packet", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.payload = ProtoField.new("Payload", "cme.futures.streamline.sbe.v5.9.payload", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.percent_trading = ProtoField.new("Percent Trading", "cme.futures.streamline.sbe.v5.9.percenttrading", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.previous_eris_pai = ProtoField.new("Previous Eris Pai", "cme.futures.streamline.sbe.v5.9.previouserispai", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.previous_fixing_date = ProtoField.new("Previous Fixing Date", "cme.futures.streamline.sbe.v5.9.previousfixingdate", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.previous_fixing_rate = ProtoField.new("Previous Fixing Rate", "cme.futures.streamline.sbe.v5.9.previousfixingrate", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.price_type = ProtoField.new("Price Type", "cme.futures.streamline.sbe.v5.9.pricetype", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.product = ProtoField.new("Product", "cme.futures.streamline.sbe.v5.9.product", ftypes.INT8)
cme_futures_streamline_sbe_v5_9.fields.product_complex = ProtoField.new("Product Complex", "cme.futures.streamline.sbe.v5.9.productcomplex", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.put_or_call = ProtoField.new("Put Or Call", "cme.futures.streamline.sbe.v5.9.putorcall", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.quote_condition = ProtoField.new("Quote Condition", "cme.futures.streamline.sbe.v5.9.quotecondition", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.quote_req_id = ProtoField.new("Quote Req Id", "cme.futures.streamline.sbe.v5.9.quotereqid", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.quote_request_345 = ProtoField.new("Quote Request 345", "cme.futures.streamline.sbe.v5.9.quoterequest345", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.rate_descriptor = ProtoField.new("Rate Descriptor", "cme.futures.streamline.sbe.v5.9.ratedescriptor", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.rate_type = ProtoField.new("Rate Type", "cme.futures.streamline.sbe.v5.9.ratetype", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.recovery_msg = ProtoField.new("Recovery Msg", "cme.futures.streamline.sbe.v5.9.recoverymsg", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x20")
cme_futures_streamline_sbe_v5_9.fields.reference_id = ProtoField.new("Reference Id", "cme.futures.streamline.sbe.v5.9.referenceid", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.related_sym_group = ProtoField.new("Related Sym Group", "cme.futures.streamline.sbe.v5.9.relatedsymgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.related_sym_groups = ProtoField.new("Related Sym Groups", "cme.futures.streamline.sbe.v5.9.relatedsymgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.reserved = ProtoField.new("Reserved", "cme.futures.streamline.sbe.v5.9.reserved", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x40")
cme_futures_streamline_sbe_v5_9.fields.reserved_bits = ProtoField.new("Reserved Bits", "cme.futures.streamline.sbe.v5.9.reservedbits", ftypes.UINT8, nil, base.DEC, "0x78")
cme_futures_streamline_sbe_v5_9.fields.restructuring_type = ProtoField.new("Restructuring Type", "cme.futures.streamline.sbe.v5.9.restructuringtype", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.rounded = ProtoField.new("Rounded", "cme.futures.streamline.sbe.v5.9.rounded", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x04")
cme_futures_streamline_sbe_v5_9.fields.rpt_seq = ProtoField.new("Rpt Seq", "cme.futures.streamline.sbe.v5.9.rptseq", ftypes.UINT32)
cme_futures_streamline_sbe_v5_9.fields.schema_id = ProtoField.new("Schema Id", "cme.futures.streamline.sbe.v5.9.schemaid", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.sector_group = ProtoField.new("Sector Group", "cme.futures.streamline.sbe.v5.9.sectorgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.sector_sub_group = ProtoField.new("Sector Sub Group", "cme.futures.streamline.sbe.v5.9.sectorsubgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_alt_id = ProtoField.new("Security Alt Id", "cme.futures.streamline.sbe.v5.9.securityaltid", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_alt_id_group = ProtoField.new("Security Alt Id Group", "cme.futures.streamline.sbe.v5.9.securityaltidgroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_alt_id_groups = ProtoField.new("Security Alt Id Groups", "cme.futures.streamline.sbe.v5.9.securityaltidgroups", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_alt_id_source = ProtoField.new("Security Alt Id Source", "cme.futures.streamline.sbe.v5.9.securityaltidsource", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_description = ProtoField.new("Security Description", "cme.futures.streamline.sbe.v5.9.securitydescription", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_exchange = ProtoField.new("Security Exchange", "cme.futures.streamline.sbe.v5.9.securityexchange", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_group = ProtoField.new("Security Group", "cme.futures.streamline.sbe.v5.9.securitygroup", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_id = ProtoField.new("Security Id", "cme.futures.streamline.sbe.v5.9.securityid", ftypes.UINT64)
cme_futures_streamline_sbe_v5_9.fields.security_sub_type = ProtoField.new("Security Sub Type", "cme.futures.streamline.sbe.v5.9.securitysubtype", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_type = ProtoField.new("Security Type", "cme.futures.streamline.sbe.v5.9.securitytype", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.security_update_action = ProtoField.new("Security Update Action", "cme.futures.streamline.sbe.v5.9.securityupdateaction", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.sending_time = ProtoField.new("Sending Time", "cme.futures.streamline.sbe.v5.9.sendingtime", ftypes.UINT64)
cme_futures_streamline_sbe_v5_9.fields.seniority = ProtoField.new("Seniority", "cme.futures.streamline.sbe.v5.9.seniority", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.settl_date = ProtoField.new("Settl Date", "cme.futures.streamline.sbe.v5.9.settldate", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.settl_price_type = ProtoField.new("Settl Price Type", "cme.futures.streamline.sbe.v5.9.settlpricetype", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.settlement_npv = ProtoField.new("Settlement Npv", "cme.futures.streamline.sbe.v5.9.settlementnpv", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.strategy_link_id = ProtoField.new("Strategy Link Id", "cme.futures.streamline.sbe.v5.9.strategylinkid", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.strike_price = ProtoField.new("Strike Price", "cme.futures.streamline.sbe.v5.9.strikeprice", ftypes.INT64)
cme_futures_streamline_sbe_v5_9.fields.symbol = ProtoField.new("Symbol", "cme.futures.streamline.sbe.v5.9.symbol", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.template_id = ProtoField.new("Template Id", "cme.futures.streamline.sbe.v5.9.templateid", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.text = ProtoField.new("Text", "cme.futures.streamline.sbe.v5.9.text", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.trade_date = ProtoField.new("Trade Date", "cme.futures.streamline.sbe.v5.9.tradedate", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.trade_id = ProtoField.new("Trade Id", "cme.futures.streamline.sbe.v5.9.tradeid", ftypes.INT32)
cme_futures_streamline_sbe_v5_9.fields.trading_reference_date = ProtoField.new("Trading Reference Date", "cme.futures.streamline.sbe.v5.9.tradingreferencedate", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.transact_time = ProtoField.new("Transact Time", "cme.futures.streamline.sbe.v5.9.transacttime", ftypes.UINT64)
cme_futures_streamline_sbe_v5_9.fields.trd_type = ProtoField.new("Trd Type", "cme.futures.streamline.sbe.v5.9.trdtype", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.unit_of_measure = ProtoField.new("Unit Of Measure", "cme.futures.streamline.sbe.v5.9.unitofmeasure", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.unit_of_measure_currency = ProtoField.new("Unit Of Measure Currency", "cme.futures.streamline.sbe.v5.9.unitofmeasurecurrency", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.unit_of_measure_qty = ProtoField.new("Unit Of Measure Qty", "cme.futures.streamline.sbe.v5.9.unitofmeasureqty", ftypes.INT64)
cme_futures_streamline_sbe_v5_9.fields.user_defined_instrument = ProtoField.new("User Defined Instrument", "cme.futures.streamline.sbe.v5.9.userdefinedinstrument", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.version = ProtoField.new("Version", "cme.futures.streamline.sbe.v5.9.version", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.vol_type = ProtoField.new("Vol Type", "cme.futures.streamline.sbe.v5.9.voltype", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.week = ProtoField.new("Week", "cme.futures.streamline.sbe.v5.9.week", ftypes.UINT8)
cme_futures_streamline_sbe_v5_9.fields.year = ProtoField.new("Year", "cme.futures.streamline.sbe.v5.9.year", ftypes.UINT16)
cme_futures_streamline_sbe_v5_9.fields.yield = ProtoField.new("Yield", "cme.futures.streamline.sbe.v5.9.yield", ftypes.STRING)
cme_futures_streamline_sbe_v5_9.fields.yield_type = ProtoField.new("Yield Type", "cme.futures.streamline.sbe.v5.9.yieldtype", ftypes.STRING)

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Cme Futures Streamline Sbe 5.9 Element Dissection Options
show.accrued_coupons = true
show.admin_login_315 = true
show.admin_logout_316 = true
show.binary_packet_header = true
show.cal_fut_px = true
show.coupon_rate = true
show.d_v_01 = true
show.daily_incremental_eris_pai = true
show.eris_pai = true
show.events_group = true
show.events_groups = true
show.fair_coupon_pct = true
show.fed_funds_rate = true
show.final_settlement_futures_price = true
show.fixed_npv = true
show.fixed_payment = true
show.float_npv = true
show.floating_payment = true
show.group_size = true
show.group_size_encoding = true
show.inst_attrib_group = true
show.inst_attrib_groups = true
show.interpolation_factor = true
show.leg_contract_multiplier = true
show.leg_purchase_rate = true
show.lines_of_text_group = true
show.lines_of_text_groups = true
show.m_d_feed_types_group = true
show.m_d_feed_types_groups = true
show.m_d_incremental_refresh_eris_group = true
show.m_d_incremental_refresh_eris_groups = true
show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group = true
show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups = true
show.m_d_incremental_refresh_indices_group = true
show.m_d_incremental_refresh_indices_groups = true
show.m_d_incremental_refresh_otc_group = true
show.m_d_incremental_refresh_otc_groups = true
show.m_d_incremental_refresh_trade_blocks_group = true
show.m_d_incremental_refresh_trade_blocks_groups = true
show.m_d_instrument_definition_eris_leg_group = true
show.m_d_instrument_definition_eris_leg_groups = true
show.match_event_indicator = true
show.maturity_month_year = true
show.md_entry_px = true
show.md_entry_size = true
show.md_incremental_refresh_eris_351 = true
show.md_incremental_refresh_eris_353 = true
show.md_incremental_refresh_eris_reference_data_and_daily_statistics_333 = true
show.md_incremental_refresh_indices_348 = true
show.md_incremental_refresh_ot_c_356 = true
show.md_incremental_refresh_ot_c_366 = true
show.md_incremental_refresh_trade_blocks_340 = true
show.md_incremental_refresh_trade_blocks_349 = true
show.md_incremental_refresh_trade_blocks_365 = true
show.md_instrument_definition_eris_363 = true
show.md_instrument_definition_indices_347 = true
show.md_news_indices_339 = true
show.message = true
show.message_header = true
show.min_price_increment = true
show.net_chg_prev_day = true
show.net_pct_chg = true
show.next_fixed_payment_amount = true
show.next_floating_payment_amount = true
show.npv = true
show.p_v_01 = true
show.packet = true
show.percent_trading = true
show.previous_eris_pai = true
show.previous_fixing_rate = true
show.quote_request_345 = true
show.related_sym_group = true
show.related_sym_groups = true
show.security_alt_id_group = true
show.security_alt_id_groups = true
show.settl_price_type = true
show.settlement_npv = true
show.strike_price = true
show.unit_of_measure_qty = true
show.yield = true
show.payload = false

-- Register Cme Futures Streamline Sbe 5.9 Show Options
cme_futures_streamline_sbe_v5_9.prefs.show_accrued_coupons = Pref.bool("Show Accrued Coupons", show.accrued_coupons, "Parse and add Accrued Coupons to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_admin_login_315 = Pref.bool("Show Admin Login 315", show.admin_login_315, "Parse and add Admin Login 315 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_admin_logout_316 = Pref.bool("Show Admin Logout 316", show.admin_logout_316, "Parse and add Admin Logout 316 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_binary_packet_header = Pref.bool("Show Binary Packet Header", show.binary_packet_header, "Parse and add Binary Packet Header to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_cal_fut_px = Pref.bool("Show Cal Fut Px", show.cal_fut_px, "Parse and add Cal Fut Px to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_coupon_rate = Pref.bool("Show Coupon Rate", show.coupon_rate, "Parse and add Coupon Rate to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_d_v_01 = Pref.bool("Show D V 01", show.d_v_01, "Parse and add D V 01 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_daily_incremental_eris_pai = Pref.bool("Show Daily Incremental Eris Pai", show.daily_incremental_eris_pai, "Parse and add Daily Incremental Eris Pai to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_eris_pai = Pref.bool("Show Eris Pai", show.eris_pai, "Parse and add Eris Pai to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_events_group = Pref.bool("Show Events Group", show.events_group, "Parse and add Events Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_events_groups = Pref.bool("Show Events Groups", show.events_groups, "Parse and add Events Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_fair_coupon_pct = Pref.bool("Show Fair Coupon Pct", show.fair_coupon_pct, "Parse and add Fair Coupon Pct to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_fed_funds_rate = Pref.bool("Show Fed Funds Rate", show.fed_funds_rate, "Parse and add Fed Funds Rate to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_final_settlement_futures_price = Pref.bool("Show Final Settlement Futures Price", show.final_settlement_futures_price, "Parse and add Final Settlement Futures Price to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_fixed_npv = Pref.bool("Show Fixed Npv", show.fixed_npv, "Parse and add Fixed Npv to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_fixed_payment = Pref.bool("Show Fixed Payment", show.fixed_payment, "Parse and add Fixed Payment to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_float_npv = Pref.bool("Show Float Npv", show.float_npv, "Parse and add Float Npv to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_floating_payment = Pref.bool("Show Floating Payment", show.floating_payment, "Parse and add Floating Payment to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_group_size = Pref.bool("Show Group Size", show.group_size, "Parse and add Group Size to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_group_size_encoding = Pref.bool("Show Group Size Encoding", show.group_size_encoding, "Parse and add Group Size Encoding to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_inst_attrib_group = Pref.bool("Show Inst Attrib Group", show.inst_attrib_group, "Parse and add Inst Attrib Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_inst_attrib_groups = Pref.bool("Show Inst Attrib Groups", show.inst_attrib_groups, "Parse and add Inst Attrib Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_interpolation_factor = Pref.bool("Show Interpolation Factor", show.interpolation_factor, "Parse and add Interpolation Factor to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_leg_contract_multiplier = Pref.bool("Show Leg Contract Multiplier", show.leg_contract_multiplier, "Parse and add Leg Contract Multiplier to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_leg_purchase_rate = Pref.bool("Show Leg Purchase Rate", show.leg_purchase_rate, "Parse and add Leg Purchase Rate to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_lines_of_text_group = Pref.bool("Show Lines Of Text Group", show.lines_of_text_group, "Parse and add Lines Of Text Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_lines_of_text_groups = Pref.bool("Show Lines Of Text Groups", show.lines_of_text_groups, "Parse and add Lines Of Text Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_feed_types_group = Pref.bool("Show M D Feed Types Group", show.m_d_feed_types_group, "Parse and add M D Feed Types Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_feed_types_groups = Pref.bool("Show M D Feed Types Groups", show.m_d_feed_types_groups, "Parse and add M D Feed Types Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_group = Pref.bool("Show M D Incremental Refresh Eris Group", show.m_d_incremental_refresh_eris_group, "Parse and add M D Incremental Refresh Eris Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_groups = Pref.bool("Show M D Incremental Refresh Eris Groups", show.m_d_incremental_refresh_eris_groups, "Parse and add M D Incremental Refresh Eris Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group = Pref.bool("Show M D Incremental Refresh Eris Reference Data And Daily Statistics Group", show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group, "Parse and add M D Incremental Refresh Eris Reference Data And Daily Statistics Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups = Pref.bool("Show M D Incremental Refresh Eris Reference Data And Daily Statistics Groups", show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups, "Parse and add M D Incremental Refresh Eris Reference Data And Daily Statistics Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_indices_group = Pref.bool("Show M D Incremental Refresh Indices Group", show.m_d_incremental_refresh_indices_group, "Parse and add M D Incremental Refresh Indices Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_indices_groups = Pref.bool("Show M D Incremental Refresh Indices Groups", show.m_d_incremental_refresh_indices_groups, "Parse and add M D Incremental Refresh Indices Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_otc_group = Pref.bool("Show M D Incremental Refresh Otc Group", show.m_d_incremental_refresh_otc_group, "Parse and add M D Incremental Refresh Otc Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_otc_groups = Pref.bool("Show M D Incremental Refresh Otc Groups", show.m_d_incremental_refresh_otc_groups, "Parse and add M D Incremental Refresh Otc Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_trade_blocks_group = Pref.bool("Show M D Incremental Refresh Trade Blocks Group", show.m_d_incremental_refresh_trade_blocks_group, "Parse and add M D Incremental Refresh Trade Blocks Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_trade_blocks_groups = Pref.bool("Show M D Incremental Refresh Trade Blocks Groups", show.m_d_incremental_refresh_trade_blocks_groups, "Parse and add M D Incremental Refresh Trade Blocks Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_instrument_definition_eris_leg_group = Pref.bool("Show M D Instrument Definition Eris Leg Group", show.m_d_instrument_definition_eris_leg_group, "Parse and add M D Instrument Definition Eris Leg Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_m_d_instrument_definition_eris_leg_groups = Pref.bool("Show M D Instrument Definition Eris Leg Groups", show.m_d_instrument_definition_eris_leg_groups, "Parse and add M D Instrument Definition Eris Leg Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_match_event_indicator = Pref.bool("Show Match Event Indicator", show.match_event_indicator, "Parse and add Match Event Indicator to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_maturity_month_year = Pref.bool("Show Maturity Month Year", show.maturity_month_year, "Parse and add Maturity Month Year to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_entry_px = Pref.bool("Show Md Entry Px", show.md_entry_px, "Parse and add Md Entry Px to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_entry_size = Pref.bool("Show Md Entry Size", show.md_entry_size, "Parse and add Md Entry Size to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_eris_351 = Pref.bool("Show Md Incremental Refresh Eris 351", show.md_incremental_refresh_eris_351, "Parse and add Md Incremental Refresh Eris 351 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_eris_353 = Pref.bool("Show Md Incremental Refresh Eris 353", show.md_incremental_refresh_eris_353, "Parse and add Md Incremental Refresh Eris 353 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_eris_reference_data_and_daily_statistics_333 = Pref.bool("Show Md Incremental Refresh Eris Reference Data And Daily Statistics 333", show.md_incremental_refresh_eris_reference_data_and_daily_statistics_333, "Parse and add Md Incremental Refresh Eris Reference Data And Daily Statistics 333 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_indices_348 = Pref.bool("Show Md Incremental Refresh Indices 348", show.md_incremental_refresh_indices_348, "Parse and add Md Incremental Refresh Indices 348 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_ot_c_356 = Pref.bool("Show Md Incremental Refresh Ot C 356", show.md_incremental_refresh_ot_c_356, "Parse and add Md Incremental Refresh Ot C 356 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_ot_c_366 = Pref.bool("Show Md Incremental Refresh Ot C 366", show.md_incremental_refresh_ot_c_366, "Parse and add Md Incremental Refresh Ot C 366 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_trade_blocks_340 = Pref.bool("Show Md Incremental Refresh Trade Blocks 340", show.md_incremental_refresh_trade_blocks_340, "Parse and add Md Incremental Refresh Trade Blocks 340 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_trade_blocks_349 = Pref.bool("Show Md Incremental Refresh Trade Blocks 349", show.md_incremental_refresh_trade_blocks_349, "Parse and add Md Incremental Refresh Trade Blocks 349 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_trade_blocks_365 = Pref.bool("Show Md Incremental Refresh Trade Blocks 365", show.md_incremental_refresh_trade_blocks_365, "Parse and add Md Incremental Refresh Trade Blocks 365 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_instrument_definition_eris_363 = Pref.bool("Show Md Instrument Definition Eris 363", show.md_instrument_definition_eris_363, "Parse and add Md Instrument Definition Eris 363 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_instrument_definition_indices_347 = Pref.bool("Show Md Instrument Definition Indices 347", show.md_instrument_definition_indices_347, "Parse and add Md Instrument Definition Indices 347 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_md_news_indices_339 = Pref.bool("Show Md News Indices 339", show.md_news_indices_339, "Parse and add Md News Indices 339 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_message = Pref.bool("Show Message", show.message, "Parse and add Message to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_message_header = Pref.bool("Show Message Header", show.message_header, "Parse and add Message Header to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_min_price_increment = Pref.bool("Show Min Price Increment", show.min_price_increment, "Parse and add Min Price Increment to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_net_chg_prev_day = Pref.bool("Show Net Chg Prev Day", show.net_chg_prev_day, "Parse and add Net Chg Prev Day to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_net_pct_chg = Pref.bool("Show Net Pct Chg", show.net_pct_chg, "Parse and add Net Pct Chg to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_next_fixed_payment_amount = Pref.bool("Show Next Fixed Payment Amount", show.next_fixed_payment_amount, "Parse and add Next Fixed Payment Amount to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_next_floating_payment_amount = Pref.bool("Show Next Floating Payment Amount", show.next_floating_payment_amount, "Parse and add Next Floating Payment Amount to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_npv = Pref.bool("Show Npv", show.npv, "Parse and add Npv to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_p_v_01 = Pref.bool("Show P V 01", show.p_v_01, "Parse and add P V 01 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_percent_trading = Pref.bool("Show Percent Trading", show.percent_trading, "Parse and add Percent Trading to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_previous_eris_pai = Pref.bool("Show Previous Eris Pai", show.previous_eris_pai, "Parse and add Previous Eris Pai to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_previous_fixing_rate = Pref.bool("Show Previous Fixing Rate", show.previous_fixing_rate, "Parse and add Previous Fixing Rate to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_quote_request_345 = Pref.bool("Show Quote Request 345", show.quote_request_345, "Parse and add Quote Request 345 to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_related_sym_group = Pref.bool("Show Related Sym Group", show.related_sym_group, "Parse and add Related Sym Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_related_sym_groups = Pref.bool("Show Related Sym Groups", show.related_sym_groups, "Parse and add Related Sym Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_security_alt_id_group = Pref.bool("Show Security Alt Id Group", show.security_alt_id_group, "Parse and add Security Alt Id Group to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_security_alt_id_groups = Pref.bool("Show Security Alt Id Groups", show.security_alt_id_groups, "Parse and add Security Alt Id Groups to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_settl_price_type = Pref.bool("Show Settl Price Type", show.settl_price_type, "Parse and add Settl Price Type to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_settlement_npv = Pref.bool("Show Settlement Npv", show.settlement_npv, "Parse and add Settlement Npv to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_strike_price = Pref.bool("Show Strike Price", show.strike_price, "Parse and add Strike Price to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_unit_of_measure_qty = Pref.bool("Show Unit Of Measure Qty", show.unit_of_measure_qty, "Parse and add Unit Of Measure Qty to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_yield = Pref.bool("Show Yield", show.yield, "Parse and add Yield to protocol tree")
cme_futures_streamline_sbe_v5_9.prefs.show_payload = Pref.bool("Show Payload", show.payload, "Parse and add Payload to protocol tree")

-- Handle changed preferences
function cme_futures_streamline_sbe_v5_9.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.accrued_coupons ~= cme_futures_streamline_sbe_v5_9.prefs.show_accrued_coupons then
    show.accrued_coupons = cme_futures_streamline_sbe_v5_9.prefs.show_accrued_coupons
    changed = true
  end
  if show.admin_login_315 ~= cme_futures_streamline_sbe_v5_9.prefs.show_admin_login_315 then
    show.admin_login_315 = cme_futures_streamline_sbe_v5_9.prefs.show_admin_login_315
    changed = true
  end
  if show.admin_logout_316 ~= cme_futures_streamline_sbe_v5_9.prefs.show_admin_logout_316 then
    show.admin_logout_316 = cme_futures_streamline_sbe_v5_9.prefs.show_admin_logout_316
    changed = true
  end
  if show.binary_packet_header ~= cme_futures_streamline_sbe_v5_9.prefs.show_binary_packet_header then
    show.binary_packet_header = cme_futures_streamline_sbe_v5_9.prefs.show_binary_packet_header
    changed = true
  end
  if show.cal_fut_px ~= cme_futures_streamline_sbe_v5_9.prefs.show_cal_fut_px then
    show.cal_fut_px = cme_futures_streamline_sbe_v5_9.prefs.show_cal_fut_px
    changed = true
  end
  if show.coupon_rate ~= cme_futures_streamline_sbe_v5_9.prefs.show_coupon_rate then
    show.coupon_rate = cme_futures_streamline_sbe_v5_9.prefs.show_coupon_rate
    changed = true
  end
  if show.d_v_01 ~= cme_futures_streamline_sbe_v5_9.prefs.show_d_v_01 then
    show.d_v_01 = cme_futures_streamline_sbe_v5_9.prefs.show_d_v_01
    changed = true
  end
  if show.daily_incremental_eris_pai ~= cme_futures_streamline_sbe_v5_9.prefs.show_daily_incremental_eris_pai then
    show.daily_incremental_eris_pai = cme_futures_streamline_sbe_v5_9.prefs.show_daily_incremental_eris_pai
    changed = true
  end
  if show.eris_pai ~= cme_futures_streamline_sbe_v5_9.prefs.show_eris_pai then
    show.eris_pai = cme_futures_streamline_sbe_v5_9.prefs.show_eris_pai
    changed = true
  end
  if show.events_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_events_group then
    show.events_group = cme_futures_streamline_sbe_v5_9.prefs.show_events_group
    changed = true
  end
  if show.events_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_events_groups then
    show.events_groups = cme_futures_streamline_sbe_v5_9.prefs.show_events_groups
    changed = true
  end
  if show.fair_coupon_pct ~= cme_futures_streamline_sbe_v5_9.prefs.show_fair_coupon_pct then
    show.fair_coupon_pct = cme_futures_streamline_sbe_v5_9.prefs.show_fair_coupon_pct
    changed = true
  end
  if show.fed_funds_rate ~= cme_futures_streamline_sbe_v5_9.prefs.show_fed_funds_rate then
    show.fed_funds_rate = cme_futures_streamline_sbe_v5_9.prefs.show_fed_funds_rate
    changed = true
  end
  if show.final_settlement_futures_price ~= cme_futures_streamline_sbe_v5_9.prefs.show_final_settlement_futures_price then
    show.final_settlement_futures_price = cme_futures_streamline_sbe_v5_9.prefs.show_final_settlement_futures_price
    changed = true
  end
  if show.fixed_npv ~= cme_futures_streamline_sbe_v5_9.prefs.show_fixed_npv then
    show.fixed_npv = cme_futures_streamline_sbe_v5_9.prefs.show_fixed_npv
    changed = true
  end
  if show.fixed_payment ~= cme_futures_streamline_sbe_v5_9.prefs.show_fixed_payment then
    show.fixed_payment = cme_futures_streamline_sbe_v5_9.prefs.show_fixed_payment
    changed = true
  end
  if show.float_npv ~= cme_futures_streamline_sbe_v5_9.prefs.show_float_npv then
    show.float_npv = cme_futures_streamline_sbe_v5_9.prefs.show_float_npv
    changed = true
  end
  if show.floating_payment ~= cme_futures_streamline_sbe_v5_9.prefs.show_floating_payment then
    show.floating_payment = cme_futures_streamline_sbe_v5_9.prefs.show_floating_payment
    changed = true
  end
  if show.group_size ~= cme_futures_streamline_sbe_v5_9.prefs.show_group_size then
    show.group_size = cme_futures_streamline_sbe_v5_9.prefs.show_group_size
    changed = true
  end
  if show.group_size_encoding ~= cme_futures_streamline_sbe_v5_9.prefs.show_group_size_encoding then
    show.group_size_encoding = cme_futures_streamline_sbe_v5_9.prefs.show_group_size_encoding
    changed = true
  end
  if show.inst_attrib_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_inst_attrib_group then
    show.inst_attrib_group = cme_futures_streamline_sbe_v5_9.prefs.show_inst_attrib_group
    changed = true
  end
  if show.inst_attrib_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_inst_attrib_groups then
    show.inst_attrib_groups = cme_futures_streamline_sbe_v5_9.prefs.show_inst_attrib_groups
    changed = true
  end
  if show.interpolation_factor ~= cme_futures_streamline_sbe_v5_9.prefs.show_interpolation_factor then
    show.interpolation_factor = cme_futures_streamline_sbe_v5_9.prefs.show_interpolation_factor
    changed = true
  end
  if show.leg_contract_multiplier ~= cme_futures_streamline_sbe_v5_9.prefs.show_leg_contract_multiplier then
    show.leg_contract_multiplier = cme_futures_streamline_sbe_v5_9.prefs.show_leg_contract_multiplier
    changed = true
  end
  if show.leg_purchase_rate ~= cme_futures_streamline_sbe_v5_9.prefs.show_leg_purchase_rate then
    show.leg_purchase_rate = cme_futures_streamline_sbe_v5_9.prefs.show_leg_purchase_rate
    changed = true
  end
  if show.lines_of_text_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_lines_of_text_group then
    show.lines_of_text_group = cme_futures_streamline_sbe_v5_9.prefs.show_lines_of_text_group
    changed = true
  end
  if show.lines_of_text_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_lines_of_text_groups then
    show.lines_of_text_groups = cme_futures_streamline_sbe_v5_9.prefs.show_lines_of_text_groups
    changed = true
  end
  if show.m_d_feed_types_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_feed_types_group then
    show.m_d_feed_types_group = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_feed_types_group
    changed = true
  end
  if show.m_d_feed_types_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_feed_types_groups then
    show.m_d_feed_types_groups = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_feed_types_groups
    changed = true
  end
  if show.m_d_incremental_refresh_eris_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_group then
    show.m_d_incremental_refresh_eris_group = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_group
    changed = true
  end
  if show.m_d_incremental_refresh_eris_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_groups then
    show.m_d_incremental_refresh_eris_groups = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_groups
    changed = true
  end
  if show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group then
    show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group
    changed = true
  end
  if show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups then
    show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups
    changed = true
  end
  if show.m_d_incremental_refresh_indices_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_indices_group then
    show.m_d_incremental_refresh_indices_group = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_indices_group
    changed = true
  end
  if show.m_d_incremental_refresh_indices_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_indices_groups then
    show.m_d_incremental_refresh_indices_groups = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_indices_groups
    changed = true
  end
  if show.m_d_incremental_refresh_otc_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_otc_group then
    show.m_d_incremental_refresh_otc_group = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_otc_group
    changed = true
  end
  if show.m_d_incremental_refresh_otc_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_otc_groups then
    show.m_d_incremental_refresh_otc_groups = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_otc_groups
    changed = true
  end
  if show.m_d_incremental_refresh_trade_blocks_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_trade_blocks_group then
    show.m_d_incremental_refresh_trade_blocks_group = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_trade_blocks_group
    changed = true
  end
  if show.m_d_incremental_refresh_trade_blocks_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_trade_blocks_groups then
    show.m_d_incremental_refresh_trade_blocks_groups = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_incremental_refresh_trade_blocks_groups
    changed = true
  end
  if show.m_d_instrument_definition_eris_leg_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_instrument_definition_eris_leg_group then
    show.m_d_instrument_definition_eris_leg_group = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_instrument_definition_eris_leg_group
    changed = true
  end
  if show.m_d_instrument_definition_eris_leg_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_m_d_instrument_definition_eris_leg_groups then
    show.m_d_instrument_definition_eris_leg_groups = cme_futures_streamline_sbe_v5_9.prefs.show_m_d_instrument_definition_eris_leg_groups
    changed = true
  end
  if show.match_event_indicator ~= cme_futures_streamline_sbe_v5_9.prefs.show_match_event_indicator then
    show.match_event_indicator = cme_futures_streamline_sbe_v5_9.prefs.show_match_event_indicator
    changed = true
  end
  if show.maturity_month_year ~= cme_futures_streamline_sbe_v5_9.prefs.show_maturity_month_year then
    show.maturity_month_year = cme_futures_streamline_sbe_v5_9.prefs.show_maturity_month_year
    changed = true
  end
  if show.md_entry_px ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_entry_px then
    show.md_entry_px = cme_futures_streamline_sbe_v5_9.prefs.show_md_entry_px
    changed = true
  end
  if show.md_entry_size ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_entry_size then
    show.md_entry_size = cme_futures_streamline_sbe_v5_9.prefs.show_md_entry_size
    changed = true
  end
  if show.md_incremental_refresh_eris_351 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_eris_351 then
    show.md_incremental_refresh_eris_351 = cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_eris_351
    changed = true
  end
  if show.md_incremental_refresh_eris_353 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_eris_353 then
    show.md_incremental_refresh_eris_353 = cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_eris_353
    changed = true
  end
  if show.md_incremental_refresh_eris_reference_data_and_daily_statistics_333 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_eris_reference_data_and_daily_statistics_333 then
    show.md_incremental_refresh_eris_reference_data_and_daily_statistics_333 = cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_eris_reference_data_and_daily_statistics_333
    changed = true
  end
  if show.md_incremental_refresh_indices_348 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_indices_348 then
    show.md_incremental_refresh_indices_348 = cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_indices_348
    changed = true
  end
  if show.md_incremental_refresh_ot_c_356 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_ot_c_356 then
    show.md_incremental_refresh_ot_c_356 = cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_ot_c_356
    changed = true
  end
  if show.md_incremental_refresh_ot_c_366 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_ot_c_366 then
    show.md_incremental_refresh_ot_c_366 = cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_ot_c_366
    changed = true
  end
  if show.md_incremental_refresh_trade_blocks_340 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_trade_blocks_340 then
    show.md_incremental_refresh_trade_blocks_340 = cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_trade_blocks_340
    changed = true
  end
  if show.md_incremental_refresh_trade_blocks_349 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_trade_blocks_349 then
    show.md_incremental_refresh_trade_blocks_349 = cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_trade_blocks_349
    changed = true
  end
  if show.md_incremental_refresh_trade_blocks_365 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_trade_blocks_365 then
    show.md_incremental_refresh_trade_blocks_365 = cme_futures_streamline_sbe_v5_9.prefs.show_md_incremental_refresh_trade_blocks_365
    changed = true
  end
  if show.md_instrument_definition_eris_363 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_instrument_definition_eris_363 then
    show.md_instrument_definition_eris_363 = cme_futures_streamline_sbe_v5_9.prefs.show_md_instrument_definition_eris_363
    changed = true
  end
  if show.md_instrument_definition_indices_347 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_instrument_definition_indices_347 then
    show.md_instrument_definition_indices_347 = cme_futures_streamline_sbe_v5_9.prefs.show_md_instrument_definition_indices_347
    changed = true
  end
  if show.md_news_indices_339 ~= cme_futures_streamline_sbe_v5_9.prefs.show_md_news_indices_339 then
    show.md_news_indices_339 = cme_futures_streamline_sbe_v5_9.prefs.show_md_news_indices_339
    changed = true
  end
  if show.message ~= cme_futures_streamline_sbe_v5_9.prefs.show_message then
    show.message = cme_futures_streamline_sbe_v5_9.prefs.show_message
    changed = true
  end
  if show.message_header ~= cme_futures_streamline_sbe_v5_9.prefs.show_message_header then
    show.message_header = cme_futures_streamline_sbe_v5_9.prefs.show_message_header
    changed = true
  end
  if show.min_price_increment ~= cme_futures_streamline_sbe_v5_9.prefs.show_min_price_increment then
    show.min_price_increment = cme_futures_streamline_sbe_v5_9.prefs.show_min_price_increment
    changed = true
  end
  if show.net_chg_prev_day ~= cme_futures_streamline_sbe_v5_9.prefs.show_net_chg_prev_day then
    show.net_chg_prev_day = cme_futures_streamline_sbe_v5_9.prefs.show_net_chg_prev_day
    changed = true
  end
  if show.net_pct_chg ~= cme_futures_streamline_sbe_v5_9.prefs.show_net_pct_chg then
    show.net_pct_chg = cme_futures_streamline_sbe_v5_9.prefs.show_net_pct_chg
    changed = true
  end
  if show.next_fixed_payment_amount ~= cme_futures_streamline_sbe_v5_9.prefs.show_next_fixed_payment_amount then
    show.next_fixed_payment_amount = cme_futures_streamline_sbe_v5_9.prefs.show_next_fixed_payment_amount
    changed = true
  end
  if show.next_floating_payment_amount ~= cme_futures_streamline_sbe_v5_9.prefs.show_next_floating_payment_amount then
    show.next_floating_payment_amount = cme_futures_streamline_sbe_v5_9.prefs.show_next_floating_payment_amount
    changed = true
  end
  if show.npv ~= cme_futures_streamline_sbe_v5_9.prefs.show_npv then
    show.npv = cme_futures_streamline_sbe_v5_9.prefs.show_npv
    changed = true
  end
  if show.p_v_01 ~= cme_futures_streamline_sbe_v5_9.prefs.show_p_v_01 then
    show.p_v_01 = cme_futures_streamline_sbe_v5_9.prefs.show_p_v_01
    changed = true
  end
  if show.packet ~= cme_futures_streamline_sbe_v5_9.prefs.show_packet then
    show.packet = cme_futures_streamline_sbe_v5_9.prefs.show_packet
    changed = true
  end
  if show.percent_trading ~= cme_futures_streamline_sbe_v5_9.prefs.show_percent_trading then
    show.percent_trading = cme_futures_streamline_sbe_v5_9.prefs.show_percent_trading
    changed = true
  end
  if show.previous_eris_pai ~= cme_futures_streamline_sbe_v5_9.prefs.show_previous_eris_pai then
    show.previous_eris_pai = cme_futures_streamline_sbe_v5_9.prefs.show_previous_eris_pai
    changed = true
  end
  if show.previous_fixing_rate ~= cme_futures_streamline_sbe_v5_9.prefs.show_previous_fixing_rate then
    show.previous_fixing_rate = cme_futures_streamline_sbe_v5_9.prefs.show_previous_fixing_rate
    changed = true
  end
  if show.quote_request_345 ~= cme_futures_streamline_sbe_v5_9.prefs.show_quote_request_345 then
    show.quote_request_345 = cme_futures_streamline_sbe_v5_9.prefs.show_quote_request_345
    changed = true
  end
  if show.related_sym_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_related_sym_group then
    show.related_sym_group = cme_futures_streamline_sbe_v5_9.prefs.show_related_sym_group
    changed = true
  end
  if show.related_sym_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_related_sym_groups then
    show.related_sym_groups = cme_futures_streamline_sbe_v5_9.prefs.show_related_sym_groups
    changed = true
  end
  if show.security_alt_id_group ~= cme_futures_streamline_sbe_v5_9.prefs.show_security_alt_id_group then
    show.security_alt_id_group = cme_futures_streamline_sbe_v5_9.prefs.show_security_alt_id_group
    changed = true
  end
  if show.security_alt_id_groups ~= cme_futures_streamline_sbe_v5_9.prefs.show_security_alt_id_groups then
    show.security_alt_id_groups = cme_futures_streamline_sbe_v5_9.prefs.show_security_alt_id_groups
    changed = true
  end
  if show.settl_price_type ~= cme_futures_streamline_sbe_v5_9.prefs.show_settl_price_type then
    show.settl_price_type = cme_futures_streamline_sbe_v5_9.prefs.show_settl_price_type
    changed = true
  end
  if show.settlement_npv ~= cme_futures_streamline_sbe_v5_9.prefs.show_settlement_npv then
    show.settlement_npv = cme_futures_streamline_sbe_v5_9.prefs.show_settlement_npv
    changed = true
  end
  if show.strike_price ~= cme_futures_streamline_sbe_v5_9.prefs.show_strike_price then
    show.strike_price = cme_futures_streamline_sbe_v5_9.prefs.show_strike_price
    changed = true
  end
  if show.unit_of_measure_qty ~= cme_futures_streamline_sbe_v5_9.prefs.show_unit_of_measure_qty then
    show.unit_of_measure_qty = cme_futures_streamline_sbe_v5_9.prefs.show_unit_of_measure_qty
    changed = true
  end
  if show.yield ~= cme_futures_streamline_sbe_v5_9.prefs.show_yield then
    show.yield = cme_futures_streamline_sbe_v5_9.prefs.show_yield
    changed = true
  end
  if show.payload ~= cme_futures_streamline_sbe_v5_9.prefs.show_payload then
    show.payload = cme_futures_streamline_sbe_v5_9.prefs.show_payload
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Cme Futures Streamline Sbe 5.9
-----------------------------------------------------------------------

-- Size: Reference Id
size_of.reference_id = 50

-- Display: Reference Id
display.reference_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Reference Id: No Value"
  end

  return "Reference Id: "..value
end

-- Dissect: Reference Id
dissect.reference_id = function(buffer, offset, packet, parent)
  local length = size_of.reference_id
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.reference_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.reference_id, range, value, display)

  return offset + length, value
end

-- Size: Vol Type
size_of.vol_type = 2

-- Display: Vol Type
display.vol_type = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Vol Type: No Value ("..value..")"
  end

  return "Vol Type: "..value
end

-- Dissect: Vol Type
dissect.vol_type = function(buffer, offset, packet, parent)
  local length = size_of.vol_type
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.vol_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.vol_type, range, value, display)

  return offset + length, value
end

-- Size: Security Sub Type
size_of.security_sub_type = 2

-- Display: Security Sub Type
display.security_sub_type = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Security Sub Type: No Value"
  end

  return "Security Sub Type: "..value
end

-- Dissect: Security Sub Type
dissect.security_sub_type = function(buffer, offset, packet, parent)
  local length = size_of.security_sub_type
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.security_sub_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.security_sub_type, range, value, display)

  return offset + length, value
end

-- Size: Product Complex
size_of.product_complex = 26

-- Display: Product Complex
display.product_complex = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Product Complex: No Value"
  end

  return "Product Complex: "..value
end

-- Dissect: Product Complex
dissect.product_complex = function(buffer, offset, packet, parent)
  local length = size_of.product_complex
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.product_complex(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.product_complex, range, value, display)

  return offset + length, value
end

-- Size: Sector Sub Group
size_of.sector_sub_group = 26

-- Display: Sector Sub Group
display.sector_sub_group = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Sector Sub Group: No Value"
  end

  return "Sector Sub Group: "..value
end

-- Dissect: Sector Sub Group
dissect.sector_sub_group = function(buffer, offset, packet, parent)
  local length = size_of.sector_sub_group
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.sector_sub_group(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.sector_sub_group, range, value, display)

  return offset + length, value
end

-- Size: Sector Group
size_of.sector_group = 2

-- Display: Sector Group
display.sector_group = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Sector Group: No Value"
  end

  return "Sector Group: "..value
end

-- Dissect: Sector Group
dissect.sector_group = function(buffer, offset, packet, parent)
  local length = size_of.sector_group
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.sector_group(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.sector_group, range, value, display)

  return offset + length, value
end

-- Size: Market Sector
size_of.market_sector = 26

-- Display: Market Sector
display.market_sector = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Market Sector: No Value"
  end

  return "Market Sector: "..value
end

-- Dissect: Market Sector
dissect.market_sector = function(buffer, offset, packet, parent)
  local length = size_of.market_sector
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.market_sector(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.market_sector, range, value, display)

  return offset + length, value
end

-- Size: Quote Condition
size_of.quote_condition = 1

-- Display: Quote Condition
display.quote_condition = function(value)
  return "Quote Condition: "..value
end

-- Dissect: Quote Condition
dissect.quote_condition = function(buffer, offset, packet, parent)
  local length = size_of.quote_condition
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.quote_condition(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.quote_condition, range, value, display)

  return offset + length, value
end

-- Size: Settl Date
size_of.settl_date = 2

-- Display: Settl Date
display.settl_date = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Settl Date: No Value ("..value..")"
  end

  return "Settl Date: "..value
end

-- Dissect: Settl Date
dissect.settl_date = function(buffer, offset, packet, parent)
  local length = size_of.settl_date
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.settl_date(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.settl_date, range, value, display)

  return offset + length, value
end

-- Size: Price Type
size_of.price_type = 2

-- Display: Price Type
display.price_type = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Price Type: No Value ("..value..")"
  end

  return "Price Type: "..value
end

-- Dissect: Price Type
dissect.price_type = function(buffer, offset, packet, parent)
  local length = size_of.price_type
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.price_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.price_type, range, value, display)

  return offset + length, value
end

-- Size: Open Close Settl Flag
size_of.open_close_settl_flag = 1

-- Display: Open Close Settl Flag
display.open_close_settl_flag = function(value)
  -- Check if field has value
  if value == 255 then
    return "Open Close Settl Flag: No Value ("..value..")"
  end

  return "Open Close Settl Flag: "..value
end

-- Dissect: Open Close Settl Flag
dissect.open_close_settl_flag = function(buffer, offset, packet, parent)
  local length = size_of.open_close_settl_flag
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.open_close_settl_flag(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.open_close_settl_flag, range, value, display)

  return offset + length, value
end

-- Size: Md Entry Date
size_of.md_entry_date = 4

-- Display: Md Entry Date
display.md_entry_date = function(value)
  -- Check if field has value
  if value == 2147483647 then
    return "Md Entry Date: No Value ("..value..")"
  end

  return "Md Entry Date: "..value
end

-- Dissect: Md Entry Date
dissect.md_entry_date = function(buffer, offset, packet, parent)
  local length = size_of.md_entry_date
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.md_entry_date(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.md_entry_date, range, value, display)

  return offset + length, value
end

-- Size: Exponent
size_of.exponent = 1

-- Display: Exponent
display.exponent = function(value)
  -- Check if field has value
  if value == 127 then
    return "Exponent: No Value ("..value..")"
  end

  return "Exponent: "..value
end

-- Dissect: Exponent
dissect.exponent = function(buffer, offset, packet, parent)
  local length = size_of.exponent
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.exponent(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.exponent, range, value, display)

  return offset + length, value
end

-- Size: Mantissa64
size_of.mantissa64 = 8

-- Display: Mantissa64
display.mantissa64 = function(value)
  -- Check if field has value
  if value == 9223372036854775807 then
    return "Mantissa64: No Value ("..value..")"
  end

  return "Mantissa64: "..value
end

-- Dissect: Mantissa64
dissect.mantissa64 = function(buffer, offset, packet, parent)
  local length = size_of.mantissa64
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.mantissa64(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.mantissa64, range, value, display)

  return offset + length, value
end

-- Calculate size of: Unit Of Measure Qty
size_of.unit_of_measure_qty = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Unit Of Measure Qty
display.unit_of_measure_qty = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Unit Of Measure Qty
dissect.unit_of_measure_qty_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Unit Of Measure Qty
dissect.unit_of_measure_qty = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.unit_of_measure_qty then
    local length = size_of.unit_of_measure_qty(buffer, offset)
    local range = buffer(offset, length)
    local display = display.unit_of_measure_qty(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.unit_of_measure_qty, range, display)
  end

  return dissect.unit_of_measure_qty_fields(buffer, offset, packet, parent)
end

-- Size: Unit Of Measure Currency
size_of.unit_of_measure_currency = 3

-- Display: Unit Of Measure Currency
display.unit_of_measure_currency = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Unit Of Measure Currency: No Value"
  end

  return "Unit Of Measure Currency: "..value
end

-- Dissect: Unit Of Measure Currency
dissect.unit_of_measure_currency = function(buffer, offset, packet, parent)
  local length = size_of.unit_of_measure_currency
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.unit_of_measure_currency(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.unit_of_measure_currency, range, value, display)

  return offset + length, value
end

-- Size: Unit Of Measure
size_of.unit_of_measure = 5

-- Display: Unit Of Measure
display.unit_of_measure = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Unit Of Measure: No Value"
  end

  return "Unit Of Measure: "..value
end

-- Dissect: Unit Of Measure
dissect.unit_of_measure = function(buffer, offset, packet, parent)
  local length = size_of.unit_of_measure
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.unit_of_measure(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.unit_of_measure, range, value, display)

  return offset + length, value
end

-- Calculate size of: Strike Price
size_of.strike_price = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Strike Price
display.strike_price = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Strike Price
dissect.strike_price_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Strike Price
dissect.strike_price = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.strike_price then
    local length = size_of.strike_price(buffer, offset)
    local range = buffer(offset, length)
    local display = display.strike_price(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.strike_price, range, display)
  end

  return dissect.strike_price_fields(buffer, offset, packet, parent)
end

-- Size: Put Or Call
size_of.put_or_call = 1

-- Display: Put Or Call
display.put_or_call = function(value)
  -- Check if field has value
  if value == 255 then
    return "Put Or Call: No Value ("..value..")"
  end

  return "Put Or Call: "..value
end

-- Dissect: Put Or Call
dissect.put_or_call = function(buffer, offset, packet, parent)
  local length = size_of.put_or_call
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.put_or_call(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.put_or_call, range, value, display)

  return offset + length, value
end

-- Size: Notional Percentage Outstanding
size_of.notional_percentage_outstanding = 4

-- Display: Notional Percentage Outstanding
display.notional_percentage_outstanding = function(value)
  -- Check if field has value
  if value == 2147483647 then
    return "Notional Percentage Outstanding: No Value ("..value..")"
  end
  return "Notional Percentage Outstanding: "..value/10000
end

-- Dissect: Notional Percentage Outstanding
dissect.notional_percentage_outstanding = function(buffer, offset, packet, parent)
  local length = size_of.notional_percentage_outstanding
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.notional_percentage_outstanding(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.notional_percentage_outstanding, range, value, display)

  return offset + length, value
end

-- Size: Seniority
size_of.seniority = 2

-- Display: Seniority
display.seniority = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Seniority: No Value"
  end

  return "Seniority: "..value
end

-- Dissect: Seniority
dissect.seniority = function(buffer, offset, packet, parent)
  local length = size_of.seniority
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.seniority(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.seniority, range, value, display)

  return offset + length, value
end

-- Size: Restructuring Type
size_of.restructuring_type = 2

-- Display: Restructuring Type
display.restructuring_type = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Restructuring Type: No Value"
  end

  return "Restructuring Type: "..value
end

-- Dissect: Restructuring Type
dissect.restructuring_type = function(buffer, offset, packet, parent)
  local length = size_of.restructuring_type
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.restructuring_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.restructuring_type, range, value, display)

  return offset + length, value
end

-- Size: Mantissa32
size_of.mantissa32 = 4

-- Display: Mantissa32
display.mantissa32 = function(value)
  -- Check if field has value
  if value == 2147483647 then
    return "Mantissa32: No Value ("..value..")"
  end

  return "Mantissa32: "..value
end

-- Dissect: Mantissa32
dissect.mantissa32 = function(buffer, offset, packet, parent)
  local length = size_of.mantissa32
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.mantissa32(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.mantissa32, range, value, display)

  return offset + length, value
end

-- Calculate size of: Coupon Rate
size_of.coupon_rate = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa32

  index = index + size_of.exponent

  return index
end

-- Display: Coupon Rate
display.coupon_rate = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Coupon Rate
dissect.coupon_rate_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa32: 4 Byte Signed Fixed Width Integer Nullable
  index, mantissa32 = dissect.mantissa32(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa32, exponent
end

-- Dissect: Coupon Rate
dissect.coupon_rate = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.coupon_rate then
    local length = size_of.coupon_rate(buffer, offset)
    local range = buffer(offset, length)
    local display = display.coupon_rate(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.coupon_rate, range, display)
  end

  return dissect.coupon_rate_fields(buffer, offset, packet, parent)
end

-- Size: Maturity Date
size_of.maturity_date = 2

-- Display: Maturity Date
display.maturity_date = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Maturity Date: No Value ("..value..")"
  end

  return "Maturity Date: "..value
end

-- Dissect: Maturity Date
dissect.maturity_date = function(buffer, offset, packet, parent)
  local length = size_of.maturity_date
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.maturity_date(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.maturity_date, range, value, display)

  return offset + length, value
end

-- Size: Product
size_of.product = 1

-- Display: Product
display.product = function(value)
  -- Check if field has value
  if value == 255 then
    return "Product: No Value ("..value..")"
  end

  return "Product: "..value
end

-- Dissect: Product
dissect.product = function(buffer, offset, packet, parent)
  local length = size_of.product
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.product(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.product, range, value, display)

  return offset + length, value
end

-- Size: Security Exchange
size_of.security_exchange = 4

-- Display: Security Exchange
display.security_exchange = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Security Exchange: No Value"
  end

  return "Security Exchange: "..value
end

-- Dissect: Security Exchange
dissect.security_exchange = function(buffer, offset, packet, parent)
  local length = size_of.security_exchange
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.security_exchange(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.security_exchange, range, value, display)

  return offset + length, value
end

-- Size: Week
size_of.week = 1

-- Display: Week
display.week = function(value)
  -- Check if field has value
  if value == 255 then
    return "Week: No Value ("..value..")"
  end

  return "Week: "..value
end

-- Dissect: Week
dissect.week = function(buffer, offset, packet, parent)
  local length = size_of.week
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.week(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.week, range, value, display)

  return offset + length, value
end

-- Size: Day
size_of.day = 1

-- Display: Day
display.day = function(value)
  -- Check if field has value
  if value == 255 then
    return "Day: No Value ("..value..")"
  end

  return "Day: "..value
end

-- Dissect: Day
dissect.day = function(buffer, offset, packet, parent)
  local length = size_of.day
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.day(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.day, range, value, display)

  return offset + length, value
end

-- Size: Month
size_of.month = 1

-- Display: Month
display.month = function(value)
  -- Check if field has value
  if value == 255 then
    return "Month: No Value ("..value..")"
  end

  return "Month: "..value
end

-- Dissect: Month
dissect.month = function(buffer, offset, packet, parent)
  local length = size_of.month
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.month(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.month, range, value, display)

  return offset + length, value
end

-- Size: Year
size_of.year = 2

-- Display: Year
display.year = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Year: No Value ("..value..")"
  end

  return "Year: "..value
end

-- Dissect: Year
dissect.year = function(buffer, offset, packet, parent)
  local length = size_of.year
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.year(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.year, range, value, display)

  return offset + length, value
end

-- Calculate size of: Maturity Month Year
size_of.maturity_month_year = function(buffer, offset)
  local index = 0

  index = index + size_of.year

  index = index + size_of.month

  index = index + size_of.day

  index = index + size_of.week

  return index
end

-- Display: Maturity Month Year
display.maturity_month_year = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Maturity Month Year
dissect.maturity_month_year_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Year: 2 Byte Unsigned Fixed Width Integer Nullable
  index, year = dissect.year(buffer, index, packet, parent)

  -- Month: 1 Byte Unsigned Fixed Width Integer Nullable
  index, month = dissect.month(buffer, index, packet, parent)

  -- Day: 1 Byte Unsigned Fixed Width Integer Nullable
  index, day = dissect.day(buffer, index, packet, parent)

  -- Week: 1 Byte Unsigned Fixed Width Integer Nullable
  index, week = dissect.week(buffer, index, packet, parent)

  return index
end

-- Dissect: Maturity Month Year
dissect.maturity_month_year = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.maturity_month_year then
    local length = size_of.maturity_month_year(buffer, offset)
    local range = buffer(offset, length)
    local display = display.maturity_month_year(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.maturity_month_year, range, display)
  end

  return dissect.maturity_month_year_fields(buffer, offset, packet, parent)
end

-- Size: Security Type
size_of.security_type = 4

-- Display: Security Type
display.security_type = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Security Type: No Value"
  end

  return "Security Type: "..value
end

-- Dissect: Security Type
dissect.security_type = function(buffer, offset, packet, parent)
  local length = size_of.security_type
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.security_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.security_type, range, value, display)

  return offset + length, value
end

-- Size: Security Group
size_of.security_group = 12

-- Display: Security Group
display.security_group = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Security Group: No Value"
  end

  return "Security Group: "..value
end

-- Dissect: Security Group
dissect.security_group = function(buffer, offset, packet, parent)
  local length = size_of.security_group
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.security_group(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.security_group, range, value, display)

  return offset + length, value
end

-- Size: Symbol
size_of.symbol = 50

-- Display: Symbol
display.symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol: No Value"
  end

  return "Symbol: "..value
end

-- Dissect: Symbol
dissect.symbol = function(buffer, offset, packet, parent)
  local length = size_of.symbol
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.symbol(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Md Entry Size
size_of.md_entry_size = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Md Entry Size
display.md_entry_size = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Entry Size
dissect.md_entry_size_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Md Entry Size
dissect.md_entry_size = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.md_entry_size then
    local length = size_of.md_entry_size(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_entry_size(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_entry_size, range, display)
  end

  return dissect.md_entry_size_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Entry Px
size_of.md_entry_px = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Md Entry Px
display.md_entry_px = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Entry Px
dissect.md_entry_px_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Md Entry Px
dissect.md_entry_px = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.md_entry_px then
    local length = size_of.md_entry_px(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_entry_px(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_entry_px, range, display)
  end

  return dissect.md_entry_px_fields(buffer, offset, packet, parent)
end

-- Size: Rpt Seq
size_of.rpt_seq = 4

-- Display: Rpt Seq
display.rpt_seq = function(value)
  return "Rpt Seq: "..value
end

-- Dissect: Rpt Seq
dissect.rpt_seq = function(buffer, offset, packet, parent)
  local length = size_of.rpt_seq
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.rpt_seq(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.rpt_seq, range, value, display)

  return offset + length, value
end

-- Size: Md Entry Type
size_of.md_entry_type = 1

-- Display: Md Entry Type
display.md_entry_type = function(value)
  if value == "0" then
    return "Md Entry Type: Bid (0)"
  end
  if value == "1" then
    return "Md Entry Type: Offer (1)"
  end
  if value == "2" then
    return "Md Entry Type: Trade (2)"
  end
  if value == "3" then
    return "Md Entry Type: Index Value (3)"
  end
  if value == "4" then
    return "Md Entry Type: Opening Value (4)"
  end
  if value == "5" then
    return "Md Entry Type: Closing Price (5)"
  end
  if value == "6" then
    return "Md Entry Type: Settlement Price (6)"
  end
  if value == "7" then
    return "Md Entry Type: Session High Price (7)"
  end
  if value == "8" then
    return "Md Entry Type: Session Low Price (8)"
  end
  if value == "e" then
    return "Md Entry Type: Trade Volume (e)"
  end

  return "Md Entry Type: Unknown("..value..")"
end

-- Dissect: Md Entry Type
dissect.md_entry_type = function(buffer, offset, packet, parent)
  local length = size_of.md_entry_type
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.md_entry_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.md_entry_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: M D Incremental Refresh Otc Group
size_of.m_d_incremental_refresh_otc_group = function(buffer, offset)
  local index = 0

  index = index + size_of.md_entry_type

  index = index + size_of.rpt_seq

  index = index + size_of.md_entry_px(buffer, offset + index)

  index = index + size_of.md_entry_size(buffer, offset + index)

  index = index + size_of.symbol

  index = index + size_of.security_group

  index = index + size_of.security_type

  index = index + size_of.maturity_month_year(buffer, offset + index)

  index = index + size_of.security_exchange

  index = index + size_of.product

  index = index + size_of.maturity_date

  index = index + size_of.coupon_rate(buffer, offset + index)

  index = index + size_of.restructuring_type

  index = index + size_of.seniority

  index = index + size_of.notional_percentage_outstanding

  index = index + size_of.put_or_call

  index = index + size_of.strike_price(buffer, offset + index)

  index = index + size_of.unit_of_measure

  index = index + size_of.unit_of_measure_currency

  index = index + size_of.unit_of_measure_qty(buffer, offset + index)

  index = index + size_of.md_entry_date

  index = index + size_of.open_close_settl_flag

  index = index + size_of.price_type

  index = index + size_of.settl_date

  index = index + size_of.quote_condition

  index = index + size_of.market_sector

  index = index + size_of.sector_group

  index = index + size_of.sector_sub_group

  index = index + size_of.product_complex

  index = index + size_of.security_sub_type

  index = index + size_of.vol_type

  index = index + size_of.reference_id

  return index
end

-- Display: M D Incremental Refresh Otc Group
display.m_d_incremental_refresh_otc_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Otc Group
dissect.m_d_incremental_refresh_otc_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Md Entry Type: 1 Byte Ascii String Enum with 10 values
  index, md_entry_type = dissect.md_entry_type(buffer, index, packet, parent)

  -- Rpt Seq: 4 Byte Unsigned Fixed Width Integer
  index, rpt_seq = dissect.rpt_seq(buffer, index, packet, parent)

  -- Md Entry Px: 8 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_px = dissect.md_entry_px(buffer, index, packet, parent)

  -- Md Entry Size: 8 Byte Unsigned Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_size = dissect.md_entry_size(buffer, index, packet, parent)

  -- Symbol: 50 Byte Ascii String Nullable
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Security Group: 12 Byte Ascii String Nullable
  index, security_group = dissect.security_group(buffer, index, packet, parent)

  -- Security Type: 4 Byte Ascii String Nullable
  index, security_type = dissect.security_type(buffer, index, packet, parent)

  -- Maturity Month Year: Struct of 4 fields
  index, maturity_month_year = dissect.maturity_month_year(buffer, index, packet, parent)

  -- Security Exchange: 4 Byte Ascii String Nullable
  index, security_exchange = dissect.security_exchange(buffer, index, packet, parent)

  -- Product: 1 Byte Signed Fixed Width Integer Nullable
  index, product = dissect.product(buffer, index, packet, parent)

  -- Maturity Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, maturity_date = dissect.maturity_date(buffer, index, packet, parent)

  -- Coupon Rate: 4 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, coupon_rate = dissect.coupon_rate(buffer, index, packet, parent)

  -- Restructuring Type: 2 Byte Ascii String Nullable
  index, restructuring_type = dissect.restructuring_type(buffer, index, packet, parent)

  -- Seniority: 2 Byte Ascii String Nullable
  index, seniority = dissect.seniority(buffer, index, packet, parent)

  -- Notional Percentage Outstanding: 4 Byte Signed Fixed Width Integer Nullable
  index, notional_percentage_outstanding = dissect.notional_percentage_outstanding(buffer, index, packet, parent)

  -- Put Or Call: 1 Byte Unsigned Fixed Width Integer Nullable
  index, put_or_call = dissect.put_or_call(buffer, index, packet, parent)

  -- Strike Price: 8 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, strike_price = dissect.strike_price(buffer, index, packet, parent)

  -- Unit Of Measure: 5 Byte Ascii String Nullable
  index, unit_of_measure = dissect.unit_of_measure(buffer, index, packet, parent)

  -- Unit Of Measure Currency: 3 Byte Ascii String Nullable
  index, unit_of_measure_currency = dissect.unit_of_measure_currency(buffer, index, packet, parent)

  -- Unit Of Measure Qty: 8 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, unit_of_measure_qty = dissect.unit_of_measure_qty(buffer, index, packet, parent)

  -- Md Entry Date: 4 Byte Signed Fixed Width Integer Nullable
  index, md_entry_date = dissect.md_entry_date(buffer, index, packet, parent)

  -- Open Close Settl Flag: 1 Byte Unsigned Fixed Width Integer Nullable
  index, open_close_settl_flag = dissect.open_close_settl_flag(buffer, index, packet, parent)

  -- Price Type: 2 Byte Unsigned Fixed Width Integer Nullable
  index, price_type = dissect.price_type(buffer, index, packet, parent)

  -- Settl Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, settl_date = dissect.settl_date(buffer, index, packet, parent)

  -- Quote Condition: 1 Byte Ascii String
  index, quote_condition = dissect.quote_condition(buffer, index, packet, parent)

  -- Market Sector: 26 Byte Ascii String Nullable
  index, market_sector = dissect.market_sector(buffer, index, packet, parent)

  -- Sector Group: 2 Byte Ascii String Nullable
  index, sector_group = dissect.sector_group(buffer, index, packet, parent)

  -- Sector Sub Group: 26 Byte Ascii String Nullable
  index, sector_sub_group = dissect.sector_sub_group(buffer, index, packet, parent)

  -- Product Complex: 26 Byte Ascii String Nullable
  index, product_complex = dissect.product_complex(buffer, index, packet, parent)

  -- Security Sub Type: 2 Byte Ascii String Nullable
  index, security_sub_type = dissect.security_sub_type(buffer, index, packet, parent)

  -- Vol Type: 2 Byte Unsigned Fixed Width Integer Nullable
  index, vol_type = dissect.vol_type(buffer, index, packet, parent)

  -- Reference Id: 50 Byte Ascii String Nullable
  index, reference_id = dissect.reference_id(buffer, index, packet, parent)

  return index
end

-- Dissect: M D Incremental Refresh Otc Group
dissect.m_d_incremental_refresh_otc_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.m_d_incremental_refresh_otc_group then
    local length = size_of.m_d_incremental_refresh_otc_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_otc_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_otc_group, range, display)
  end

  return dissect.m_d_incremental_refresh_otc_group_fields(buffer, offset, packet, parent)
end

-- Size: Num In Group
size_of.num_in_group = 1

-- Display: Num In Group
display.num_in_group = function(value)
  return "Num In Group: "..value
end

-- Dissect: Num In Group
dissect.num_in_group = function(buffer, offset, packet, parent)
  local length = size_of.num_in_group
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.num_in_group(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.num_in_group, range, value, display)

  return offset + length, value
end

-- Size: Block Length
size_of.block_length = 2

-- Display: Block Length
display.block_length = function(value)
  return "Block Length: "..value
end

-- Dissect: Block Length
dissect.block_length = function(buffer, offset, packet, parent)
  local length = size_of.block_length
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.block_length(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.block_length, range, value, display)

  return offset + length, value
end

-- Calculate size of: Group Size
size_of.group_size = function(buffer, offset)
  local index = 0

  index = index + size_of.block_length

  index = index + size_of.num_in_group

  return index
end

-- Display: Group Size
display.group_size = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Group Size
dissect.group_size_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Block Length: 2 Byte Unsigned Fixed Width Integer
  index, block_length = dissect.block_length(buffer, index, packet, parent)

  -- Num In Group: 1 Byte Unsigned Fixed Width Integer
  index, num_in_group = dissect.num_in_group(buffer, index, packet, parent)

  return index
end

-- Dissect: Group Size
dissect.group_size = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.group_size then
    local length = size_of.group_size(buffer, offset)
    local range = buffer(offset, length)
    local display = display.group_size(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.group_size, range, display)
  end

  return dissect.group_size_fields(buffer, offset, packet, parent)
end

-- Calculate size of: M D Incremental Refresh Otc Groups
size_of.m_d_incremental_refresh_otc_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local m_d_incremental_refresh_otc_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + m_d_incremental_refresh_otc_group_count * 285

  return index
end

-- Display: M D Incremental Refresh Otc Groups
display.m_d_incremental_refresh_otc_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Otc Groups
dissect.m_d_incremental_refresh_otc_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- M D Incremental Refresh Otc Group: Struct of 32 fields
  for i = 1, num_in_group do
    index = dissect.m_d_incremental_refresh_otc_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: M D Incremental Refresh Otc Groups
dissect.m_d_incremental_refresh_otc_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.m_d_incremental_refresh_otc_groups then
    local length = size_of.m_d_incremental_refresh_otc_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_otc_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_otc_groups, range, display)
  end

  return dissect.m_d_incremental_refresh_otc_groups_fields(buffer, offset, packet, parent)
end

-- Size: Batch Total Messages
size_of.batch_total_messages = 2

-- Display: Batch Total Messages
display.batch_total_messages = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Batch Total Messages: No Value ("..value..")"
  end

  return "Batch Total Messages: "..value
end

-- Dissect: Batch Total Messages
dissect.batch_total_messages = function(buffer, offset, packet, parent)
  local length = size_of.batch_total_messages
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.batch_total_messages(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.batch_total_messages, range, value, display)

  return offset + length, value
end

-- Size: Match Event Indicator
size_of.match_event_indicator = 1

-- Display: Match Event Indicator
display.match_event_indicator = function(buffer, packet, parent)
  local display = ""

  -- Is End Of Event flag set?
  if buffer:bitfield(0) > 0 then
    display = display.."End Of Event|"
  end
  -- Is Reserved flag set?
  if buffer:bitfield(1) > 0 then
    display = display.."Reserved|"
  end
  -- Is Recovery Msg flag set?
  if buffer:bitfield(2) > 0 then
    display = display.."Recovery Msg|"
  end
  -- Is Last Implied Msg flag set?
  if buffer:bitfield(3) > 0 then
    display = display.."Last Implied Msg|"
  end
  -- Is Last Stats Msg flag set?
  if buffer:bitfield(4) > 0 then
    display = display.."Last Stats Msg|"
  end
  -- Is Last Quote Msg flag set?
  if buffer:bitfield(5) > 0 then
    display = display.."Last Quote Msg|"
  end
  -- Is Last Volume Msg flag set?
  if buffer:bitfield(6) > 0 then
    display = display.."Last Volume Msg|"
  end
  -- Is Last Trade Msg flag set?
  if buffer:bitfield(7) > 0 then
    display = display.."Last Trade Msg|"
  end

  return display:sub(1, -2)
end

-- Dissect Bit Fields: Match Event Indicator
dissect.match_event_indicator_bits = function(buffer, offset, packet, parent)

  -- End Of Event: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.end_of_event, buffer(offset, 1))

  -- Reserved: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.reserved, buffer(offset, 1))

  -- Recovery Msg: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.recovery_msg, buffer(offset, 1))

  -- Last Implied Msg: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.last_implied_msg, buffer(offset, 1))

  -- Last Stats Msg: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.last_stats_msg, buffer(offset, 1))

  -- Last Quote Msg: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.last_quote_msg, buffer(offset, 1))

  -- Last Volume Msg: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.last_volume_msg, buffer(offset, 1))

  -- Last Trade Msg: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.last_trade_msg, buffer(offset, 1))
end

-- Dissect: Match Event Indicator
dissect.match_event_indicator = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local display = display.match_event_indicator(range, packet, parent)
  local element = parent:add(cme_futures_streamline_sbe_v5_9.fields.match_event_indicator, range, display)

  if show.match_event_indicator then
    dissect.match_event_indicator_bits(buffer, offset, packet, element)
  end

  return offset + 1, range
end

-- Size: Trade Date
size_of.trade_date = 2

-- Display: Trade Date
display.trade_date = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Trade Date: No Value ("..value..")"
  end

  return "Trade Date: "..value
end

-- Dissect: Trade Date
dissect.trade_date = function(buffer, offset, packet, parent)
  local length = size_of.trade_date
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.trade_date(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.trade_date, range, value, display)

  return offset + length, value
end

-- Size: Transact Time
size_of.transact_time = 8

-- Display: Transact Time
display.transact_time = function(value)
  -- Check if field has value
  if value == 18446744073709551615 then
    return "Transact Time: No Value ("..value..")"
  end

  return "Transact Time: "..value
end

-- Dissect: Transact Time
dissect.transact_time = function(buffer, offset, packet, parent)
  local length = size_of.transact_time
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.transact_time(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.transact_time, range, value, display)

  return offset + length, value
end

-- Calculate size of: Md Incremental Refresh Ot C 366
size_of.md_incremental_refresh_ot_c_366 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.trade_date

  index = index + size_of.match_event_indicator

  index = index + size_of.batch_total_messages

  index = index + size_of.m_d_incremental_refresh_otc_groups(buffer, offset + index)

  return index
end

-- Display: Md Incremental Refresh Ot C 366
display.md_incremental_refresh_ot_c_366 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Incremental Refresh Ot C 366
dissect.md_incremental_refresh_ot_c_366_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, trade_date = dissect.trade_date(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Batch Total Messages: 2 Byte Unsigned Fixed Width Integer Nullable
  index, batch_total_messages = dissect.batch_total_messages(buffer, index, packet, parent)

  -- M D Incremental Refresh Otc Groups: Struct of 2 fields
  index, m_d_incremental_refresh_otc_groups = dissect.m_d_incremental_refresh_otc_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Incremental Refresh Ot C 366
dissect.md_incremental_refresh_ot_c_366 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_incremental_refresh_ot_c_366 then
    local length = size_of.md_incremental_refresh_ot_c_366(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_incremental_refresh_ot_c_366(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_ot_c_366, range, display)
  end

  return dissect.md_incremental_refresh_ot_c_366_fields(buffer, offset, packet, parent)
end

-- Size: Leg Ref Id
size_of.leg_ref_id = 17

-- Display: Leg Ref Id
display.leg_ref_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Leg Ref Id: No Value"
  end

  return "Leg Ref Id: "..value
end

-- Dissect: Leg Ref Id
dissect.leg_ref_id = function(buffer, offset, packet, parent)
  local length = size_of.leg_ref_id
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.leg_ref_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_ref_id, range, value, display)

  return offset + length, value
end

-- Size: Strategy Link Id
size_of.strategy_link_id = 26

-- Display: Strategy Link Id
display.strategy_link_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Strategy Link Id: No Value"
  end

  return "Strategy Link Id: "..value
end

-- Dissect: Strategy Link Id
dissect.strategy_link_id = function(buffer, offset, packet, parent)
  local length = size_of.strategy_link_id
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.strategy_link_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.strategy_link_id, range, value, display)

  return offset + length, value
end

-- Size: Md Entry Id
size_of.md_entry_id = 26

-- Display: Md Entry Id
display.md_entry_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Md Entry Id: No Value"
  end

  return "Md Entry Id: "..value
end

-- Dissect: Md Entry Id
dissect.md_entry_id = function(buffer, offset, packet, parent)
  local length = size_of.md_entry_id
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.md_entry_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.md_entry_id, range, value, display)

  return offset + length, value
end

-- Size: Trd Type
size_of.trd_type = 1

-- Display: Trd Type
display.trd_type = function(value)
  -- Check if field has value
  if value == 255 then
    return "Trd Type: No Value ("..value..")"
  end

  return "Trd Type: "..value
end

-- Dissect: Trd Type
dissect.trd_type = function(buffer, offset, packet, parent)
  local length = size_of.trd_type
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.trd_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.trd_type, range, value, display)

  return offset + length, value
end

-- Size: Aggressor Side
size_of.aggressor_side = 1

-- Display: Aggressor Side
display.aggressor_side = function(value)
  if value == 0 then
    return "Aggressor Side: No Aggressor (0)"
  end
  if value == 1 then
    return "Aggressor Side: Buy (1)"
  end
  if value == 2 then
    return "Aggressor Side: Sell (2)"
  end
  if value == 255 then
    return "Aggressor Side: No Value (255)"
  end

  return "Aggressor Side: Unknown("..value..")"
end

-- Dissect: Aggressor Side
dissect.aggressor_side = function(buffer, offset, packet, parent)
  local length = size_of.aggressor_side
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.aggressor_side(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.aggressor_side, range, value, display)

  return offset + length, value
end

-- Size: Trade Id
size_of.trade_id = 4

-- Display: Trade Id
display.trade_id = function(value)
  return "Trade Id: "..value
end

-- Dissect: Trade Id
dissect.trade_id = function(buffer, offset, packet, parent)
  local length = size_of.trade_id
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.trade_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.trade_id, range, value, display)

  return offset + length, value
end

-- Size: Number Of Orders
size_of.number_of_orders = 4

-- Display: Number Of Orders
display.number_of_orders = function(value)
  -- Check if field has value
  if value == 2147483647 then
    return "Number Of Orders: No Value ("..value..")"
  end

  return "Number Of Orders: "..value
end

-- Dissect: Number Of Orders
dissect.number_of_orders = function(buffer, offset, packet, parent)
  local length = size_of.number_of_orders
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.number_of_orders(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.number_of_orders, range, value, display)

  return offset + length, value
end

-- Size: Security Id
size_of.security_id = 8

-- Display: Security Id
display.security_id = function(value)
  -- Check if field has value
  if value == 18446744073709551615 then
    return "Security Id: No Value ("..value..")"
  end

  return "Security Id: "..value
end

-- Dissect: Security Id
dissect.security_id = function(buffer, offset, packet, parent)
  local length = size_of.security_id
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.security_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.security_id, range, value, display)

  return offset + length, value
end

-- Size: Md Update Action
size_of.md_update_action = 1

-- Display: Md Update Action
display.md_update_action = function(value)
  if value == 0 then
    return "Md Update Action: New (0)"
  end
  if value == 1 then
    return "Md Update Action: Change (1)"
  end
  if value == 2 then
    return "Md Update Action: Delete (2)"
  end
  if value == 3 then
    return "Md Update Action: Delete Thru (3)"
  end
  if value == 4 then
    return "Md Update Action: Delete From (4)"
  end
  if value == 5 then
    return "Md Update Action: Overlay (5)"
  end

  return "Md Update Action: Unknown("..value..")"
end

-- Dissect: Md Update Action
dissect.md_update_action = function(buffer, offset, packet, parent)
  local length = size_of.md_update_action
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.md_update_action(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.md_update_action, range, value, display)

  return offset + length, value
end

-- Calculate size of: M D Incremental Refresh Trade Blocks Group
size_of.m_d_incremental_refresh_trade_blocks_group = function(buffer, offset)
  local index = 0

  index = index + size_of.md_update_action

  index = index + size_of.security_id

  index = index + size_of.rpt_seq

  index = index + size_of.md_entry_px(buffer, offset + index)

  index = index + size_of.md_entry_size(buffer, offset + index)

  index = index + size_of.number_of_orders

  index = index + size_of.trade_id

  index = index + size_of.aggressor_side

  index = index + size_of.symbol

  index = index + size_of.security_group

  index = index + size_of.security_type

  index = index + size_of.security_sub_type

  index = index + size_of.maturity_month_year(buffer, offset + index)

  index = index + size_of.security_exchange

  index = index + size_of.maturity_date

  index = index + size_of.unit_of_measure

  index = index + size_of.unit_of_measure_currency

  index = index + size_of.unit_of_measure_qty(buffer, offset + index)

  index = index + size_of.coupon_rate(buffer, offset + index)

  index = index + size_of.price_type

  index = index + size_of.trd_type

  index = index + size_of.md_entry_id

  index = index + size_of.put_or_call

  index = index + size_of.strike_price(buffer, offset + index)

  index = index + size_of.restructuring_type

  index = index + size_of.seniority

  index = index + size_of.reference_id

  index = index + size_of.strategy_link_id

  index = index + size_of.leg_ref_id

  return index
end

-- Display: M D Incremental Refresh Trade Blocks Group
display.m_d_incremental_refresh_trade_blocks_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Trade Blocks Group
dissect.m_d_incremental_refresh_trade_blocks_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Md Update Action: 1 Byte Unsigned Fixed Width Integer Enum with 6 values
  index, md_update_action = dissect.md_update_action(buffer, index, packet, parent)

  -- Security Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, security_id = dissect.security_id(buffer, index, packet, parent)

  -- Rpt Seq: 4 Byte Unsigned Fixed Width Integer
  index, rpt_seq = dissect.rpt_seq(buffer, index, packet, parent)

  -- Md Entry Px: 8 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_px = dissect.md_entry_px(buffer, index, packet, parent)

  -- Md Entry Size: 8 Byte Unsigned Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_size = dissect.md_entry_size(buffer, index, packet, parent)

  -- Number Of Orders: 4 Byte Signed Fixed Width Integer Nullable
  index, number_of_orders = dissect.number_of_orders(buffer, index, packet, parent)

  -- Trade Id: 4 Byte Signed Fixed Width Integer
  index, trade_id = dissect.trade_id(buffer, index, packet, parent)

  -- Aggressor Side: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, aggressor_side = dissect.aggressor_side(buffer, index, packet, parent)

  -- Symbol: 50 Byte Ascii String Nullable
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Security Group: 12 Byte Ascii String Nullable
  index, security_group = dissect.security_group(buffer, index, packet, parent)

  -- Security Type: 4 Byte Ascii String Nullable
  index, security_type = dissect.security_type(buffer, index, packet, parent)

  -- Security Sub Type: 2 Byte Ascii String Nullable
  index, security_sub_type = dissect.security_sub_type(buffer, index, packet, parent)

  -- Maturity Month Year: Struct of 4 fields
  index, maturity_month_year = dissect.maturity_month_year(buffer, index, packet, parent)

  -- Security Exchange: 4 Byte Ascii String Nullable
  index, security_exchange = dissect.security_exchange(buffer, index, packet, parent)

  -- Maturity Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, maturity_date = dissect.maturity_date(buffer, index, packet, parent)

  -- Unit Of Measure: 5 Byte Ascii String Nullable
  index, unit_of_measure = dissect.unit_of_measure(buffer, index, packet, parent)

  -- Unit Of Measure Currency: 3 Byte Ascii String Nullable
  index, unit_of_measure_currency = dissect.unit_of_measure_currency(buffer, index, packet, parent)

  -- Unit Of Measure Qty: 8 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, unit_of_measure_qty = dissect.unit_of_measure_qty(buffer, index, packet, parent)

  -- Coupon Rate: 4 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, coupon_rate = dissect.coupon_rate(buffer, index, packet, parent)

  -- Price Type: 2 Byte Unsigned Fixed Width Integer Nullable
  index, price_type = dissect.price_type(buffer, index, packet, parent)

  -- Trd Type: 1 Byte Unsigned Fixed Width Integer Nullable
  index, trd_type = dissect.trd_type(buffer, index, packet, parent)

  -- Md Entry Id: 26 Byte Ascii String Nullable
  index, md_entry_id = dissect.md_entry_id(buffer, index, packet, parent)

  -- Put Or Call: 1 Byte Unsigned Fixed Width Integer Nullable
  index, put_or_call = dissect.put_or_call(buffer, index, packet, parent)

  -- Strike Price: 8 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, strike_price = dissect.strike_price(buffer, index, packet, parent)

  -- Restructuring Type: 2 Byte Ascii String Nullable
  index, restructuring_type = dissect.restructuring_type(buffer, index, packet, parent)

  -- Seniority: 2 Byte Ascii String Nullable
  index, seniority = dissect.seniority(buffer, index, packet, parent)

  -- Reference Id: 50 Byte Ascii String Nullable
  index, reference_id = dissect.reference_id(buffer, index, packet, parent)

  -- Strategy Link Id: 26 Byte Ascii String Nullable
  index, strategy_link_id = dissect.strategy_link_id(buffer, index, packet, parent)

  -- Leg Ref Id: 17 Byte Ascii String Nullable
  index, leg_ref_id = dissect.leg_ref_id(buffer, index, packet, parent)

  return index
end

-- Dissect: M D Incremental Refresh Trade Blocks Group
dissect.m_d_incremental_refresh_trade_blocks_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.m_d_incremental_refresh_trade_blocks_group then
    local length = size_of.m_d_incremental_refresh_trade_blocks_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_trade_blocks_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_trade_blocks_group, range, display)
  end

  return dissect.m_d_incremental_refresh_trade_blocks_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: M D Incremental Refresh Trade Blocks Groups
size_of.m_d_incremental_refresh_trade_blocks_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local m_d_incremental_refresh_trade_blocks_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + m_d_incremental_refresh_trade_blocks_group_count * 277

  return index
end

-- Display: M D Incremental Refresh Trade Blocks Groups
display.m_d_incremental_refresh_trade_blocks_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Trade Blocks Groups
dissect.m_d_incremental_refresh_trade_blocks_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- M D Incremental Refresh Trade Blocks Group: Struct of 29 fields
  for i = 1, num_in_group do
    index = dissect.m_d_incremental_refresh_trade_blocks_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: M D Incremental Refresh Trade Blocks Groups
dissect.m_d_incremental_refresh_trade_blocks_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.m_d_incremental_refresh_trade_blocks_groups then
    local length = size_of.m_d_incremental_refresh_trade_blocks_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_trade_blocks_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_trade_blocks_groups, range, display)
  end

  return dissect.m_d_incremental_refresh_trade_blocks_groups_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Incremental Refresh Trade Blocks 365
size_of.md_incremental_refresh_trade_blocks_365 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.match_event_indicator

  index = index + size_of.batch_total_messages

  index = index + size_of.trade_date

  index = index + size_of.m_d_incremental_refresh_trade_blocks_groups(buffer, offset + index)

  return index
end

-- Display: Md Incremental Refresh Trade Blocks 365
display.md_incremental_refresh_trade_blocks_365 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Incremental Refresh Trade Blocks 365
dissect.md_incremental_refresh_trade_blocks_365_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Batch Total Messages: 2 Byte Unsigned Fixed Width Integer Nullable
  index, batch_total_messages = dissect.batch_total_messages(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, trade_date = dissect.trade_date(buffer, index, packet, parent)

  -- M D Incremental Refresh Trade Blocks Groups: Struct of 2 fields
  index, m_d_incremental_refresh_trade_blocks_groups = dissect.m_d_incremental_refresh_trade_blocks_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Incremental Refresh Trade Blocks 365
dissect.md_incremental_refresh_trade_blocks_365 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_incremental_refresh_trade_blocks_365 then
    local length = size_of.md_incremental_refresh_trade_blocks_365(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_incremental_refresh_trade_blocks_365(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_trade_blocks_365, range, display)
  end

  return dissect.md_incremental_refresh_trade_blocks_365_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Interpolation Factor
size_of.interpolation_factor = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Interpolation Factor
display.interpolation_factor = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Interpolation Factor
dissect.interpolation_factor_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Interpolation Factor
dissect.interpolation_factor = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.interpolation_factor then
    local length = size_of.interpolation_factor(buffer, offset)
    local range = buffer(offset, length)
    local display = display.interpolation_factor(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.interpolation_factor, range, display)
  end

  return dissect.interpolation_factor_fields(buffer, offset, packet, parent)
end

-- Size: Leg Date Offset
size_of.leg_date_offset = 1

-- Display: Leg Date Offset
display.leg_date_offset = function(value)
  -- Check if field has value
  if value == 127 then
    return "Leg Date Offset: No Value ("..value..")"
  end

  return "Leg Date Offset: "..value
end

-- Dissect: Leg Date Offset
dissect.leg_date_offset = function(buffer, offset, packet, parent)
  local length = size_of.leg_date_offset
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.leg_date_offset(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_date_offset, range, value, display)

  return offset + length, value
end

-- Size: Leg Security Group
size_of.leg_security_group = 12

-- Display: Leg Security Group
display.leg_security_group = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Leg Security Group: No Value"
  end

  return "Leg Security Group: "..value
end

-- Dissect: Leg Security Group
dissect.leg_security_group = function(buffer, offset, packet, parent)
  local length = size_of.leg_security_group
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.leg_security_group(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_security_group, range, value, display)

  return offset + length, value
end

-- Size: Leg Security Type
size_of.leg_security_type = 8

-- Display: Leg Security Type
display.leg_security_type = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Leg Security Type: No Value"
  end

  return "Leg Security Type: "..value
end

-- Dissect: Leg Security Type
dissect.leg_security_type = function(buffer, offset, packet, parent)
  local length = size_of.leg_security_type
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.leg_security_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_security_type, range, value, display)

  return offset + length, value
end

-- Size: Leg Currency
size_of.leg_currency = 3

-- Display: Leg Currency
display.leg_currency = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Leg Currency: No Value"
  end

  return "Leg Currency: "..value
end

-- Dissect: Leg Currency
dissect.leg_currency = function(buffer, offset, packet, parent)
  local length = size_of.leg_currency
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.leg_currency(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_currency, range, value, display)

  return offset + length, value
end

-- Size: Leg Side
size_of.leg_side = 1

-- Display: Leg Side
display.leg_side = function(value)
  -- Check if field has value
  if value == 255 then
    return "Leg Side: No Value ("..value..")"
  end

  return "Leg Side: "..value
end

-- Dissect: Leg Side
dissect.leg_side = function(buffer, offset, packet, parent)
  local length = size_of.leg_side
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.leg_side(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_side, range, value, display)

  return offset + length, value
end

-- Size: Leg Ratio Qty
size_of.leg_ratio_qty = 4

-- Display: Leg Ratio Qty
display.leg_ratio_qty = function(value)
  -- Check if field has value
  if value == 2147483647 then
    return "Leg Ratio Qty: No Value ("..value..")"
  end

  return "Leg Ratio Qty: "..value
end

-- Dissect: Leg Ratio Qty
dissect.leg_ratio_qty = function(buffer, offset, packet, parent)
  local length = size_of.leg_ratio_qty
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.leg_ratio_qty(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_ratio_qty, range, value, display)

  return offset + length, value
end

-- Size: Leg Symbol
size_of.leg_symbol = 50

-- Display: Leg Symbol
display.leg_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Leg Symbol: No Value"
  end

  return "Leg Symbol: "..value
end

-- Dissect: Leg Symbol
dissect.leg_symbol = function(buffer, offset, packet, parent)
  local length = size_of.leg_symbol
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.leg_symbol(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Previous Fixing Rate
size_of.previous_fixing_rate = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Previous Fixing Rate
display.previous_fixing_rate = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Previous Fixing Rate
dissect.previous_fixing_rate_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Previous Fixing Rate
dissect.previous_fixing_rate = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.previous_fixing_rate then
    local length = size_of.previous_fixing_rate(buffer, offset)
    local range = buffer(offset, length)
    local display = display.previous_fixing_rate(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.previous_fixing_rate, range, display)
  end

  return dissect.previous_fixing_rate_fields(buffer, offset, packet, parent)
end

-- Size: Leg Pay Frequencey
size_of.leg_pay_frequencey = 3

-- Display: Leg Pay Frequencey
display.leg_pay_frequencey = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Leg Pay Frequencey: No Value"
  end

  return "Leg Pay Frequencey: "..value
end

-- Dissect: Leg Pay Frequencey
dissect.leg_pay_frequencey = function(buffer, offset, packet, parent)
  local length = size_of.leg_pay_frequencey
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.leg_pay_frequencey(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_pay_frequencey, range, value, display)

  return offset + length, value
end

-- Size: Previous Fixing Date
size_of.previous_fixing_date = 2

-- Display: Previous Fixing Date
display.previous_fixing_date = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Previous Fixing Date: No Value ("..value..")"
  end

  return "Previous Fixing Date: "..value
end

-- Dissect: Previous Fixing Date
dissect.previous_fixing_date = function(buffer, offset, packet, parent)
  local length = size_of.previous_fixing_date
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.previous_fixing_date(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.previous_fixing_date, range, value, display)

  return offset + length, value
end

-- Size: Rate Descriptor
size_of.rate_descriptor = 8

-- Display: Rate Descriptor
display.rate_descriptor = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Rate Descriptor: No Value"
  end

  return "Rate Descriptor: "..value
end

-- Dissect: Rate Descriptor
dissect.rate_descriptor = function(buffer, offset, packet, parent)
  local length = size_of.rate_descriptor
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.rate_descriptor(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.rate_descriptor, range, value, display)

  return offset + length, value
end

-- Size: Leg Benchmark Curve Name
size_of.leg_benchmark_curve_name = 5

-- Display: Leg Benchmark Curve Name
display.leg_benchmark_curve_name = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Leg Benchmark Curve Name: No Value"
  end

  return "Leg Benchmark Curve Name: "..value
end

-- Dissect: Leg Benchmark Curve Name
dissect.leg_benchmark_curve_name = function(buffer, offset, packet, parent)
  local length = size_of.leg_benchmark_curve_name
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.leg_benchmark_curve_name(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_benchmark_curve_name, range, value, display)

  return offset + length, value
end

-- Calculate size of: M D Instrument Definition Eris Leg Group
size_of.m_d_instrument_definition_eris_leg_group = function(buffer, offset)
  local index = 0

  index = index + size_of.leg_benchmark_curve_name

  index = index + size_of.rate_descriptor

  index = index + size_of.previous_fixing_date

  index = index + size_of.leg_pay_frequencey

  index = index + size_of.previous_fixing_rate(buffer, offset + index)

  index = index + size_of.leg_symbol

  index = index + size_of.leg_ratio_qty

  index = index + size_of.leg_side

  index = index + size_of.leg_currency

  index = index + size_of.leg_security_type

  index = index + size_of.leg_security_group

  index = index + size_of.leg_date_offset

  index = index + size_of.interpolation_factor(buffer, offset + index)

  return index
end

-- Display: M D Instrument Definition Eris Leg Group
display.m_d_instrument_definition_eris_leg_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Instrument Definition Eris Leg Group
dissect.m_d_instrument_definition_eris_leg_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Leg Benchmark Curve Name: 5 Byte Ascii String Nullable
  index, leg_benchmark_curve_name = dissect.leg_benchmark_curve_name(buffer, index, packet, parent)

  -- Rate Descriptor: 8 Byte Ascii String Nullable
  index, rate_descriptor = dissect.rate_descriptor(buffer, index, packet, parent)

  -- Previous Fixing Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, previous_fixing_date = dissect.previous_fixing_date(buffer, index, packet, parent)

  -- Leg Pay Frequencey: 3 Byte Ascii String Nullable
  index, leg_pay_frequencey = dissect.leg_pay_frequencey(buffer, index, packet, parent)

  -- Previous Fixing Rate: Struct of 2 fields
  index, previous_fixing_rate = dissect.previous_fixing_rate(buffer, index, packet, parent)

  -- Leg Symbol: 50 Byte Ascii String Nullable
  index, leg_symbol = dissect.leg_symbol(buffer, index, packet, parent)

  -- Leg Ratio Qty: 4 Byte Signed Fixed Width Integer Nullable
  index, leg_ratio_qty = dissect.leg_ratio_qty(buffer, index, packet, parent)

  -- Leg Side: 1 Byte Unsigned Fixed Width Integer Nullable
  index, leg_side = dissect.leg_side(buffer, index, packet, parent)

  -- Leg Currency: 3 Byte Ascii String
  index, leg_currency = dissect.leg_currency(buffer, index, packet, parent)

  -- Leg Security Type: 8 Byte Ascii String Nullable
  index, leg_security_type = dissect.leg_security_type(buffer, index, packet, parent)

  -- Leg Security Group: 12 Byte Ascii String Nullable
  index, leg_security_group = dissect.leg_security_group(buffer, index, packet, parent)

  -- Leg Date Offset: 1 Byte Signed Fixed Width Integer Nullable
  index, leg_date_offset = dissect.leg_date_offset(buffer, index, packet, parent)

  -- Interpolation Factor: Struct of 2 fields
  index, interpolation_factor = dissect.interpolation_factor(buffer, index, packet, parent)

  return index
end

-- Dissect: M D Instrument Definition Eris Leg Group
dissect.m_d_instrument_definition_eris_leg_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.m_d_instrument_definition_eris_leg_group then
    local length = size_of.m_d_instrument_definition_eris_leg_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_instrument_definition_eris_leg_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_instrument_definition_eris_leg_group, range, display)
  end

  return dissect.m_d_instrument_definition_eris_leg_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: M D Instrument Definition Eris Leg Groups
size_of.m_d_instrument_definition_eris_leg_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local m_d_instrument_definition_eris_leg_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + m_d_instrument_definition_eris_leg_group_count * 115

  return index
end

-- Display: M D Instrument Definition Eris Leg Groups
display.m_d_instrument_definition_eris_leg_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Instrument Definition Eris Leg Groups
dissect.m_d_instrument_definition_eris_leg_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- M D Instrument Definition Eris Leg Group: Struct of 13 fields
  for i = 1, num_in_group do
    index = dissect.m_d_instrument_definition_eris_leg_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: M D Instrument Definition Eris Leg Groups
dissect.m_d_instrument_definition_eris_leg_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.m_d_instrument_definition_eris_leg_groups then
    local length = size_of.m_d_instrument_definition_eris_leg_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_instrument_definition_eris_leg_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_instrument_definition_eris_leg_groups, range, display)
  end

  return dissect.m_d_instrument_definition_eris_leg_groups_fields(buffer, offset, packet, parent)
end

-- Size: Security Alt Id Source
size_of.security_alt_id_source = 1

-- Display: Security Alt Id Source
display.security_alt_id_source = function(value)
  return "Security Alt Id Source: "..value
end

-- Dissect: Security Alt Id Source
dissect.security_alt_id_source = function(buffer, offset, packet, parent)
  local length = size_of.security_alt_id_source
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.security_alt_id_source(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.security_alt_id_source, range, value, display)

  return offset + length, value
end

-- Size: Security Alt Id
size_of.security_alt_id = 26

-- Display: Security Alt Id
display.security_alt_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Security Alt Id: No Value"
  end

  return "Security Alt Id: "..value
end

-- Dissect: Security Alt Id
dissect.security_alt_id = function(buffer, offset, packet, parent)
  local length = size_of.security_alt_id
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.security_alt_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.security_alt_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Security Alt Id Group
size_of.security_alt_id_group = function(buffer, offset)
  local index = 0

  index = index + size_of.security_alt_id

  index = index + size_of.security_alt_id_source

  return index
end

-- Display: Security Alt Id Group
display.security_alt_id_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Security Alt Id Group
dissect.security_alt_id_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Security Alt Id: 26 Byte Ascii String Nullable
  index, security_alt_id = dissect.security_alt_id(buffer, index, packet, parent)

  -- Security Alt Id Source: 1 Byte Ascii String
  index, security_alt_id_source = dissect.security_alt_id_source(buffer, index, packet, parent)

  return index
end

-- Dissect: Security Alt Id Group
dissect.security_alt_id_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.security_alt_id_group then
    local length = size_of.security_alt_id_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.security_alt_id_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.security_alt_id_group, range, display)
  end

  return dissect.security_alt_id_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Security Alt Id Groups
size_of.security_alt_id_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local security_alt_id_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + security_alt_id_group_count * 27

  return index
end

-- Display: Security Alt Id Groups
display.security_alt_id_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Security Alt Id Groups
dissect.security_alt_id_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- Security Alt Id Group: Struct of 2 fields
  for i = 1, num_in_group do
    index = dissect.security_alt_id_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Security Alt Id Groups
dissect.security_alt_id_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.security_alt_id_groups then
    local length = size_of.security_alt_id_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.security_alt_id_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.security_alt_id_groups, range, display)
  end

  return dissect.security_alt_id_groups_fields(buffer, offset, packet, parent)
end

-- Size: Event Time
size_of.event_time = 8

-- Display: Event Time
display.event_time = function(value)
  -- Check if field has value
  if value == 18446744073709551615 then
    return "Event Time: No Value ("..value..")"
  end

  return "Event Time: "..value
end

-- Dissect: Event Time
dissect.event_time = function(buffer, offset, packet, parent)
  local length = size_of.event_time
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.event_time(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.event_time, range, value, display)

  return offset + length, value
end

-- Size: Event Type
size_of.event_type = 1

-- Display: Event Type
display.event_type = function(value)
  if value == 5 then
    return "Event Type: Activation (5)"
  end
  if value == 6 then
    return "Event Type: Deletion (6)"
  end
  if value == 120 then
    return "Event Type: Modification (120)"
  end
  if value == 255 then
    return "Event Type: No Value (255)"
  end

  return "Event Type: Unknown("..value..")"
end

-- Dissect: Event Type
dissect.event_type = function(buffer, offset, packet, parent)
  local length = size_of.event_type
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.event_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.event_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: Events Group
size_of.events_group = function(buffer, offset)
  local index = 0

  index = index + size_of.event_type

  index = index + size_of.event_time

  return index
end

-- Display: Events Group
display.events_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Events Group
dissect.events_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Event Type: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, event_type = dissect.event_type(buffer, index, packet, parent)

  -- Event Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, event_time = dissect.event_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Events Group
dissect.events_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.events_group then
    local length = size_of.events_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.events_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.events_group, range, display)
  end

  return dissect.events_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Group Size Encoding
size_of.group_size_encoding = function(buffer, offset)
  local index = 0

  index = index + size_of.block_length

  index = index + size_of.num_in_group

  return index
end

-- Display: Group Size Encoding
display.group_size_encoding = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Group Size Encoding
dissect.group_size_encoding_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Block Length: 2 Byte Unsigned Fixed Width Integer
  index, block_length = dissect.block_length(buffer, index, packet, parent)

  -- Num In Group: 1 Byte Unsigned Fixed Width Integer
  index, num_in_group = dissect.num_in_group(buffer, index, packet, parent)

  return index
end

-- Dissect: Group Size Encoding
dissect.group_size_encoding = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.group_size_encoding then
    local length = size_of.group_size_encoding(buffer, offset)
    local range = buffer(offset, length)
    local display = display.group_size_encoding(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.group_size_encoding, range, display)
  end

  return dissect.group_size_encoding_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Events Groups
size_of.events_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size_encoding(buffer, offset + index)

  -- Calculate field size from count
  local events_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + events_group_count * 9

  return index
end

-- Display: Events Groups
display.events_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Events Groups
dissect.events_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size Encoding: Struct of 2 fields
  index, group_size_encoding = dissect.group_size_encoding(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- Events Group: Struct of 2 fields
  for i = 1, num_in_group do
    index = dissect.events_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Events Groups
dissect.events_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.events_groups then
    local length = size_of.events_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.events_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.events_groups, range, display)
  end

  return dissect.events_groups_fields(buffer, offset, packet, parent)
end

-- Size: Market Depth
size_of.market_depth = 1

-- Display: Market Depth
display.market_depth = function(value)
  -- Check if field has value
  if value == 255 then
    return "Market Depth: No Value ("..value..")"
  end

  return "Market Depth: "..value
end

-- Dissect: Market Depth
dissect.market_depth = function(buffer, offset, packet, parent)
  local length = size_of.market_depth
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.market_depth(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.market_depth, range, value, display)

  return offset + length, value
end

-- Size: Md Feed Type
size_of.md_feed_type = 2

-- Display: Md Feed Type
display.md_feed_type = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Md Feed Type: No Value"
  end

  return "Md Feed Type: "..value
end

-- Dissect: Md Feed Type
dissect.md_feed_type = function(buffer, offset, packet, parent)
  local length = size_of.md_feed_type
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.md_feed_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.md_feed_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: M D Feed Types Group
size_of.m_d_feed_types_group = function(buffer, offset)
  local index = 0

  index = index + size_of.md_feed_type

  index = index + size_of.market_depth

  return index
end

-- Display: M D Feed Types Group
display.m_d_feed_types_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Feed Types Group
dissect.m_d_feed_types_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Md Feed Type: 2 Byte Ascii String Nullable
  index, md_feed_type = dissect.md_feed_type(buffer, index, packet, parent)

  -- Market Depth: 1 Byte Unsigned Fixed Width Integer Nullable
  index, market_depth = dissect.market_depth(buffer, index, packet, parent)

  return index
end

-- Dissect: M D Feed Types Group
dissect.m_d_feed_types_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.m_d_feed_types_group then
    local length = size_of.m_d_feed_types_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_feed_types_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_feed_types_group, range, display)
  end

  return dissect.m_d_feed_types_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: M D Feed Types Groups
size_of.m_d_feed_types_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local m_d_feed_types_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + m_d_feed_types_group_count * 3

  return index
end

-- Display: M D Feed Types Groups
display.m_d_feed_types_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Feed Types Groups
dissect.m_d_feed_types_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- M D Feed Types Group: Struct of 2 fields
  for i = 1, num_in_group do
    index = dissect.m_d_feed_types_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: M D Feed Types Groups
dissect.m_d_feed_types_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.m_d_feed_types_groups then
    local length = size_of.m_d_feed_types_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_feed_types_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_feed_types_groups, range, display)
  end

  return dissect.m_d_feed_types_groups_fields(buffer, offset, packet, parent)
end

-- Size: Appl Id
size_of.appl_id = 2

-- Display: Appl Id
display.appl_id = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Appl Id: No Value ("..value..")"
  end

  return "Appl Id: "..value
end

-- Dissect: Appl Id
dissect.appl_id = function(buffer, offset, packet, parent)
  local length = size_of.appl_id
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.appl_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.appl_id, range, value, display)

  return offset + length, value
end

-- Size: User Defined Instrument
size_of.user_defined_instrument = 1

-- Display: User Defined Instrument
display.user_defined_instrument = function(value)
  -- Check if field has value
  if value == "zeroed" then
    return "User Defined Instrument: No Value ("..value..")"
  end

  return "User Defined Instrument: "..value
end

-- Dissect: User Defined Instrument
dissect.user_defined_instrument = function(buffer, offset, packet, parent)
  local length = size_of.user_defined_instrument
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.user_defined_instrument(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.user_defined_instrument, range, value, display)

  return offset + length, value
end

-- Size: Rate Type
size_of.rate_type = 2

-- Display: Rate Type
display.rate_type = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Rate Type: No Value"
  end

  return "Rate Type: "..value
end

-- Dissect: Rate Type
dissect.rate_type = function(buffer, offset, packet, parent)
  local length = size_of.rate_type
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.rate_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.rate_type, range, value, display)

  return offset + length, value
end

-- Size: Security Update Action
size_of.security_update_action = 1

-- Display: Security Update Action
display.security_update_action = function(value)
  if value == "A" then
    return "Security Update Action: Add (A)"
  end
  if value == "D" then
    return "Security Update Action: Delete (D)"
  end
  if value == "M" then
    return "Security Update Action: Modify (M)"
  end

  return "Security Update Action: Unknown("..value..")"
end

-- Dissect: Security Update Action
dissect.security_update_action = function(buffer, offset, packet, parent)
  local length = size_of.security_update_action
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.security_update_action(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.security_update_action, range, value, display)

  return offset + length, value
end

-- Calculate size of: Min Price Increment
size_of.min_price_increment = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Min Price Increment
display.min_price_increment = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Min Price Increment
dissect.min_price_increment_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Min Price Increment
dissect.min_price_increment = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.min_price_increment then
    local length = size_of.min_price_increment(buffer, offset)
    local range = buffer(offset, length)
    local display = display.min_price_increment(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.min_price_increment, range, display)
  end

  return dissect.min_price_increment_fields(buffer, offset, packet, parent)
end

-- Size: Currency
size_of.currency = 3

-- Display: Currency
display.currency = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Currency: No Value"
  end

  return "Currency: "..value
end

-- Dissect: Currency
dissect.currency = function(buffer, offset, packet, parent)
  local length = size_of.currency
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.currency(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.currency, range, value, display)

  return offset + length, value
end

-- Calculate size of: Md Instrument Definition Eris 363
size_of.md_instrument_definition_eris_363 = function(buffer, offset)
  local index = 0

  index = index + size_of.security_group

  index = index + size_of.symbol

  index = index + size_of.security_type

  index = index + size_of.product

  index = index + size_of.security_exchange

  index = index + size_of.maturity_date

  index = index + size_of.currency

  index = index + size_of.min_price_increment(buffer, offset + index)

  index = index + size_of.security_update_action

  index = index + size_of.rate_type

  index = index + size_of.coupon_rate(buffer, offset + index)

  index = index + size_of.user_defined_instrument

  index = index + size_of.appl_id

  index = index + size_of.m_d_feed_types_groups(buffer, offset + index)

  index = index + size_of.events_groups(buffer, offset + index)

  index = index + size_of.security_alt_id_groups(buffer, offset + index)

  index = index + size_of.m_d_instrument_definition_eris_leg_groups(buffer, offset + index)

  return index
end

-- Display: Md Instrument Definition Eris 363
display.md_instrument_definition_eris_363 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Instrument Definition Eris 363
dissect.md_instrument_definition_eris_363_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Security Group: 12 Byte Ascii String Nullable
  index, security_group = dissect.security_group(buffer, index, packet, parent)

  -- Symbol: 50 Byte Ascii String Nullable
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Security Type: 4 Byte Ascii String Nullable
  index, security_type = dissect.security_type(buffer, index, packet, parent)

  -- Product: 1 Byte Signed Fixed Width Integer Nullable
  index, product = dissect.product(buffer, index, packet, parent)

  -- Security Exchange: 4 Byte Ascii String Nullable
  index, security_exchange = dissect.security_exchange(buffer, index, packet, parent)

  -- Maturity Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, maturity_date = dissect.maturity_date(buffer, index, packet, parent)

  -- Currency: 3 Byte Ascii String
  index, currency = dissect.currency(buffer, index, packet, parent)

  -- Min Price Increment: Struct of 2 fields
  index, min_price_increment = dissect.min_price_increment(buffer, index, packet, parent)

  -- Security Update Action: 1 Byte Ascii String Enum with 3 values
  index, security_update_action = dissect.security_update_action(buffer, index, packet, parent)

  -- Rate Type: 2 Byte Ascii String Nullable
  index, rate_type = dissect.rate_type(buffer, index, packet, parent)

  -- Coupon Rate: 4 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, coupon_rate = dissect.coupon_rate(buffer, index, packet, parent)

  -- User Defined Instrument: 1 Byte Ascii String Nullable
  index, user_defined_instrument = dissect.user_defined_instrument(buffer, index, packet, parent)

  -- Appl Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, appl_id = dissect.appl_id(buffer, index, packet, parent)

  -- M D Feed Types Groups: Struct of 2 fields
  index, m_d_feed_types_groups = dissect.m_d_feed_types_groups(buffer, index, packet, parent)

  -- Events Groups: Struct of 2 fields
  index, events_groups = dissect.events_groups(buffer, index, packet, parent)

  -- Security Alt Id Groups: Struct of 2 fields
  index, security_alt_id_groups = dissect.security_alt_id_groups(buffer, index, packet, parent)

  -- M D Instrument Definition Eris Leg Groups: Struct of 2 fields
  index, m_d_instrument_definition_eris_leg_groups = dissect.m_d_instrument_definition_eris_leg_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Instrument Definition Eris 363
dissect.md_instrument_definition_eris_363 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_instrument_definition_eris_363 then
    local length = size_of.md_instrument_definition_eris_363(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_instrument_definition_eris_363(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_instrument_definition_eris_363, range, display)
  end

  return dissect.md_instrument_definition_eris_363_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Incremental Refresh Ot C 356
size_of.md_incremental_refresh_ot_c_356 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.trade_date

  index = index + size_of.match_event_indicator

  index = index + size_of.batch_total_messages

  index = index + size_of.m_d_incremental_refresh_otc_groups(buffer, offset + index)

  return index
end

-- Display: Md Incremental Refresh Ot C 356
display.md_incremental_refresh_ot_c_356 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Incremental Refresh Ot C 356
dissect.md_incremental_refresh_ot_c_356_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, trade_date = dissect.trade_date(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Batch Total Messages: 2 Byte Unsigned Fixed Width Integer Nullable
  index, batch_total_messages = dissect.batch_total_messages(buffer, index, packet, parent)

  -- M D Incremental Refresh Otc Groups: Struct of 2 fields
  index, m_d_incremental_refresh_otc_groups = dissect.m_d_incremental_refresh_otc_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Incremental Refresh Ot C 356
dissect.md_incremental_refresh_ot_c_356 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_incremental_refresh_ot_c_356 then
    local length = size_of.md_incremental_refresh_ot_c_356(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_incremental_refresh_ot_c_356(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_ot_c_356, range, display)
  end

  return dissect.md_incremental_refresh_ot_c_356_fields(buffer, offset, packet, parent)
end

-- Size: Md Entry Position No
size_of.md_entry_position_no = 4

-- Display: Md Entry Position No
display.md_entry_position_no = function(value)
  -- Check if field has value
  if value == 2147483647 then
    return "Md Entry Position No: No Value ("..value..")"
  end

  return "Md Entry Position No: "..value
end

-- Dissect: Md Entry Position No
dissect.md_entry_position_no = function(buffer, offset, packet, parent)
  local length = size_of.md_entry_position_no
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.md_entry_position_no(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.md_entry_position_no, range, value, display)

  return offset + length, value
end

-- Calculate size of: Cal Fut Px
size_of.cal_fut_px = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Cal Fut Px
display.cal_fut_px = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Cal Fut Px
dissect.cal_fut_px_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Cal Fut Px
dissect.cal_fut_px = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.cal_fut_px then
    local length = size_of.cal_fut_px(buffer, offset)
    local range = buffer(offset, length)
    local display = display.cal_fut_px(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.cal_fut_px, range, display)
  end

  return dissect.cal_fut_px_fields(buffer, offset, packet, parent)
end

-- Calculate size of: M D Incremental Refresh Eris Group
size_of.m_d_incremental_refresh_eris_group = function(buffer, offset)
  local index = 0

  index = index + size_of.md_update_action

  index = index + size_of.md_entry_type

  index = index + size_of.rpt_seq

  index = index + size_of.md_entry_px(buffer, offset + index)

  index = index + size_of.md_entry_size(buffer, offset + index)

  index = index + size_of.cal_fut_px(buffer, offset + index)

  index = index + size_of.md_entry_position_no

  index = index + size_of.number_of_orders

  index = index + size_of.trade_id

  index = index + size_of.aggressor_side

  index = index + size_of.symbol

  index = index + size_of.security_group

  index = index + size_of.security_type

  index = index + size_of.security_exchange

  index = index + size_of.product

  index = index + size_of.maturity_date

  index = index + size_of.reference_id

  return index
end

-- Display: M D Incremental Refresh Eris Group
display.m_d_incremental_refresh_eris_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Eris Group
dissect.m_d_incremental_refresh_eris_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Md Update Action: 1 Byte Unsigned Fixed Width Integer Enum with 6 values
  index, md_update_action = dissect.md_update_action(buffer, index, packet, parent)

  -- Md Entry Type: 1 Byte Ascii String Enum with 10 values
  index, md_entry_type = dissect.md_entry_type(buffer, index, packet, parent)

  -- Rpt Seq: 4 Byte Unsigned Fixed Width Integer
  index, rpt_seq = dissect.rpt_seq(buffer, index, packet, parent)

  -- Md Entry Px: 8 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_px = dissect.md_entry_px(buffer, index, packet, parent)

  -- Md Entry Size: 8 Byte Unsigned Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_size = dissect.md_entry_size(buffer, index, packet, parent)

  -- Cal Fut Px: Struct of 2 fields
  index, cal_fut_px = dissect.cal_fut_px(buffer, index, packet, parent)

  -- Md Entry Position No: 4 Byte Signed Fixed Width Integer Nullable
  index, md_entry_position_no = dissect.md_entry_position_no(buffer, index, packet, parent)

  -- Number Of Orders: 4 Byte Signed Fixed Width Integer Nullable
  index, number_of_orders = dissect.number_of_orders(buffer, index, packet, parent)

  -- Trade Id: 4 Byte Signed Fixed Width Integer
  index, trade_id = dissect.trade_id(buffer, index, packet, parent)

  -- Aggressor Side: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, aggressor_side = dissect.aggressor_side(buffer, index, packet, parent)

  -- Symbol: 50 Byte Ascii String Nullable
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Security Group: 12 Byte Ascii String Nullable
  index, security_group = dissect.security_group(buffer, index, packet, parent)

  -- Security Type: 4 Byte Ascii String Nullable
  index, security_type = dissect.security_type(buffer, index, packet, parent)

  -- Security Exchange: 4 Byte Ascii String Nullable
  index, security_exchange = dissect.security_exchange(buffer, index, packet, parent)

  -- Product: 1 Byte Signed Fixed Width Integer Nullable
  index, product = dissect.product(buffer, index, packet, parent)

  -- Maturity Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, maturity_date = dissect.maturity_date(buffer, index, packet, parent)

  -- Reference Id: 50 Byte Ascii String Nullable
  index, reference_id = dissect.reference_id(buffer, index, packet, parent)

  return index
end

-- Dissect: M D Incremental Refresh Eris Group
dissect.m_d_incremental_refresh_eris_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.m_d_incremental_refresh_eris_group then
    local length = size_of.m_d_incremental_refresh_eris_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_eris_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_eris_group, range, display)
  end

  return dissect.m_d_incremental_refresh_eris_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: M D Incremental Refresh Eris Groups
size_of.m_d_incremental_refresh_eris_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local m_d_incremental_refresh_eris_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + m_d_incremental_refresh_eris_group_count * 169

  return index
end

-- Display: M D Incremental Refresh Eris Groups
display.m_d_incremental_refresh_eris_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Eris Groups
dissect.m_d_incremental_refresh_eris_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- M D Incremental Refresh Eris Group: Struct of 17 fields
  for i = 1, num_in_group do
    index = dissect.m_d_incremental_refresh_eris_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: M D Incremental Refresh Eris Groups
dissect.m_d_incremental_refresh_eris_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.m_d_incremental_refresh_eris_groups then
    local length = size_of.m_d_incremental_refresh_eris_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_eris_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_eris_groups, range, display)
  end

  return dissect.m_d_incremental_refresh_eris_groups_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Incremental Refresh Eris 353
size_of.md_incremental_refresh_eris_353 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.match_event_indicator

  index = index + size_of.batch_total_messages

  index = index + size_of.m_d_incremental_refresh_eris_groups(buffer, offset + index)

  return index
end

-- Display: Md Incremental Refresh Eris 353
display.md_incremental_refresh_eris_353 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Incremental Refresh Eris 353
dissect.md_incremental_refresh_eris_353_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Batch Total Messages: 2 Byte Unsigned Fixed Width Integer Nullable
  index, batch_total_messages = dissect.batch_total_messages(buffer, index, packet, parent)

  -- M D Incremental Refresh Eris Groups: Struct of 2 fields
  index, m_d_incremental_refresh_eris_groups = dissect.m_d_incremental_refresh_eris_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Incremental Refresh Eris 353
dissect.md_incremental_refresh_eris_353 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_incremental_refresh_eris_353 then
    local length = size_of.md_incremental_refresh_eris_353(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_incremental_refresh_eris_353(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_eris_353, range, display)
  end

  return dissect.md_incremental_refresh_eris_353_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Incremental Refresh Eris 351
size_of.md_incremental_refresh_eris_351 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.match_event_indicator

  index = index + size_of.batch_total_messages

  index = index + size_of.m_d_incremental_refresh_eris_groups(buffer, offset + index)

  return index
end

-- Display: Md Incremental Refresh Eris 351
display.md_incremental_refresh_eris_351 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Incremental Refresh Eris 351
dissect.md_incremental_refresh_eris_351_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Batch Total Messages: 2 Byte Unsigned Fixed Width Integer Nullable
  index, batch_total_messages = dissect.batch_total_messages(buffer, index, packet, parent)

  -- M D Incremental Refresh Eris Groups: Struct of 2 fields
  index, m_d_incremental_refresh_eris_groups = dissect.m_d_incremental_refresh_eris_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Incremental Refresh Eris 351
dissect.md_incremental_refresh_eris_351 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_incremental_refresh_eris_351 then
    local length = size_of.md_incremental_refresh_eris_351(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_incremental_refresh_eris_351(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_eris_351, range, display)
  end

  return dissect.md_incremental_refresh_eris_351_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Incremental Refresh Trade Blocks 349
size_of.md_incremental_refresh_trade_blocks_349 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.match_event_indicator

  index = index + size_of.batch_total_messages

  index = index + size_of.trade_date

  index = index + size_of.m_d_incremental_refresh_trade_blocks_groups(buffer, offset + index)

  return index
end

-- Display: Md Incremental Refresh Trade Blocks 349
display.md_incremental_refresh_trade_blocks_349 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Incremental Refresh Trade Blocks 349
dissect.md_incremental_refresh_trade_blocks_349_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Batch Total Messages: 2 Byte Unsigned Fixed Width Integer Nullable
  index, batch_total_messages = dissect.batch_total_messages(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, trade_date = dissect.trade_date(buffer, index, packet, parent)

  -- M D Incremental Refresh Trade Blocks Groups: Struct of 2 fields
  index, m_d_incremental_refresh_trade_blocks_groups = dissect.m_d_incremental_refresh_trade_blocks_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Incremental Refresh Trade Blocks 349
dissect.md_incremental_refresh_trade_blocks_349 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_incremental_refresh_trade_blocks_349 then
    local length = size_of.md_incremental_refresh_trade_blocks_349(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_incremental_refresh_trade_blocks_349(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_trade_blocks_349, range, display)
  end

  return dissect.md_incremental_refresh_trade_blocks_349_fields(buffer, offset, packet, parent)
end

-- Size: Md Entry Time
size_of.md_entry_time = 4

-- Display: Md Entry Time
display.md_entry_time = function(value)
  -- Check if field has value
  if value == 2147483647 then
    return "Md Entry Time: No Value ("..value..")"
  end

  return "Md Entry Time: "..value
end

-- Dissect: Md Entry Time
dissect.md_entry_time = function(buffer, offset, packet, parent)
  local length = size_of.md_entry_time
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.md_entry_time(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.md_entry_time, range, value, display)

  return offset + length, value
end

-- Size: Md Entry Code
size_of.md_entry_code = 1

-- Display: Md Entry Code
display.md_entry_code = function(value)
  if value == 1 then
    return "Md Entry Code: Indicative (1)"
  end
  if value == 2 then
    return "Md Entry Code: Pre Market (2)"
  end
  if value == 3 then
    return "Md Entry Code: Preliminary Close (3)"
  end
  if value == 4 then
    return "Md Entry Code: Session Close (4)"
  end
  if value == 5 then
    return "Md Entry Code: Close (5)"
  end
  if value == 255 then
    return "Md Entry Code: No Value (255)"
  end

  return "Md Entry Code: Unknown("..value..")"
end

-- Dissect: Md Entry Code
dissect.md_entry_code = function(buffer, offset, packet, parent)
  local length = size_of.md_entry_code
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.md_entry_code(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.md_entry_code, range, value, display)

  return offset + length, value
end

-- Calculate size of: Percent Trading
size_of.percent_trading = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Percent Trading
display.percent_trading = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Percent Trading
dissect.percent_trading_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Percent Trading
dissect.percent_trading = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.percent_trading then
    local length = size_of.percent_trading(buffer, offset)
    local range = buffer(offset, length)
    local display = display.percent_trading(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.percent_trading, range, display)
  end

  return dissect.percent_trading_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Net Pct Chg
size_of.net_pct_chg = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Net Pct Chg
display.net_pct_chg = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Net Pct Chg
dissect.net_pct_chg_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Net Pct Chg
dissect.net_pct_chg = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.net_pct_chg then
    local length = size_of.net_pct_chg(buffer, offset)
    local range = buffer(offset, length)
    local display = display.net_pct_chg(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.net_pct_chg, range, display)
  end

  return dissect.net_pct_chg_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Net Chg Prev Day
size_of.net_chg_prev_day = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Net Chg Prev Day
display.net_chg_prev_day = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Net Chg Prev Day
dissect.net_chg_prev_day_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Net Chg Prev Day
dissect.net_chg_prev_day = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.net_chg_prev_day then
    local length = size_of.net_chg_prev_day(buffer, offset)
    local range = buffer(offset, length)
    local display = display.net_chg_prev_day(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.net_chg_prev_day, range, display)
  end

  return dissect.net_chg_prev_day_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Yield
size_of.yield = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Yield
display.yield = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Yield
dissect.yield_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Yield
dissect.yield = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.yield then
    local length = size_of.yield(buffer, offset)
    local range = buffer(offset, length)
    local display = display.yield(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.yield, range, display)
  end

  return dissect.yield_fields(buffer, offset, packet, parent)
end

-- Size: Yield Type
size_of.yield_type = 8

-- Display: Yield Type
display.yield_type = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Yield Type: No Value"
  end

  return "Yield Type: "..value
end

-- Dissect: Yield Type
dissect.yield_type = function(buffer, offset, packet, parent)
  local length = size_of.yield_type
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.yield_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.yield_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: M D Incremental Refresh Indices Group
size_of.m_d_incremental_refresh_indices_group = function(buffer, offset)
  local index = 0

  index = index + size_of.md_entry_type

  index = index + size_of.rpt_seq

  index = index + size_of.md_entry_px(buffer, offset + index)

  index = index + size_of.md_entry_size(buffer, offset + index)

  index = index + size_of.symbol

  index = index + size_of.open_close_settl_flag

  index = index + size_of.yield_type

  index = index + size_of.yield(buffer, offset + index)

  index = index + size_of.net_chg_prev_day(buffer, offset + index)

  index = index + size_of.net_pct_chg(buffer, offset + index)

  index = index + size_of.percent_trading(buffer, offset + index)

  index = index + size_of.md_entry_code

  index = index + size_of.md_entry_date

  index = index + size_of.md_entry_time

  index = index + size_of.reference_id

  return index
end

-- Display: M D Incremental Refresh Indices Group
display.m_d_incremental_refresh_indices_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Indices Group
dissect.m_d_incremental_refresh_indices_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Md Entry Type: 1 Byte Ascii String Enum with 10 values
  index, md_entry_type = dissect.md_entry_type(buffer, index, packet, parent)

  -- Rpt Seq: 4 Byte Unsigned Fixed Width Integer
  index, rpt_seq = dissect.rpt_seq(buffer, index, packet, parent)

  -- Md Entry Px: 8 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_px = dissect.md_entry_px(buffer, index, packet, parent)

  -- Md Entry Size: 8 Byte Unsigned Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_size = dissect.md_entry_size(buffer, index, packet, parent)

  -- Symbol: 50 Byte Ascii String Nullable
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Open Close Settl Flag: 1 Byte Unsigned Fixed Width Integer Nullable
  index, open_close_settl_flag = dissect.open_close_settl_flag(buffer, index, packet, parent)

  -- Yield Type: 8 Byte Ascii String Nullable
  index, yield_type = dissect.yield_type(buffer, index, packet, parent)

  -- Yield: Struct of 2 fields
  index, yield = dissect.yield(buffer, index, packet, parent)

  -- Net Chg Prev Day: Struct of 2 fields
  index, net_chg_prev_day = dissect.net_chg_prev_day(buffer, index, packet, parent)

  -- Net Pct Chg: Struct of 2 fields
  index, net_pct_chg = dissect.net_pct_chg(buffer, index, packet, parent)

  -- Percent Trading: Struct of 2 fields
  index, percent_trading = dissect.percent_trading(buffer, index, packet, parent)

  -- Md Entry Code: 1 Byte Unsigned Fixed Width Integer Enum with 6 values
  index, md_entry_code = dissect.md_entry_code(buffer, index, packet, parent)

  -- Md Entry Date: 4 Byte Signed Fixed Width Integer Nullable
  index, md_entry_date = dissect.md_entry_date(buffer, index, packet, parent)

  -- Md Entry Time: 4 Byte Signed Fixed Width Integer Nullable
  index, md_entry_time = dissect.md_entry_time(buffer, index, packet, parent)

  -- Reference Id: 50 Byte Ascii String Nullable
  index, reference_id = dissect.reference_id(buffer, index, packet, parent)

  return index
end

-- Dissect: M D Incremental Refresh Indices Group
dissect.m_d_incremental_refresh_indices_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.m_d_incremental_refresh_indices_group then
    local length = size_of.m_d_incremental_refresh_indices_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_indices_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_indices_group, range, display)
  end

  return dissect.m_d_incremental_refresh_indices_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: M D Incremental Refresh Indices Groups
size_of.m_d_incremental_refresh_indices_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local m_d_incremental_refresh_indices_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + m_d_incremental_refresh_indices_group_count * 177

  return index
end

-- Display: M D Incremental Refresh Indices Groups
display.m_d_incremental_refresh_indices_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Indices Groups
dissect.m_d_incremental_refresh_indices_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- M D Incremental Refresh Indices Group: Struct of 15 fields
  for i = 1, num_in_group do
    index = dissect.m_d_incremental_refresh_indices_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: M D Incremental Refresh Indices Groups
dissect.m_d_incremental_refresh_indices_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.m_d_incremental_refresh_indices_groups then
    local length = size_of.m_d_incremental_refresh_indices_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_indices_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_indices_groups, range, display)
  end

  return dissect.m_d_incremental_refresh_indices_groups_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Incremental Refresh Indices 348
size_of.md_incremental_refresh_indices_348 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.md_feed_type

  index = index + size_of.match_event_indicator

  index = index + size_of.batch_total_messages

  index = index + size_of.m_d_incremental_refresh_indices_groups(buffer, offset + index)

  return index
end

-- Display: Md Incremental Refresh Indices 348
display.md_incremental_refresh_indices_348 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Incremental Refresh Indices 348
dissect.md_incremental_refresh_indices_348_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Md Feed Type: 2 Byte Ascii String Nullable
  index, md_feed_type = dissect.md_feed_type(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Batch Total Messages: 2 Byte Unsigned Fixed Width Integer Nullable
  index, batch_total_messages = dissect.batch_total_messages(buffer, index, packet, parent)

  -- M D Incremental Refresh Indices Groups: Struct of 2 fields
  index, m_d_incremental_refresh_indices_groups = dissect.m_d_incremental_refresh_indices_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Incremental Refresh Indices 348
dissect.md_incremental_refresh_indices_348 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_incremental_refresh_indices_348 then
    local length = size_of.md_incremental_refresh_indices_348(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_incremental_refresh_indices_348(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_indices_348, range, display)
  end

  return dissect.md_incremental_refresh_indices_348_fields(buffer, offset, packet, parent)
end

-- Size: Inst Attrib Value
size_of.inst_attrib_value = 100

-- Display: Inst Attrib Value
display.inst_attrib_value = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Inst Attrib Value: No Value"
  end

  return "Inst Attrib Value: "..value
end

-- Dissect: Inst Attrib Value
dissect.inst_attrib_value = function(buffer, offset, packet, parent)
  local length = size_of.inst_attrib_value
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.inst_attrib_value(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.inst_attrib_value, range, value, display)

  return offset + length, value
end

-- Size: Inst Attrib Type
size_of.inst_attrib_type = 1

-- Display: Inst Attrib Type
display.inst_attrib_type = function(value)
  return "Inst Attrib Type: "..value
end

-- Dissect: Inst Attrib Type
dissect.inst_attrib_type = function(buffer, offset, packet, parent)
  local length = size_of.inst_attrib_type
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.inst_attrib_type(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.inst_attrib_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: Inst Attrib Group
size_of.inst_attrib_group = function(buffer, offset)
  local index = 0

  index = index + size_of.inst_attrib_type

  index = index + size_of.inst_attrib_value

  return index
end

-- Display: Inst Attrib Group
display.inst_attrib_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Inst Attrib Group
dissect.inst_attrib_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Inst Attrib Type: 1 Byte Unsigned Fixed Width Integer
  index, inst_attrib_type = dissect.inst_attrib_type(buffer, index, packet, parent)

  -- Inst Attrib Value: 100 Byte Ascii String Nullable
  index, inst_attrib_value = dissect.inst_attrib_value(buffer, index, packet, parent)

  return index
end

-- Dissect: Inst Attrib Group
dissect.inst_attrib_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.inst_attrib_group then
    local length = size_of.inst_attrib_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.inst_attrib_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.inst_attrib_group, range, display)
  end

  return dissect.inst_attrib_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Inst Attrib Groups
size_of.inst_attrib_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size_encoding(buffer, offset + index)

  -- Calculate field size from count
  local inst_attrib_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + inst_attrib_group_count * 101

  return index
end

-- Display: Inst Attrib Groups
display.inst_attrib_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Inst Attrib Groups
dissect.inst_attrib_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size Encoding: Struct of 2 fields
  index, group_size_encoding = dissect.group_size_encoding(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- Inst Attrib Group: Struct of 2 fields
  for i = 1, num_in_group do
    index = dissect.inst_attrib_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Inst Attrib Groups
dissect.inst_attrib_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.inst_attrib_groups then
    local length = size_of.inst_attrib_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.inst_attrib_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.inst_attrib_groups, range, display)
  end

  return dissect.inst_attrib_groups_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Instrument Definition Indices 347
size_of.md_instrument_definition_indices_347 = function(buffer, offset)
  local index = 0

  index = index + size_of.symbol

  index = index + size_of.product

  index = index + size_of.security_exchange

  index = index + size_of.currency

  index = index + size_of.security_update_action

  index = index + size_of.md_feed_type

  index = index + size_of.appl_id

  index = index + size_of.inst_attrib_groups(buffer, offset + index)

  index = index + size_of.events_groups(buffer, offset + index)

  return index
end

-- Display: Md Instrument Definition Indices 347
display.md_instrument_definition_indices_347 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Instrument Definition Indices 347
dissect.md_instrument_definition_indices_347_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Symbol: 50 Byte Ascii String Nullable
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Product: 1 Byte Signed Fixed Width Integer Nullable
  index, product = dissect.product(buffer, index, packet, parent)

  -- Security Exchange: 4 Byte Ascii String Nullable
  index, security_exchange = dissect.security_exchange(buffer, index, packet, parent)

  -- Currency: 3 Byte Ascii String
  index, currency = dissect.currency(buffer, index, packet, parent)

  -- Security Update Action: 1 Byte Ascii String Enum with 3 values
  index, security_update_action = dissect.security_update_action(buffer, index, packet, parent)

  -- Md Feed Type: 2 Byte Ascii String Nullable
  index, md_feed_type = dissect.md_feed_type(buffer, index, packet, parent)

  -- Appl Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, appl_id = dissect.appl_id(buffer, index, packet, parent)

  -- Inst Attrib Groups: Struct of 2 fields
  index, inst_attrib_groups = dissect.inst_attrib_groups(buffer, index, packet, parent)

  -- Events Groups: Struct of 2 fields
  index, events_groups = dissect.events_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Instrument Definition Indices 347
dissect.md_instrument_definition_indices_347 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_instrument_definition_indices_347 then
    local length = size_of.md_instrument_definition_indices_347(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_instrument_definition_indices_347(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_instrument_definition_indices_347, range, display)
  end

  return dissect.md_instrument_definition_indices_347_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Related Sym Group
size_of.related_sym_group = function(buffer, offset)
  local index = 0

  index = index + size_of.symbol

  return index
end

-- Display: Related Sym Group
display.related_sym_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Related Sym Group
dissect.related_sym_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Symbol: 50 Byte Ascii String Nullable
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  return index
end

-- Dissect: Related Sym Group
dissect.related_sym_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.related_sym_group then
    local length = size_of.related_sym_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.related_sym_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.related_sym_group, range, display)
  end

  return dissect.related_sym_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Related Sym Groups
size_of.related_sym_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local related_sym_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + related_sym_group_count * 50

  return index
end

-- Display: Related Sym Groups
display.related_sym_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Related Sym Groups
dissect.related_sym_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- Related Sym Group: Struct of 1 fields
  for i = 1, num_in_group do
    index = dissect.related_sym_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Related Sym Groups
dissect.related_sym_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.related_sym_groups then
    local length = size_of.related_sym_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.related_sym_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.related_sym_groups, range, display)
  end

  return dissect.related_sym_groups_fields(buffer, offset, packet, parent)
end

-- Size: Quote Req Id
size_of.quote_req_id = 26

-- Display: Quote Req Id
display.quote_req_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Quote Req Id: No Value"
  end

  return "Quote Req Id: "..value
end

-- Dissect: Quote Req Id
dissect.quote_req_id = function(buffer, offset, packet, parent)
  local length = size_of.quote_req_id
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.quote_req_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.quote_req_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Quote Request 345
size_of.quote_request_345 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.match_event_indicator

  index = index + size_of.quote_req_id

  index = index + size_of.related_sym_groups(buffer, offset + index)

  return index
end

-- Display: Quote Request 345
display.quote_request_345 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Quote Request 345
dissect.quote_request_345_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Quote Req Id: 26 Byte Ascii String Nullable
  index, quote_req_id = dissect.quote_req_id(buffer, index, packet, parent)

  -- Related Sym Groups: Struct of 2 fields
  index, related_sym_groups = dissect.related_sym_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Quote Request 345
dissect.quote_request_345 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.quote_request_345 then
    local length = size_of.quote_request_345(buffer, offset)
    local range = buffer(offset, length)
    local display = display.quote_request_345(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.quote_request_345, range, display)
  end

  return dissect.quote_request_345_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Incremental Refresh Trade Blocks 340
size_of.md_incremental_refresh_trade_blocks_340 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.match_event_indicator

  index = index + size_of.batch_total_messages

  index = index + size_of.m_d_incremental_refresh_trade_blocks_groups(buffer, offset + index)

  return index
end

-- Display: Md Incremental Refresh Trade Blocks 340
display.md_incremental_refresh_trade_blocks_340 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Incremental Refresh Trade Blocks 340
dissect.md_incremental_refresh_trade_blocks_340_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Batch Total Messages: 2 Byte Unsigned Fixed Width Integer Nullable
  index, batch_total_messages = dissect.batch_total_messages(buffer, index, packet, parent)

  -- M D Incremental Refresh Trade Blocks Groups: Struct of 2 fields
  index, m_d_incremental_refresh_trade_blocks_groups = dissect.m_d_incremental_refresh_trade_blocks_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Incremental Refresh Trade Blocks 340
dissect.md_incremental_refresh_trade_blocks_340 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_incremental_refresh_trade_blocks_340 then
    local length = size_of.md_incremental_refresh_trade_blocks_340(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_incremental_refresh_trade_blocks_340(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_trade_blocks_340, range, display)
  end

  return dissect.md_incremental_refresh_trade_blocks_340_fields(buffer, offset, packet, parent)
end

-- Size: Text
size_of.text = 180

-- Display: Text
display.text = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Text: No Value"
  end

  return "Text: "..value
end

-- Dissect: Text
dissect.text = function(buffer, offset, packet, parent)
  local length = size_of.text
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.text(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.text, range, value, display)

  return offset + length, value
end

-- Calculate size of: Lines Of Text Group
size_of.lines_of_text_group = function(buffer, offset)
  local index = 0

  index = index + size_of.text

  return index
end

-- Display: Lines Of Text Group
display.lines_of_text_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Lines Of Text Group
dissect.lines_of_text_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Text: 180 Byte Ascii String
  index, text = dissect.text(buffer, index, packet, parent)

  return index
end

-- Dissect: Lines Of Text Group
dissect.lines_of_text_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.lines_of_text_group then
    local length = size_of.lines_of_text_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.lines_of_text_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.lines_of_text_group, range, display)
  end

  return dissect.lines_of_text_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Lines Of Text Groups
size_of.lines_of_text_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local lines_of_text_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + lines_of_text_group_count * 180

  return index
end

-- Display: Lines Of Text Groups
display.lines_of_text_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Lines Of Text Groups
dissect.lines_of_text_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- Lines Of Text Group: Struct of 1 fields
  for i = 1, num_in_group do
    index = dissect.lines_of_text_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Lines Of Text Groups
dissect.lines_of_text_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.lines_of_text_groups then
    local length = size_of.lines_of_text_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.lines_of_text_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.lines_of_text_groups, range, display)
  end

  return dissect.lines_of_text_groups_fields(buffer, offset, packet, parent)
end

-- Size: Orig Time
size_of.orig_time = 8

-- Display: Orig Time
display.orig_time = function(value)
  -- Check if field has value
  if value == 18446744073709551615 then
    return "Orig Time: No Value ("..value..")"
  end

  return "Orig Time: "..value
end

-- Dissect: Orig Time
dissect.orig_time = function(buffer, offset, packet, parent)
  local length = size_of.orig_time
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.orig_time(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.orig_time, range, value, display)

  return offset + length, value
end

-- Size: Headline
size_of.headline = 50

-- Display: Headline
display.headline = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Headline: No Value"
  end

  return "Headline: "..value
end

-- Dissect: Headline
dissect.headline = function(buffer, offset, packet, parent)
  local length = size_of.headline
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.headline(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.headline, range, value, display)

  return offset + length, value
end

-- Calculate size of: Md News Indices 339
size_of.md_news_indices_339 = function(buffer, offset)
  local index = 0

  index = index + size_of.headline

  index = index + size_of.orig_time

  index = index + size_of.md_feed_type

  index = index + size_of.related_sym_groups(buffer, offset + index)

  index = index + size_of.lines_of_text_groups(buffer, offset + index)

  return index
end

-- Display: Md News Indices 339
display.md_news_indices_339 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md News Indices 339
dissect.md_news_indices_339_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Headline: 50 Byte Ascii String Nullable
  index, headline = dissect.headline(buffer, index, packet, parent)

  -- Orig Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, orig_time = dissect.orig_time(buffer, index, packet, parent)

  -- Md Feed Type: 2 Byte Ascii String Nullable
  index, md_feed_type = dissect.md_feed_type(buffer, index, packet, parent)

  -- Related Sym Groups: Struct of 2 fields
  index, related_sym_groups = dissect.related_sym_groups(buffer, index, packet, parent)

  -- Lines Of Text Groups: Struct of 2 fields
  index, lines_of_text_groups = dissect.lines_of_text_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md News Indices 339
dissect.md_news_indices_339 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_news_indices_339 then
    local length = size_of.md_news_indices_339(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_news_indices_339(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_news_indices_339, range, display)
  end

  return dissect.md_news_indices_339_fields(buffer, offset, packet, parent)
end

-- Size: Security Description
size_of.security_description = 30

-- Display: Security Description
display.security_description = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Security Description: No Value"
  end

  return "Security Description: "..value
end

-- Dissect: Security Description
dissect.security_description = function(buffer, offset, packet, parent)
  local length = size_of.security_description
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.security_description(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.security_description, range, value, display)

  return offset + length, value
end

-- Calculate size of: Final Settlement Futures Price
size_of.final_settlement_futures_price = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Final Settlement Futures Price
display.final_settlement_futures_price = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Final Settlement Futures Price
dissect.final_settlement_futures_price_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Final Settlement Futures Price
dissect.final_settlement_futures_price = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.final_settlement_futures_price then
    local length = size_of.final_settlement_futures_price(buffer, offset)
    local range = buffer(offset, length)
    local display = display.final_settlement_futures_price(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.final_settlement_futures_price, range, display)
  end

  return dissect.final_settlement_futures_price_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Settlement Npv
size_of.settlement_npv = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Settlement Npv
display.settlement_npv = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Settlement Npv
dissect.settlement_npv_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Settlement Npv
dissect.settlement_npv = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.settlement_npv then
    local length = size_of.settlement_npv(buffer, offset)
    local range = buffer(offset, length)
    local display = display.settlement_npv(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.settlement_npv, range, display)
  end

  return dissect.settlement_npv_fields(buffer, offset, packet, parent)
end

-- Calculate size of: D V 01
size_of.d_v_01 = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: D V 01
display.d_v_01 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: D V 01
dissect.d_v_01_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: D V 01
dissect.d_v_01 = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.d_v_01 then
    local length = size_of.d_v_01(buffer, offset)
    local range = buffer(offset, length)
    local display = display.d_v_01(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.d_v_01, range, display)
  end

  return dissect.d_v_01_fields(buffer, offset, packet, parent)
end

-- Calculate size of: P V 01
size_of.p_v_01 = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: P V 01
display.p_v_01 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: P V 01
dissect.p_v_01_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: P V 01
dissect.p_v_01 = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.p_v_01 then
    local length = size_of.p_v_01(buffer, offset)
    local range = buffer(offset, length)
    local display = display.p_v_01(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.p_v_01, range, display)
  end

  return dissect.p_v_01_fields(buffer, offset, packet, parent)
end

-- Size: Next Floating Payment Date
size_of.next_floating_payment_date = 2

-- Display: Next Floating Payment Date
display.next_floating_payment_date = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Next Floating Payment Date: No Value ("..value..")"
  end

  return "Next Floating Payment Date: "..value
end

-- Dissect: Next Floating Payment Date
dissect.next_floating_payment_date = function(buffer, offset, packet, parent)
  local length = size_of.next_floating_payment_date
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.next_floating_payment_date(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.next_floating_payment_date, range, value, display)

  return offset + length, value
end

-- Calculate size of: Leg Contract Multiplier
size_of.leg_contract_multiplier = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Leg Contract Multiplier
display.leg_contract_multiplier = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Leg Contract Multiplier
dissect.leg_contract_multiplier_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Leg Contract Multiplier
dissect.leg_contract_multiplier = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.leg_contract_multiplier then
    local length = size_of.leg_contract_multiplier(buffer, offset)
    local range = buffer(offset, length)
    local display = display.leg_contract_multiplier(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_contract_multiplier, range, display)
  end

  return dissect.leg_contract_multiplier_fields(buffer, offset, packet, parent)
end

-- Size: Leg Credit Rating
size_of.leg_credit_rating = 6

-- Display: Leg Credit Rating
display.leg_credit_rating = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Leg Credit Rating: No Value"
  end

  return "Leg Credit Rating: "..value
end

-- Dissect: Leg Credit Rating
dissect.leg_credit_rating = function(buffer, offset, packet, parent)
  local length = size_of.leg_credit_rating
  local range = buffer(offset, length)
  local value = range:stringz()
  local display = display.leg_credit_rating(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_credit_rating, range, value, display)

  return offset + length, value
end

-- Size: Nominal
size_of.nominal = 8

-- Display: Nominal
display.nominal = function(value)
  -- Check if field has value
  if value == 18446744073709551615 then
    return "Nominal: No Value ("..value..")"
  end

  return "Nominal: "..value
end

-- Dissect: Nominal
dissect.nominal = function(buffer, offset, packet, parent)
  local length = size_of.nominal
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.nominal(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.nominal, range, value, display)

  return offset + length, value
end

-- Size: Accrual Days
size_of.accrual_days = 4

-- Display: Accrual Days
display.accrual_days = function(value)
  -- Check if field has value
  if value == 4294967295 then
    return "Accrual Days: No Value ("..value..")"
  end

  return "Accrual Days: "..value
end

-- Dissect: Accrual Days
dissect.accrual_days = function(buffer, offset, packet, parent)
  local length = size_of.accrual_days
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.accrual_days(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.accrual_days, range, value, display)

  return offset + length, value
end

-- Size: Fed Funds Date
size_of.fed_funds_date = 2

-- Display: Fed Funds Date
display.fed_funds_date = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Fed Funds Date: No Value ("..value..")"
  end

  return "Fed Funds Date: "..value
end

-- Dissect: Fed Funds Date
dissect.fed_funds_date = function(buffer, offset, packet, parent)
  local length = size_of.fed_funds_date
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.fed_funds_date(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.fed_funds_date, range, value, display)

  return offset + length, value
end

-- Calculate size of: Previous Eris Pai
size_of.previous_eris_pai = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Previous Eris Pai
display.previous_eris_pai = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Previous Eris Pai
dissect.previous_eris_pai_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Previous Eris Pai
dissect.previous_eris_pai = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.previous_eris_pai then
    local length = size_of.previous_eris_pai(buffer, offset)
    local range = buffer(offset, length)
    local display = display.previous_eris_pai(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.previous_eris_pai, range, display)
  end

  return dissect.previous_eris_pai_fields(buffer, offset, packet, parent)
end

-- Size: Trading Reference Date
size_of.trading_reference_date = 2

-- Display: Trading Reference Date
display.trading_reference_date = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Trading Reference Date: No Value ("..value..")"
  end

  return "Trading Reference Date: "..value
end

-- Dissect: Trading Reference Date
dissect.trading_reference_date = function(buffer, offset, packet, parent)
  local length = size_of.trading_reference_date
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.trading_reference_date(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.trading_reference_date, range, value, display)

  return offset + length, value
end

-- Calculate size of: Next Floating Payment Amount
size_of.next_floating_payment_amount = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Next Floating Payment Amount
display.next_floating_payment_amount = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Next Floating Payment Amount
dissect.next_floating_payment_amount_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Next Floating Payment Amount
dissect.next_floating_payment_amount = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.next_floating_payment_amount then
    local length = size_of.next_floating_payment_amount(buffer, offset)
    local range = buffer(offset, length)
    local display = display.next_floating_payment_amount(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.next_floating_payment_amount, range, display)
  end

  return dissect.next_floating_payment_amount_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Next Fixed Payment Amount
size_of.next_fixed_payment_amount = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Next Fixed Payment Amount
display.next_fixed_payment_amount = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Next Fixed Payment Amount
dissect.next_fixed_payment_amount_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Next Fixed Payment Amount
dissect.next_fixed_payment_amount = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.next_fixed_payment_amount then
    local length = size_of.next_fixed_payment_amount(buffer, offset)
    local range = buffer(offset, length)
    local display = display.next_fixed_payment_amount(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.next_fixed_payment_amount, range, display)
  end

  return dissect.next_fixed_payment_amount_fields(buffer, offset, packet, parent)
end

-- Size: Next Fixed Payment Date
size_of.next_fixed_payment_date = 2

-- Display: Next Fixed Payment Date
display.next_fixed_payment_date = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Next Fixed Payment Date: No Value ("..value..")"
  end

  return "Next Fixed Payment Date: "..value
end

-- Dissect: Next Fixed Payment Date
dissect.next_fixed_payment_date = function(buffer, offset, packet, parent)
  local length = size_of.next_fixed_payment_date
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.next_fixed_payment_date(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.next_fixed_payment_date, range, value, display)

  return offset + length, value
end

-- Calculate size of: Floating Payment
size_of.floating_payment = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Floating Payment
display.floating_payment = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Floating Payment
dissect.floating_payment_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Floating Payment
dissect.floating_payment = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.floating_payment then
    local length = size_of.floating_payment(buffer, offset)
    local range = buffer(offset, length)
    local display = display.floating_payment(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.floating_payment, range, display)
  end

  return dissect.floating_payment_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Fixed Payment
size_of.fixed_payment = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Fixed Payment
display.fixed_payment = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Fixed Payment
dissect.fixed_payment_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Fixed Payment
dissect.fixed_payment = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.fixed_payment then
    local length = size_of.fixed_payment(buffer, offset)
    local range = buffer(offset, length)
    local display = display.fixed_payment(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.fixed_payment, range, display)
  end

  return dissect.fixed_payment_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Fed Funds Rate
size_of.fed_funds_rate = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Fed Funds Rate
display.fed_funds_rate = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Fed Funds Rate
dissect.fed_funds_rate_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Fed Funds Rate
dissect.fed_funds_rate = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.fed_funds_rate then
    local length = size_of.fed_funds_rate(buffer, offset)
    local range = buffer(offset, length)
    local display = display.fed_funds_rate(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.fed_funds_rate, range, display)
  end

  return dissect.fed_funds_rate_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Eris Pai
size_of.eris_pai = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Eris Pai
display.eris_pai = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Eris Pai
dissect.eris_pai_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Eris Pai
dissect.eris_pai = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.eris_pai then
    local length = size_of.eris_pai(buffer, offset)
    local range = buffer(offset, length)
    local display = display.eris_pai(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.eris_pai, range, display)
  end

  return dissect.eris_pai_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Daily Incremental Eris Pai
size_of.daily_incremental_eris_pai = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Daily Incremental Eris Pai
display.daily_incremental_eris_pai = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Daily Incremental Eris Pai
dissect.daily_incremental_eris_pai_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Daily Incremental Eris Pai
dissect.daily_incremental_eris_pai = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.daily_incremental_eris_pai then
    local length = size_of.daily_incremental_eris_pai(buffer, offset)
    local range = buffer(offset, length)
    local display = display.daily_incremental_eris_pai(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.daily_incremental_eris_pai, range, display)
  end

  return dissect.daily_incremental_eris_pai_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Accrued Coupons
size_of.accrued_coupons = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Accrued Coupons
display.accrued_coupons = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Accrued Coupons
dissect.accrued_coupons_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Accrued Coupons
dissect.accrued_coupons = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.accrued_coupons then
    local length = size_of.accrued_coupons(buffer, offset)
    local range = buffer(offset, length)
    local display = display.accrued_coupons(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.accrued_coupons, range, display)
  end

  return dissect.accrued_coupons_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Npv
size_of.npv = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Npv
display.npv = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Npv
dissect.npv_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Npv
dissect.npv = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.npv then
    local length = size_of.npv(buffer, offset)
    local range = buffer(offset, length)
    local display = display.npv(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.npv, range, display)
  end

  return dissect.npv_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Float Npv
size_of.float_npv = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Float Npv
display.float_npv = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Float Npv
dissect.float_npv_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Float Npv
dissect.float_npv = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.float_npv then
    local length = size_of.float_npv(buffer, offset)
    local range = buffer(offset, length)
    local display = display.float_npv(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.float_npv, range, display)
  end

  return dissect.float_npv_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Fixed Npv
size_of.fixed_npv = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Fixed Npv
display.fixed_npv = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Fixed Npv
dissect.fixed_npv_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Fixed Npv
dissect.fixed_npv = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.fixed_npv then
    local length = size_of.fixed_npv(buffer, offset)
    local range = buffer(offset, length)
    local display = display.fixed_npv(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.fixed_npv, range, display)
  end

  return dissect.fixed_npv_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Leg Purchase Rate
size_of.leg_purchase_rate = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Leg Purchase Rate
display.leg_purchase_rate = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Leg Purchase Rate
dissect.leg_purchase_rate_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Leg Purchase Rate
dissect.leg_purchase_rate = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.leg_purchase_rate then
    local length = size_of.leg_purchase_rate(buffer, offset)
    local range = buffer(offset, length)
    local display = display.leg_purchase_rate(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.leg_purchase_rate, range, display)
  end

  return dissect.leg_purchase_rate_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Fair Coupon Pct
size_of.fair_coupon_pct = function(buffer, offset)
  local index = 0

  index = index + size_of.mantissa64

  index = index + size_of.exponent

  return index
end

-- Display: Fair Coupon Pct
display.fair_coupon_pct = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Fair Coupon Pct
dissect.fair_coupon_pct_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Mantissa64: 8 Byte Signed Fixed Width Integer Nullable
  index, mantissa64 = dissect.mantissa64(buffer, index, packet, parent)

  -- Exponent: 1 Byte Signed Fixed Width Integer Nullable
  index, exponent = dissect.exponent(buffer, index, packet, parent)

  return index, mantissa64, exponent
end

-- Dissect: Fair Coupon Pct
dissect.fair_coupon_pct = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.fair_coupon_pct then
    local length = size_of.fair_coupon_pct(buffer, offset)
    local range = buffer(offset, length)
    local display = display.fair_coupon_pct(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.fair_coupon_pct, range, display)
  end

  return dissect.fair_coupon_pct_fields(buffer, offset, packet, parent)
end

-- Size: Settl Price Type
size_of.settl_price_type = 1

-- Display: Settl Price Type
display.settl_price_type = function(buffer, packet, parent)
  local display = ""

  -- Is Null Value flag set?
  if buffer:bitfield(0) > 0 then
    display = display.."Null Value|"
  end
  -- Is Rounded flag set?
  if buffer:bitfield(5) > 0 then
    display = display.."Rounded|"
  end
  -- Is Actual flag set?
  if buffer:bitfield(6) > 0 then
    display = display.."Actual|"
  end
  -- Is Final Daily flag set?
  if buffer:bitfield(7) > 0 then
    display = display.."Final Daily|"
  end

  return display:sub(1, -2)
end

-- Dissect Bit Fields: Settl Price Type
dissect.settl_price_type_bits = function(buffer, offset, packet, parent)

  -- Null Value: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.null_value, buffer(offset, 1))

  -- Reserved Bits: 4 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.reserved_bits, buffer(offset, 1))

  -- Rounded: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.rounded, buffer(offset, 1))

  -- Actual: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.actual, buffer(offset, 1))

  -- Final Daily: 1 Bit
  parent:add(cme_futures_streamline_sbe_v5_9.fields.final_daily, buffer(offset, 1))
end

-- Dissect: Settl Price Type
dissect.settl_price_type = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local display = display.settl_price_type(range, packet, parent)
  local element = parent:add(cme_futures_streamline_sbe_v5_9.fields.settl_price_type, range, display)

  if show.settl_price_type then
    dissect.settl_price_type_bits(buffer, offset, packet, element)
  end

  return offset + 1, range
end

-- Calculate size of: M D Incremental Refresh Eris Reference Data And Daily Statistics Group
size_of.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group = function(buffer, offset)
  local index = 0

  index = index + size_of.md_update_action

  index = index + size_of.md_entry_type

  index = index + size_of.rpt_seq

  index = index + size_of.md_entry_px(buffer, offset + index)

  index = index + size_of.open_close_settl_flag

  index = index + size_of.settl_price_type

  index = index + size_of.cal_fut_px(buffer, offset + index)

  index = index + size_of.reference_id

  index = index + size_of.md_entry_size(buffer, offset + index)

  index = index + size_of.symbol

  index = index + size_of.security_group

  index = index + size_of.product

  index = index + size_of.security_type

  index = index + size_of.security_exchange

  index = index + size_of.maturity_date

  index = index + size_of.coupon_rate(buffer, offset + index)

  index = index + size_of.trade_date

  index = index + size_of.fair_coupon_pct(buffer, offset + index)

  index = index + size_of.leg_purchase_rate(buffer, offset + index)

  index = index + size_of.fixed_npv(buffer, offset + index)

  index = index + size_of.float_npv(buffer, offset + index)

  index = index + size_of.npv(buffer, offset + index)

  index = index + size_of.accrued_coupons(buffer, offset + index)

  index = index + size_of.daily_incremental_eris_pai(buffer, offset + index)

  index = index + size_of.eris_pai(buffer, offset + index)

  index = index + size_of.fed_funds_rate(buffer, offset + index)

  index = index + size_of.min_price_increment(buffer, offset + index)

  index = index + size_of.fixed_payment(buffer, offset + index)

  index = index + size_of.floating_payment(buffer, offset + index)

  index = index + size_of.next_fixed_payment_date

  index = index + size_of.next_fixed_payment_amount(buffer, offset + index)

  index = index + size_of.next_floating_payment_amount(buffer, offset + index)

  index = index + size_of.trading_reference_date

  index = index + size_of.previous_eris_pai(buffer, offset + index)

  index = index + size_of.fed_funds_date

  index = index + size_of.accrual_days

  index = index + size_of.nominal

  index = index + size_of.leg_credit_rating

  index = index + size_of.leg_contract_multiplier(buffer, offset + index)

  index = index + size_of.next_floating_payment_date

  index = index + size_of.p_v_01(buffer, offset + index)

  index = index + size_of.d_v_01(buffer, offset + index)

  index = index + size_of.settlement_npv(buffer, offset + index)

  index = index + size_of.final_settlement_futures_price(buffer, offset + index)

  index = index + size_of.security_description

  return index
end

-- Display: M D Incremental Refresh Eris Reference Data And Daily Statistics Group
display.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Eris Reference Data And Daily Statistics Group
dissect.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Md Update Action: 1 Byte Unsigned Fixed Width Integer Enum with 6 values
  index, md_update_action = dissect.md_update_action(buffer, index, packet, parent)

  -- Md Entry Type: 1 Byte Ascii String Enum with 10 values
  index, md_entry_type = dissect.md_entry_type(buffer, index, packet, parent)

  -- Rpt Seq: 4 Byte Unsigned Fixed Width Integer
  index, rpt_seq = dissect.rpt_seq(buffer, index, packet, parent)

  -- Md Entry Px: 8 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_px = dissect.md_entry_px(buffer, index, packet, parent)

  -- Open Close Settl Flag: 1 Byte Unsigned Fixed Width Integer Nullable
  index, open_close_settl_flag = dissect.open_close_settl_flag(buffer, index, packet, parent)

  -- Settl Price Type: Struct of 5 fields
  index, settl_price_type = dissect.settl_price_type(buffer, index, packet, parent)

  -- Cal Fut Px: Struct of 2 fields
  index, cal_fut_px = dissect.cal_fut_px(buffer, index, packet, parent)

  -- Reference Id: 50 Byte Ascii String Nullable
  index, reference_id = dissect.reference_id(buffer, index, packet, parent)

  -- Md Entry Size: 8 Byte Unsigned Fixed Width Integer Nullable: Struct of 2 fields
  index, md_entry_size = dissect.md_entry_size(buffer, index, packet, parent)

  -- Symbol: 50 Byte Ascii String Nullable
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Security Group: 12 Byte Ascii String Nullable
  index, security_group = dissect.security_group(buffer, index, packet, parent)

  -- Product: 1 Byte Signed Fixed Width Integer Nullable
  index, product = dissect.product(buffer, index, packet, parent)

  -- Security Type: 4 Byte Ascii String Nullable
  index, security_type = dissect.security_type(buffer, index, packet, parent)

  -- Security Exchange: 4 Byte Ascii String Nullable
  index, security_exchange = dissect.security_exchange(buffer, index, packet, parent)

  -- Maturity Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, maturity_date = dissect.maturity_date(buffer, index, packet, parent)

  -- Coupon Rate: 4 Byte Signed Fixed Width Integer Nullable: Struct of 2 fields
  index, coupon_rate = dissect.coupon_rate(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, trade_date = dissect.trade_date(buffer, index, packet, parent)

  -- Fair Coupon Pct: Struct of 2 fields
  index, fair_coupon_pct = dissect.fair_coupon_pct(buffer, index, packet, parent)

  -- Leg Purchase Rate: Struct of 2 fields
  index, leg_purchase_rate = dissect.leg_purchase_rate(buffer, index, packet, parent)

  -- Fixed Npv: Struct of 2 fields
  index, fixed_npv = dissect.fixed_npv(buffer, index, packet, parent)

  -- Float Npv: Struct of 2 fields
  index, float_npv = dissect.float_npv(buffer, index, packet, parent)

  -- Npv: Struct of 2 fields
  index, npv = dissect.npv(buffer, index, packet, parent)

  -- Accrued Coupons: Struct of 2 fields
  index, accrued_coupons = dissect.accrued_coupons(buffer, index, packet, parent)

  -- Daily Incremental Eris Pai: Struct of 2 fields
  index, daily_incremental_eris_pai = dissect.daily_incremental_eris_pai(buffer, index, packet, parent)

  -- Eris Pai: Struct of 2 fields
  index, eris_pai = dissect.eris_pai(buffer, index, packet, parent)

  -- Fed Funds Rate: Struct of 2 fields
  index, fed_funds_rate = dissect.fed_funds_rate(buffer, index, packet, parent)

  -- Min Price Increment: Struct of 2 fields
  index, min_price_increment = dissect.min_price_increment(buffer, index, packet, parent)

  -- Fixed Payment: Struct of 2 fields
  index, fixed_payment = dissect.fixed_payment(buffer, index, packet, parent)

  -- Floating Payment: Struct of 2 fields
  index, floating_payment = dissect.floating_payment(buffer, index, packet, parent)

  -- Next Fixed Payment Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, next_fixed_payment_date = dissect.next_fixed_payment_date(buffer, index, packet, parent)

  -- Next Fixed Payment Amount: Struct of 2 fields
  index, next_fixed_payment_amount = dissect.next_fixed_payment_amount(buffer, index, packet, parent)

  -- Next Floating Payment Amount: Struct of 2 fields
  index, next_floating_payment_amount = dissect.next_floating_payment_amount(buffer, index, packet, parent)

  -- Trading Reference Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, trading_reference_date = dissect.trading_reference_date(buffer, index, packet, parent)

  -- Previous Eris Pai: Struct of 2 fields
  index, previous_eris_pai = dissect.previous_eris_pai(buffer, index, packet, parent)

  -- Fed Funds Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, fed_funds_date = dissect.fed_funds_date(buffer, index, packet, parent)

  -- Accrual Days: 4 Byte Unsigned Fixed Width Integer Nullable
  index, accrual_days = dissect.accrual_days(buffer, index, packet, parent)

  -- Nominal: 8 Byte Unsigned Fixed Width Integer Nullable
  index, nominal = dissect.nominal(buffer, index, packet, parent)

  -- Leg Credit Rating: 6 Byte Ascii String Nullable
  index, leg_credit_rating = dissect.leg_credit_rating(buffer, index, packet, parent)

  -- Leg Contract Multiplier: Struct of 2 fields
  index, leg_contract_multiplier = dissect.leg_contract_multiplier(buffer, index, packet, parent)

  -- Next Floating Payment Date: 2 Byte Unsigned Fixed Width Integer Nullable
  index, next_floating_payment_date = dissect.next_floating_payment_date(buffer, index, packet, parent)

  -- P V 01: Struct of 2 fields
  index, p_v_01 = dissect.p_v_01(buffer, index, packet, parent)

  -- D V 01: Struct of 2 fields
  index, d_v_01 = dissect.d_v_01(buffer, index, packet, parent)

  -- Settlement Npv: Struct of 2 fields
  index, settlement_npv = dissect.settlement_npv(buffer, index, packet, parent)

  -- Final Settlement Futures Price: Struct of 2 fields
  index, final_settlement_futures_price = dissect.final_settlement_futures_price(buffer, index, packet, parent)

  -- Security Description: 30 Byte Ascii String Nullable
  index, security_description = dissect.security_description(buffer, index, packet, parent)

  return index
end

-- Dissect: M D Incremental Refresh Eris Reference Data And Daily Statistics Group
dissect.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group then
    local length = size_of.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group, range, display)
  end

  return dissect.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: M D Incremental Refresh Eris Reference Data And Daily Statistics Groups
size_of.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups = function(buffer, offset)
  local index = 0

  index = index + size_of.group_size(buffer, offset + index)

  -- Calculate field size from count
  local m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group_count = buffer(offset + index - 1, 1):le_uint()
  index = index + m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group_count * 401

  return index
end

-- Display: M D Incremental Refresh Eris Reference Data And Daily Statistics Groups
display.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: M D Incremental Refresh Eris Reference Data And Daily Statistics Groups
dissect.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Group Size: Struct of 2 fields
  index, group_size = dissect.group_size(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):le_uint()

  -- M D Incremental Refresh Eris Reference Data And Daily Statistics Group: Struct of 45 fields
  for i = 1, num_in_group do
    index = dissect.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: M D Incremental Refresh Eris Reference Data And Daily Statistics Groups
dissect.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups then
    local length = size_of.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = display.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups, range, display)
  end

  return dissect.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Md Incremental Refresh Eris Reference Data And Daily Statistics 333
size_of.md_incremental_refresh_eris_reference_data_and_daily_statistics_333 = function(buffer, offset)
  local index = 0

  index = index + size_of.transact_time

  index = index + size_of.match_event_indicator

  index = index + size_of.batch_total_messages

  index = index + size_of.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups(buffer, offset + index)

  return index
end

-- Display: Md Incremental Refresh Eris Reference Data And Daily Statistics 333
display.md_incremental_refresh_eris_reference_data_and_daily_statistics_333 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Md Incremental Refresh Eris Reference Data And Daily Statistics 333
dissect.md_incremental_refresh_eris_reference_data_and_daily_statistics_333_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Transact Time: 8 Byte Unsigned Fixed Width Integer Nullable
  index, transact_time = dissect.transact_time(buffer, index, packet, parent)

  -- Match Event Indicator: Struct of 8 fields
  index, match_event_indicator = dissect.match_event_indicator(buffer, index, packet, parent)

  -- Batch Total Messages: 2 Byte Unsigned Fixed Width Integer Nullable
  index, batch_total_messages = dissect.batch_total_messages(buffer, index, packet, parent)

  -- M D Incremental Refresh Eris Reference Data And Daily Statistics Groups: Struct of 2 fields
  index, m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups = dissect.m_d_incremental_refresh_eris_reference_data_and_daily_statistics_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Md Incremental Refresh Eris Reference Data And Daily Statistics 333
dissect.md_incremental_refresh_eris_reference_data_and_daily_statistics_333 = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.md_incremental_refresh_eris_reference_data_and_daily_statistics_333 then
    local length = size_of.md_incremental_refresh_eris_reference_data_and_daily_statistics_333(buffer, offset)
    local range = buffer(offset, length)
    local display = display.md_incremental_refresh_eris_reference_data_and_daily_statistics_333(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.md_incremental_refresh_eris_reference_data_and_daily_statistics_333, range, display)
  end

  return dissect.md_incremental_refresh_eris_reference_data_and_daily_statistics_333_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Admin Logout 316
size_of.admin_logout_316 = function(buffer, offset)
  local index = 0

  index = index + size_of.text

  return index
end

-- Display: Admin Logout 316
display.admin_logout_316 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Admin Logout 316
dissect.admin_logout_316_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Text: 180 Byte Ascii String
  index, text = dissect.text(buffer, index, packet, parent)

  return index
end

-- Dissect: Admin Logout 316
dissect.admin_logout_316 = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.admin_logout_316 then
    local length = size_of.admin_logout_316(buffer, offset)
    local range = buffer(offset, length)
    local display = display.admin_logout_316(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.admin_logout_316, range, display)
  end

  return dissect.admin_logout_316_fields(buffer, offset, packet, parent)
end

-- Size: Heart Bt Int
size_of.heart_bt_int = 1

-- Display: Heart Bt Int
display.heart_bt_int = function(value)
  return "Heart Bt Int: "..value
end

-- Dissect: Heart Bt Int
dissect.heart_bt_int = function(buffer, offset, packet, parent)
  local length = size_of.heart_bt_int
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.heart_bt_int(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.heart_bt_int, range, value, display)

  return offset + length, value
end

-- Calculate size of: Admin Login 315
size_of.admin_login_315 = function(buffer, offset)
  local index = 0

  index = index + size_of.heart_bt_int

  return index
end

-- Display: Admin Login 315
display.admin_login_315 = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Admin Login 315
dissect.admin_login_315_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Heart Bt Int: 1 Byte Signed Fixed Width Integer
  index, heart_bt_int = dissect.heart_bt_int(buffer, index, packet, parent)

  return index
end

-- Dissect: Admin Login 315
dissect.admin_login_315 = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.admin_login_315 then
    local length = size_of.admin_login_315(buffer, offset)
    local range = buffer(offset, length)
    local display = display.admin_login_315(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.admin_login_315, range, display)
  end

  return dissect.admin_login_315_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Payload
size_of.payload = function(buffer, offset, template_id)
  -- Size of Admin Heartbeat 312
  if template_id == 312 then
    return 0
  end
  -- Size of Admin Login 315
  if template_id == 315 then
    return size_of.admin_login_315(buffer, offset)
  end
  -- Size of Admin Logout 316
  if template_id == 316 then
    return size_of.admin_logout_316(buffer, offset)
  end
  -- Size of Md Incremental Refresh Eris Reference Data And Daily Statistics 333
  if template_id == 333 then
    return size_of.md_incremental_refresh_eris_reference_data_and_daily_statistics_333(buffer, offset)
  end
  -- Size of Md News Indices 339
  if template_id == 339 then
    return size_of.md_news_indices_339(buffer, offset)
  end
  -- Size of Md Incremental Refresh Trade Blocks 340
  if template_id == 340 then
    return size_of.md_incremental_refresh_trade_blocks_340(buffer, offset)
  end
  -- Size of Quote Request 345
  if template_id == 345 then
    return size_of.quote_request_345(buffer, offset)
  end
  -- Size of Md Instrument Definition Indices 347
  if template_id == 347 then
    return size_of.md_instrument_definition_indices_347(buffer, offset)
  end
  -- Size of Md Incremental Refresh Indices 348
  if template_id == 348 then
    return size_of.md_incremental_refresh_indices_348(buffer, offset)
  end
  -- Size of Md Incremental Refresh Trade Blocks 349
  if template_id == 349 then
    return size_of.md_incremental_refresh_trade_blocks_349(buffer, offset)
  end
  -- Size of Md Incremental Refresh Eris 351
  if template_id == 351 then
    return size_of.md_incremental_refresh_eris_351(buffer, offset)
  end
  -- Size of Md Incremental Refresh Eris 353
  if template_id == 353 then
    return size_of.md_incremental_refresh_eris_353(buffer, offset)
  end
  -- Size of Md Incremental Refresh Ot C 356
  if template_id == 356 then
    return size_of.md_incremental_refresh_ot_c_356(buffer, offset)
  end
  -- Size of Md Instrument Definition Eris 363
  if template_id == 363 then
    return size_of.md_instrument_definition_eris_363(buffer, offset)
  end
  -- Size of Md Incremental Refresh Trade Blocks 365
  if template_id == 365 then
    return size_of.md_incremental_refresh_trade_blocks_365(buffer, offset)
  end
  -- Size of Md Incremental Refresh Ot C 366
  if template_id == 366 then
    return size_of.md_incremental_refresh_ot_c_366(buffer, offset)
  end

  return 0
end

-- Display: Payload
display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Payload
dissect.payload_branches = function(buffer, offset, packet, parent, template_id)
  -- Dissect Admin Heartbeat 312
  if template_id == 312 then
  end
  -- Dissect Admin Login 315
  if template_id == 315 then
    return dissect.admin_login_315(buffer, offset, packet, parent)
  end
  -- Dissect Admin Logout 316
  if template_id == 316 then
    return dissect.admin_logout_316(buffer, offset, packet, parent)
  end
  -- Dissect Md Incremental Refresh Eris Reference Data And Daily Statistics 333
  if template_id == 333 then
    return dissect.md_incremental_refresh_eris_reference_data_and_daily_statistics_333(buffer, offset, packet, parent)
  end
  -- Dissect Md News Indices 339
  if template_id == 339 then
    return dissect.md_news_indices_339(buffer, offset, packet, parent)
  end
  -- Dissect Md Incremental Refresh Trade Blocks 340
  if template_id == 340 then
    return dissect.md_incremental_refresh_trade_blocks_340(buffer, offset, packet, parent)
  end
  -- Dissect Quote Request 345
  if template_id == 345 then
    return dissect.quote_request_345(buffer, offset, packet, parent)
  end
  -- Dissect Md Instrument Definition Indices 347
  if template_id == 347 then
    return dissect.md_instrument_definition_indices_347(buffer, offset, packet, parent)
  end
  -- Dissect Md Incremental Refresh Indices 348
  if template_id == 348 then
    return dissect.md_incremental_refresh_indices_348(buffer, offset, packet, parent)
  end
  -- Dissect Md Incremental Refresh Trade Blocks 349
  if template_id == 349 then
    return dissect.md_incremental_refresh_trade_blocks_349(buffer, offset, packet, parent)
  end
  -- Dissect Md Incremental Refresh Eris 351
  if template_id == 351 then
    return dissect.md_incremental_refresh_eris_351(buffer, offset, packet, parent)
  end
  -- Dissect Md Incremental Refresh Eris 353
  if template_id == 353 then
    return dissect.md_incremental_refresh_eris_353(buffer, offset, packet, parent)
  end
  -- Dissect Md Incremental Refresh Ot C 356
  if template_id == 356 then
    return dissect.md_incremental_refresh_ot_c_356(buffer, offset, packet, parent)
  end
  -- Dissect Md Instrument Definition Eris 363
  if template_id == 363 then
    return dissect.md_instrument_definition_eris_363(buffer, offset, packet, parent)
  end
  -- Dissect Md Incremental Refresh Trade Blocks 365
  if template_id == 365 then
    return dissect.md_incremental_refresh_trade_blocks_365(buffer, offset, packet, parent)
  end
  -- Dissect Md Incremental Refresh Ot C 366
  if template_id == 366 then
    return dissect.md_incremental_refresh_ot_c_366(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
dissect.payload = function(buffer, offset, packet, parent, template_id)
  if not show.payload then
    return dissect.payload_branches(buffer, offset, packet, parent, template_id)
  end

  -- Calculate size and check that branch is not empty
  local size = size_of.payload(buffer, offset, template_id)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = display.payload(buffer, packet, parent)
  local element = parent:add(cme_futures_streamline_sbe_v5_9.fields.payload, range, display)

  return dissect.payload_branches(buffer, offset, packet, parent, template_id)
end

-- Size: Version
size_of.version = 2

-- Display: Version
display.version = function(value)
  return "Version: "..value
end

-- Dissect: Version
dissect.version = function(buffer, offset, packet, parent)
  local length = size_of.version
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.version(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.version, range, value, display)

  return offset + length, value
end

-- Size: Schema Id
size_of.schema_id = 2

-- Display: Schema Id
display.schema_id = function(value)
  return "Schema Id: "..value
end

-- Dissect: Schema Id
dissect.schema_id = function(buffer, offset, packet, parent)
  local length = size_of.schema_id
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.schema_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.schema_id, range, value, display)

  return offset + length, value
end

-- Size: Template Id
size_of.template_id = 2

-- Display: Template Id
display.template_id = function(value)
  if value == 312 then
    return "Template Id: Admin Heartbeat (312)"
  end
  if value == 315 then
    return "Template Id: Admin Login (315)"
  end
  if value == 316 then
    return "Template Id: Admin Logout (316)"
  end
  if value == 333 then
    return "Template Id: Md Incremental Refresh Eris Reference Data And Daily Statistics (333)"
  end
  if value == 339 then
    return "Template Id: Md News Indices (339)"
  end
  if value == 340 then
    return "Template Id: Md Incremental Refresh Trade Blocks (340)"
  end
  if value == 345 then
    return "Template Id: Quote Request (345)"
  end
  if value == 347 then
    return "Template Id: Md Instrument Definition Indices (347)"
  end
  if value == 348 then
    return "Template Id: Md Incremental Refresh Indices (348)"
  end
  if value == 349 then
    return "Template Id: Md Incremental Refresh Trade Blocks (349)"
  end
  if value == 351 then
    return "Template Id: Md Incremental Refresh Eris (351)"
  end
  if value == 353 then
    return "Template Id: Md Incremental Refresh Eris (353)"
  end
  if value == 356 then
    return "Template Id: Md Incremental Refresh Otc (356)"
  end
  if value == 363 then
    return "Template Id: Md Instrument Definition Eris (363)"
  end
  if value == 365 then
    return "Template Id: Md Incremental Refresh Trade Blocks (365)"
  end
  if value == 366 then
    return "Template Id: Md Incremental Refresh Otc (366)"
  end

  return "Template Id: Unknown("..value..")"
end

-- Dissect: Template Id
dissect.template_id = function(buffer, offset, packet, parent)
  local length = size_of.template_id
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.template_id(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.template_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Message Header
size_of.message_header = function(buffer, offset)
  local index = 0

  index = index + size_of.block_length

  index = index + size_of.template_id

  index = index + size_of.schema_id

  index = index + size_of.version

  return index
end

-- Display: Message Header
display.message_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message Header
dissect.message_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Block Length: 2 Byte Unsigned Fixed Width Integer
  index, block_length = dissect.block_length(buffer, index, packet, parent)

  -- Template Id: 2 Byte Unsigned Fixed Width Integer Enum with 16 values
  index, template_id = dissect.template_id(buffer, index, packet, parent)

  -- Schema Id: 2 Byte Unsigned Fixed Width Integer Static
  index, schema_id = dissect.schema_id(buffer, index, packet, parent)

  -- Version: 2 Byte Unsigned Fixed Width Integer Static
  index, version = dissect.version(buffer, index, packet, parent)

  return index
end

-- Dissect: Message Header
dissect.message_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.message_header then
    local length = size_of.message_header(buffer, offset)
    local range = buffer(offset, length)
    local display = display.message_header(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.message_header, range, display)
  end

  return dissect.message_header_fields(buffer, offset, packet, parent)
end

-- Size: Message Size
size_of.message_size = 2

-- Display: Message Size
display.message_size = function(value)
  return "Message Size: "..value
end

-- Dissect: Message Size
dissect.message_size = function(buffer, offset, packet, parent)
  local length = size_of.message_size
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.message_size(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.message_size, range, value, display)

  return offset + length, value
end

-- Calculate size of: Message
size_of.message = function(buffer, offset)
  local index = 0

  index = index + size_of.message_size

  index = index + size_of.message_header(buffer, offset + index)

  -- Calculate runtime size of Payload field
  local payload_offset = offset + index
  local payload_type = buffer(payload_offset - 6, 2):le_uint()
  index = index + size_of.payload(buffer, payload_offset, payload_type)

  return index
end

-- Display: Message
display.message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message
dissect.message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Size: 2 Byte Unsigned Fixed Width Integer
  index, message_size = dissect.message_size(buffer, index, packet, parent)

  -- Message Header: Struct of 4 fields
  index, message_header = dissect.message_header(buffer, index, packet, parent)

  -- Dependency element: Template Id
  local template_id = buffer(index - 6, 2):le_uint()

  -- Payload: Runtime Type with 16 branches
  index = dissect.payload(buffer, index, packet, parent, template_id)

  return index
end

-- Dissect: Message
dissect.message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.message then
    local length = size_of.message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.message(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.message, range, display)
  end

  return dissect.message_fields(buffer, offset, packet, parent)
end

-- Size: Sending Time
size_of.sending_time = 8

-- Display: Sending Time
display.sending_time = function(value)
  return "Sending Time: "..value
end

-- Dissect: Sending Time
dissect.sending_time = function(buffer, offset, packet, parent)
  local length = size_of.sending_time
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.sending_time(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.sending_time, range, value, display)

  return offset + length, value
end

-- Size: Message Sequence Number
size_of.message_sequence_number = 4

-- Display: Message Sequence Number
display.message_sequence_number = function(value)
  return "Message Sequence Number: "..value
end

-- Dissect: Message Sequence Number
dissect.message_sequence_number = function(buffer, offset, packet, parent)
  local length = size_of.message_sequence_number
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.message_sequence_number(value, buffer, offset, packet, parent)

  parent:add(cme_futures_streamline_sbe_v5_9.fields.message_sequence_number, range, value, display)

  return offset + length, value
end

-- Calculate size of: Binary Packet Header
size_of.binary_packet_header = function(buffer, offset)
  local index = 0

  index = index + size_of.message_sequence_number

  index = index + size_of.sending_time

  return index
end

-- Display: Binary Packet Header
display.binary_packet_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Binary Packet Header
dissect.binary_packet_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Sequence Number: 4 Byte Unsigned Fixed Width Integer
  index, message_sequence_number = dissect.message_sequence_number(buffer, index, packet, parent)

  -- Sending Time: 8 Byte Unsigned Fixed Width Integer
  index, sending_time = dissect.sending_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Binary Packet Header
dissect.binary_packet_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.binary_packet_header then
    local length = size_of.binary_packet_header(buffer, offset)
    local range = buffer(offset, length)
    local display = display.binary_packet_header(buffer, packet, parent)
    parent = parent:add(cme_futures_streamline_sbe_v5_9.fields.binary_packet_header, range, display)
  end

  return dissect.binary_packet_header_fields(buffer, offset, packet, parent)
end

-- Dissect Packet
dissect.packet = function(buffer, packet, parent)
  local index = 0

  -- Binary Packet Header: Struct of 2 fields
  index, binary_packet_header = dissect.binary_packet_header(buffer, index, packet, parent)

  -- Message: Struct of 3 fields
  local end_of_payload = buffer:len()

  -- Message: Struct of 3 fields
  while index < end_of_payload do
    index = dissect.message(buffer, index, packet, parent)
  end

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function cme_futures_streamline_sbe_v5_9.init()
end

-- Dissector for Cme Futures Streamline Sbe 5.9
function cme_futures_streamline_sbe_v5_9.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = cme_futures_streamline_sbe_v5_9.name

  -- Dissect protocol
  local protocol = parent:add(cme_futures_streamline_sbe_v5_9, buffer(), cme_futures_streamline_sbe_v5_9.description, "("..buffer:len().." Bytes)")
  local protocol_size = dissect.packet(buffer, packet, protocol)
end

-- Register With Udp Table
local udp_table = DissectorTable.get("udp.port")
udp_table:add(65333, cme_futures_streamline_sbe_v5_9)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.cme_futures_streamline_sbe_v5_9_packet_size = function(buffer)

  return true
end

-- Verify Schema Id Field
verify.schema_id = function(buffer)
  if 5 == buffer(18, 2):le_uint() then
    return true
  end

  return false
end

-- Verify Version Field
verify.version = function(buffer)
  if 9 == buffer(20, 2):le_uint() then
    return true
  end

  return false
end

-- Dissector Heuristic for Cme Futures Streamline Sbe 5.9
local function cme_futures_streamline_sbe_v5_9_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.cme_futures_streamline_sbe_v5_9_packet_size(buffer) then return false end

  -- Verify Schema Id
  if not verify.schema_id(buffer) then return false end

  -- Verify Version
  if not verify.version(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = cme_futures_streamline_sbe_v5_9
  cme_futures_streamline_sbe_v5_9.dissector(buffer, packet, parent)

  return true
end

-- Register Heuristic for Cme Futures Streamline Sbe 5.9
cme_futures_streamline_sbe_v5_9:register_heuristic("udp", cme_futures_streamline_sbe_v5_9_heuristic)

-----------------------------------------------------------------------
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- 
-- Protocol:
--   Organization: Chicago Mercantile Exchange
--   Version: 5.9
--   Date: Wednesday, April 4, 2018
-- 
-- Script:
--   Generator: 1.5.0.0
--   Compiler: 2.0
--   License: Public/GPLv3
--   Authors: Omi Developers
-- 
-- This script was generated by the Open Markets Initiative (Omi).
-- 
-- For full Omi information:
-- https://github.com/Open-Markets-Initiative/Directory
-----------------------------------------------------------------------
