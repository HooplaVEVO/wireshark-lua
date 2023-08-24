-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Memx Options Memo Sbe 1.3 Protocol
local memx_options_memo_sbe_v1_3 = Proto("Memx.Options.Memo.Sbe.v1.3.Lua", "Memx Options Memo Sbe 1.3")

-- Component Tables
local show = {}
local format = {}
local memx_options_memo_sbe_v1_3_display = {}
local memx_options_memo_sbe_v1_3_dissect = {}
local memx_options_memo_sbe_v1_3_size_of = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Memx Options Memo Sbe 1.3 Fields
memx_options_memo_sbe_v1_3.fields.alloc_id = ProtoField.new("Alloc Id", "memx.options.memo.sbe.v1.3.allocid", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.alloc_qty = ProtoField.new("Alloc Qty", "memx.options.memo.sbe.v1.3.allocqty", ftypes.UINT32)
memx_options_memo_sbe_v1_3.fields.alloc_rej_code = ProtoField.new("Alloc Rej Code", "memx.options.memo.sbe.v1.3.allocrejcode", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.alloc_report_id = ProtoField.new("Alloc Report Id", "memx.options.memo.sbe.v1.3.allocreportid", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.alloc_status = ProtoField.new("Alloc Status", "memx.options.memo.sbe.v1.3.allocstatus", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.alloc_trans_type = ProtoField.new("Alloc Trans Type", "memx.options.memo.sbe.v1.3.alloctranstype", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.alloc_type = ProtoField.new("Alloc Type", "memx.options.memo.sbe.v1.3.alloctype", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.allocation_instruction_ack_message = ProtoField.new("Allocation Instruction Ack Message", "memx.options.memo.sbe.v1.3.allocationinstructionackmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.allocation_instruction_message = ProtoField.new("Allocation Instruction Message", "memx.options.memo.sbe.v1.3.allocationinstructionmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.allocation_report_message = ProtoField.new("Allocation Report Message", "memx.options.memo.sbe.v1.3.allocationreportmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.allocations_group = ProtoField.new("Allocations Group", "memx.options.memo.sbe.v1.3.allocationsgroup", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.allocations_groups = ProtoField.new("Allocations Groups", "memx.options.memo.sbe.v1.3.allocationsgroups", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.bid_px = ProtoField.new("Bid Px", "memx.options.memo.sbe.v1.3.bidpx", ftypes.INT8)
memx_options_memo_sbe_v1_3.fields.bid_size = ProtoField.new("Bid Size", "memx.options.memo.sbe.v1.3.bidsize", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.block_length = ProtoField.new("Block Length", "memx.options.memo.sbe.v1.3.blocklength", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.block_length_uint_8 = ProtoField.new("Block Length uint 8", "memx.options.memo.sbe.v1.3.blocklengthuint8", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.cancel_group_id = ProtoField.new("Cancel Group Id", "memx.options.memo.sbe.v1.3.cancelgroupid", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.cancel_orders_from_this_port_only = ProtoField.new("Cancel Orders From This Port Only", "memx.options.memo.sbe.v1.3.cancelordersfromthisportonly", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x04")
memx_options_memo_sbe_v1_3.fields.cancel_reason = ProtoField.new("Cancel Reason", "memx.options.memo.sbe.v1.3.cancelreason", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.cl_ord_id = ProtoField.new("Cl Ord Id", "memx.options.memo.sbe.v1.3.clordid", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.common_header = ProtoField.new("Common Header", "memx.options.memo.sbe.v1.3.commonheader", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.contra_trading_capacity = ProtoField.new("Contra Trading Capacity", "memx.options.memo.sbe.v1.3.contratradingcapacity", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.count = ProtoField.new("Count", "memx.options.memo.sbe.v1.3.count", ftypes.UINT32)
memx_options_memo_sbe_v1_3.fields.cum_qty = ProtoField.new("Cum Qty", "memx.options.memo.sbe.v1.3.cumqty", ftypes.UINT32)
memx_options_memo_sbe_v1_3.fields.cxl_rej_reason = ProtoField.new("Cxl Rej Reason", "memx.options.memo.sbe.v1.3.cxlrejreason", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.cxl_rej_response_to = ProtoField.new("Cxl Rej Response To", "memx.options.memo.sbe.v1.3.cxlrejresponseto", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.data = ProtoField.new("Data", "memx.options.memo.sbe.v1.3.data", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.efid = ProtoField.new("Efid", "memx.options.memo.sbe.v1.3.efid", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.exec_id = ProtoField.new("Exec Id", "memx.options.memo.sbe.v1.3.execid", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.exec_inst = ProtoField.new("Exec Inst", "memx.options.memo.sbe.v1.3.execinst", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.exec_ref_id = ProtoField.new("Exec Ref Id", "memx.options.memo.sbe.v1.3.execrefid", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.exec_restatement_reason = ProtoField.new("Exec Restatement Reason", "memx.options.memo.sbe.v1.3.execrestatementreason", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.execution_report_bulk_quote_component_new_message = ProtoField.new("Execution Report Bulk Quote Component New Message", "memx.options.memo.sbe.v1.3.executionreportbulkquotecomponentnewmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_bulk_quote_pending_new_message = ProtoField.new("Execution Report Bulk Quote Pending New Message", "memx.options.memo.sbe.v1.3.executionreportbulkquotependingnewmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_canceled_message = ProtoField.new("Execution Report Canceled Message", "memx.options.memo.sbe.v1.3.executionreportcanceledmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_new_message = ProtoField.new("Execution Report New Message", "memx.options.memo.sbe.v1.3.executionreportnewmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_pending_cancel_message = ProtoField.new("Execution Report Pending Cancel Message", "memx.options.memo.sbe.v1.3.executionreportpendingcancelmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_pending_replace_message = ProtoField.new("Execution Report Pending Replace Message", "memx.options.memo.sbe.v1.3.executionreportpendingreplacemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_rejected_message = ProtoField.new("Execution Report Rejected Message", "memx.options.memo.sbe.v1.3.executionreportrejectedmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_replaced_message = ProtoField.new("Execution Report Replaced Message", "memx.options.memo.sbe.v1.3.executionreportreplacedmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_restatement_message = ProtoField.new("Execution Report Restatement Message", "memx.options.memo.sbe.v1.3.executionreportrestatementmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_trade_break_message = ProtoField.new("Execution Report Trade Break Message", "memx.options.memo.sbe.v1.3.executionreporttradebreakmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_trade_correction_message = ProtoField.new("Execution Report Trade Correction Message", "memx.options.memo.sbe.v1.3.executionreporttradecorrectionmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.execution_report_trade_message = ProtoField.new("Execution Report Trade Message", "memx.options.memo.sbe.v1.3.executionreporttrademessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.extended_restatement_reason = ProtoField.new("Extended Restatement Reason", "memx.options.memo.sbe.v1.3.extendedrestatementreason", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.external_routing_not_allowed = ProtoField.new("External Routing Not Allowed", "memx.options.memo.sbe.v1.3.externalroutingnotallowed", ftypes.UINT16, {[1]="Yes",[0]="No"}, base.DEC, "0x0004")
memx_options_memo_sbe_v1_3.fields.intermarket_sweep = ProtoField.new("Intermarket Sweep", "memx.options.memo.sbe.v1.3.intermarketsweep", ftypes.UINT16, {[1]="Yes",[0]="No"}, base.DEC, "0x0002")
memx_options_memo_sbe_v1_3.fields.last_liquidity_ind = ProtoField.new("Last Liquidity Ind", "memx.options.memo.sbe.v1.3.lastliquidityind", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.last_mkt = ProtoField.new("Last Mkt", "memx.options.memo.sbe.v1.3.lastmkt", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.last_px = ProtoField.new("Last Px", "memx.options.memo.sbe.v1.3.lastpx", ftypes.INT8)
memx_options_memo_sbe_v1_3.fields.last_qty = ProtoField.new("Last Qty", "memx.options.memo.sbe.v1.3.lastqty", ftypes.UINT32)
memx_options_memo_sbe_v1_3.fields.leaves_qty = ProtoField.new("Leaves Qty", "memx.options.memo.sbe.v1.3.leavesqty", ftypes.UINT32)
memx_options_memo_sbe_v1_3.fields.list_seq_no = ProtoField.new("List Seq No", "memx.options.memo.sbe.v1.3.listseqno", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.lockout = ProtoField.new("Lockout", "memx.options.memo.sbe.v1.3.lockout", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x01")
memx_options_memo_sbe_v1_3.fields.lockout_id = ProtoField.new("Lockout Id", "memx.options.memo.sbe.v1.3.lockoutid", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.login_accepted_message = ProtoField.new("Login Accepted Message", "memx.options.memo.sbe.v1.3.loginacceptedmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.login_reject_code = ProtoField.new("Login Reject Code", "memx.options.memo.sbe.v1.3.loginrejectcode", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.login_rejected_message = ProtoField.new("Login Rejected Message", "memx.options.memo.sbe.v1.3.loginrejectedmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.login_request_message = ProtoField.new("Login Request Message", "memx.options.memo.sbe.v1.3.loginrequestmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.long_one_sided_bulk_quote_message = ProtoField.new("Long One Sided Bulk Quote Message", "memx.options.memo.sbe.v1.3.longonesidedbulkquotemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.long_two_sided_bulk_quote_message = ProtoField.new("Long Two Sided Bulk Quote Message", "memx.options.memo.sbe.v1.3.longtwosidedbulkquotemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.mass_cancel_clear_lockout_done_message = ProtoField.new("Mass Cancel Clear Lockout Done Message", "memx.options.memo.sbe.v1.3.masscancelclearlockoutdonemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.mass_cancel_clear_lockout_reject_message = ProtoField.new("Mass Cancel Clear Lockout Reject Message", "memx.options.memo.sbe.v1.3.masscancelclearlockoutrejectmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.mass_cancel_clear_lockout_request_message = ProtoField.new("Mass Cancel Clear Lockout Request Message", "memx.options.memo.sbe.v1.3.masscancelclearlockoutrequestmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.mass_cancel_done_message = ProtoField.new("Mass Cancel Done Message", "memx.options.memo.sbe.v1.3.masscanceldonemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.mass_cancel_inst = ProtoField.new("Mass Cancel Inst", "memx.options.memo.sbe.v1.3.masscancelinst", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.mass_cancel_reject_message = ProtoField.new("Mass Cancel Reject Message", "memx.options.memo.sbe.v1.3.masscancelrejectmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.mass_cancel_request_message = ProtoField.new("Mass Cancel Request Message", "memx.options.memo.sbe.v1.3.masscancelrequestmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.match_trade_prevention = ProtoField.new("Match Trade Prevention", "memx.options.memo.sbe.v1.3.matchtradeprevention", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.message_count = ProtoField.new("Message Count", "memx.options.memo.sbe.v1.3.messagecount", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.message_length = ProtoField.new("Message Length", "memx.options.memo.sbe.v1.3.messagelength", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.message_type = ProtoField.new("Message Type", "memx.options.memo.sbe.v1.3.messagetype", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.mtp_group_id = ProtoField.new("Mtp Group Id", "memx.options.memo.sbe.v1.3.mtpgroupid", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.new_order_single_message = ProtoField.new("New Order Single Message", "memx.options.memo.sbe.v1.3.newordersinglemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.next_sequence_number = ProtoField.new("Next Sequence Number", "memx.options.memo.sbe.v1.3.nextsequencenumber", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.num_in_group = ProtoField.new("Num In Group", "memx.options.memo.sbe.v1.3.numingroup", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.number_of_orders = ProtoField.new("Number Of Orders", "memx.options.memo.sbe.v1.3.numberoforders", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.offer_px = ProtoField.new("Offer Px", "memx.options.memo.sbe.v1.3.offerpx", ftypes.INT8)
memx_options_memo_sbe_v1_3.fields.offer_size = ProtoField.new("Offer Size", "memx.options.memo.sbe.v1.3.offersize", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.open_or_close = ProtoField.new("Open Or Close", "memx.options.memo.sbe.v1.3.openorclose", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.options_security_id = ProtoField.new("Options Security Id", "memx.options.memo.sbe.v1.3.optionssecurityid", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.ord_status = ProtoField.new("Ord Status", "memx.options.memo.sbe.v1.3.ordstatus", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.ord_type = ProtoField.new("Ord Type", "memx.options.memo.sbe.v1.3.ordtype", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.order_cancel_reject_message = ProtoField.new("Order Cancel Reject Message", "memx.options.memo.sbe.v1.3.ordercancelrejectmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.order_cancel_replace_request_message = ProtoField.new("Order Cancel Replace Request Message", "memx.options.memo.sbe.v1.3.ordercancelreplacerequestmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.order_cancel_request_message = ProtoField.new("Order Cancel Request Message", "memx.options.memo.sbe.v1.3.ordercancelrequestmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.order_id = ProtoField.new("Order Id", "memx.options.memo.sbe.v1.3.orderid", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.order_qty = ProtoField.new("Order Qty", "memx.options.memo.sbe.v1.3.orderqty", ftypes.UINT32)
memx_options_memo_sbe_v1_3.fields.orig_cl_ord_id = ProtoField.new("Orig Cl Ord Id", "memx.options.memo.sbe.v1.3.origclordid", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.packet = ProtoField.new("Packet", "memx.options.memo.sbe.v1.3.packet", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.participate_do_not_initiate = ProtoField.new("Participate Do Not Initiate", "memx.options.memo.sbe.v1.3.participatedonotinitiate", ftypes.UINT16, {[1]="Yes",[0]="No"}, base.DEC, "0x0001")
memx_options_memo_sbe_v1_3.fields.parties_group = ProtoField.new("Parties Group", "memx.options.memo.sbe.v1.3.partiesgroup", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.parties_groups = ProtoField.new("Parties Groups", "memx.options.memo.sbe.v1.3.partiesgroups", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.party_id = ProtoField.new("Party Id", "memx.options.memo.sbe.v1.3.partyid", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.party_id_source = ProtoField.new("Party Id Source", "memx.options.memo.sbe.v1.3.partyidsource", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.party_role = ProtoField.new("Party Role", "memx.options.memo.sbe.v1.3.partyrole", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.payload = ProtoField.new("Payload", "memx.options.memo.sbe.v1.3.payload", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.pending_mass_cancel_message = ProtoField.new("Pending Mass Cancel Message", "memx.options.memo.sbe.v1.3.pendingmasscancelmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.pending_message_count = ProtoField.new("Pending Message Count", "memx.options.memo.sbe.v1.3.pendingmessagecount", ftypes.UINT32)
memx_options_memo_sbe_v1_3.fields.price_price_type = ProtoField.new("Price Price Type", "memx.options.memo.sbe.v1.3.pricepricetype", ftypes.INT8)
memx_options_memo_sbe_v1_3.fields.quantity_uint_32 = ProtoField.new("Quantity uint 32", "memx.options.memo.sbe.v1.3.quantityuint32", ftypes.UINT32)
memx_options_memo_sbe_v1_3.fields.quotes_group = ProtoField.new("Quotes Group", "memx.options.memo.sbe.v1.3.quotesgroup", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.quotes_groups = ProtoField.new("Quotes Groups", "memx.options.memo.sbe.v1.3.quotesgroups", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.ref_alloc_report_id = ProtoField.new("Ref Alloc Report Id", "memx.options.memo.sbe.v1.3.refallocreportid", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.rej_reason = ProtoField.new("Rej Reason", "memx.options.memo.sbe.v1.3.rejreason", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.reject_reason = ProtoField.new("Reject Reason", "memx.options.memo.sbe.v1.3.rejectreason", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.repeating_group_dimensions = ProtoField.new("Repeating Group Dimensions", "memx.options.memo.sbe.v1.3.repeatinggroupdimensions", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.replay_all_request_message = ProtoField.new("Replay All Request Message", "memx.options.memo.sbe.v1.3.replayallrequestmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.replay_begin_message = ProtoField.new("Replay Begin Message", "memx.options.memo.sbe.v1.3.replaybeginmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.replay_complete_message = ProtoField.new("Replay Complete Message", "memx.options.memo.sbe.v1.3.replaycompletemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.replay_reject_code = ProtoField.new("Replay Reject Code", "memx.options.memo.sbe.v1.3.replayrejectcode", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.replay_rejected_message = ProtoField.new("Replay Rejected Message", "memx.options.memo.sbe.v1.3.replayrejectedmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.replay_request_message = ProtoField.new("Replay Request Message", "memx.options.memo.sbe.v1.3.replayrequestmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.reprice_behavior = ProtoField.new("Reprice Behavior", "memx.options.memo.sbe.v1.3.repricebehavior", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.reprice_frequency = ProtoField.new("Reprice Frequency", "memx.options.memo.sbe.v1.3.repricefrequency", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.reserved_13 = ProtoField.new("Reserved 13", "memx.options.memo.sbe.v1.3.reserved13", ftypes.UINT16, nil, base.DEC, "0xFFF8")
memx_options_memo_sbe_v1_3.fields.reserved_5 = ProtoField.new("Reserved 5", "memx.options.memo.sbe.v1.3.reserved5", ftypes.UINT8, nil, base.DEC, "0xF8")
memx_options_memo_sbe_v1_3.fields.risk_group_id = ProtoField.new("Risk Group Id", "memx.options.memo.sbe.v1.3.riskgroupid", ftypes.UINT16)
memx_options_memo_sbe_v1_3.fields.sbe_header = ProtoField.new("Sbe Header", "memx.options.memo.sbe.v1.3.sbeheader", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.sbe_message = ProtoField.new("Sbe Message", "memx.options.memo.sbe.v1.3.sbemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.schema_id = ProtoField.new("Schema Id", "memx.options.memo.sbe.v1.3.schemaid", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.send_cancels = ProtoField.new("Send Cancels", "memx.options.memo.sbe.v1.3.sendcancels", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x02")
memx_options_memo_sbe_v1_3.fields.sending_time = ProtoField.new("Sending Time", "memx.options.memo.sbe.v1.3.sendingtime", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.sequenced_message = ProtoField.new("Sequenced Message", "memx.options.memo.sbe.v1.3.sequencedmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.session_id = ProtoField.new("Session Id", "memx.options.memo.sbe.v1.3.sessionid", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.short_one_sided_bulk_quote_message = ProtoField.new("Short One Sided Bulk Quote Message", "memx.options.memo.sbe.v1.3.shortonesidedbulkquotemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.short_two_sided_bulk_quote_message = ProtoField.new("Short Two Sided Bulk Quote Message", "memx.options.memo.sbe.v1.3.shorttwosidedbulkquotemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.side = ProtoField.new("Side", "memx.options.memo.sbe.v1.3.side", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.start_of_session_message = ProtoField.new("Start Of Session Message", "memx.options.memo.sbe.v1.3.startofsessionmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.stream_begin_message = ProtoField.new("Stream Begin Message", "memx.options.memo.sbe.v1.3.streambeginmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.stream_complete_message = ProtoField.new("Stream Complete Message", "memx.options.memo.sbe.v1.3.streamcompletemessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.stream_reject_code = ProtoField.new("Stream Reject Code", "memx.options.memo.sbe.v1.3.streamrejectcode", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.stream_rejected_message = ProtoField.new("Stream Rejected Message", "memx.options.memo.sbe.v1.3.streamrejectedmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.stream_request_message = ProtoField.new("Stream Request Message", "memx.options.memo.sbe.v1.3.streamrequestmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.supported_request_mode = ProtoField.new("Supported Request Mode", "memx.options.memo.sbe.v1.3.supportedrequestmode", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.symbol = ProtoField.new("Symbol", "memx.options.memo.sbe.v1.3.symbol", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.template_id = ProtoField.new("Template Id", "memx.options.memo.sbe.v1.3.templateid", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.time_in_force = ProtoField.new("Time In Force", "memx.options.memo.sbe.v1.3.timeinforce", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.token = ProtoField.new("Token", "memx.options.memo.sbe.v1.3.token", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.token_type = ProtoField.new("Token Type", "memx.options.memo.sbe.v1.3.tokentype", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.total_affected_orders = ProtoField.new("Total Affected Orders", "memx.options.memo.sbe.v1.3.totalaffectedorders", ftypes.UINT32)
memx_options_memo_sbe_v1_3.fields.total_sequence_count = ProtoField.new("Total Sequence Count", "memx.options.memo.sbe.v1.3.totalsequencecount", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.trade_date = ProtoField.new("Trade Date", "memx.options.memo.sbe.v1.3.tradedate", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.trading_capacity = ProtoField.new("Trading Capacity", "memx.options.memo.sbe.v1.3.tradingcapacity", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.transact_time = ProtoField.new("Transact Time", "memx.options.memo.sbe.v1.3.transacttime", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.trd_match_id = ProtoField.new("Trd Match Id", "memx.options.memo.sbe.v1.3.trdmatchid", ftypes.UINT64)
memx_options_memo_sbe_v1_3.fields.underlier_mass_cancel_reject_underlier = ProtoField.new("Underlier Mass Cancel Reject Underlier", "memx.options.memo.sbe.v1.3.underliermasscancelrejectunderlier", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.underlier_mass_cancel_request_underlier = ProtoField.new("Underlier Mass Cancel Request Underlier", "memx.options.memo.sbe.v1.3.underliermasscancelrequestunderlier", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.underlier_pending_mass_cancel_underlier = ProtoField.new("Underlier Pending Mass Cancel Underlier", "memx.options.memo.sbe.v1.3.underlierpendingmasscancelunderlier", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.underlying_or_series = ProtoField.new("Underlying Or Series", "memx.options.memo.sbe.v1.3.underlyingorseries", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.unsequenced_message = ProtoField.new("Unsequenced Message", "memx.options.memo.sbe.v1.3.unsequencedmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.user_notification_message = ProtoField.new("User Notification Message", "memx.options.memo.sbe.v1.3.usernotificationmessage", ftypes.STRING)
memx_options_memo_sbe_v1_3.fields.user_status = ProtoField.new("User Status", "memx.options.memo.sbe.v1.3.userstatus", ftypes.UINT8)
memx_options_memo_sbe_v1_3.fields.version = ProtoField.new("Version", "memx.options.memo.sbe.v1.3.version", ftypes.UINT16)

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Memx Options Memo Sbe 1.3 Element Dissection Options
show.allocation_instruction_ack_message = true
show.allocation_instruction_message = true
show.allocation_report_message = true
show.allocations_group = true
show.allocations_groups = true
show.common_header = true
show.exec_inst = true
show.execution_report_bulk_quote_component_new_message = true
show.execution_report_bulk_quote_pending_new_message = true
show.execution_report_canceled_message = true
show.execution_report_new_message = true
show.execution_report_pending_cancel_message = true
show.execution_report_pending_replace_message = true
show.execution_report_rejected_message = true
show.execution_report_replaced_message = true
show.execution_report_restatement_message = true
show.execution_report_trade_break_message = true
show.execution_report_trade_correction_message = true
show.execution_report_trade_message = true
show.login_accepted_message = true
show.login_rejected_message = true
show.login_request_message = true
show.long_one_sided_bulk_quote_message = true
show.long_two_sided_bulk_quote_message = true
show.mass_cancel_clear_lockout_done_message = true
show.mass_cancel_clear_lockout_reject_message = true
show.mass_cancel_clear_lockout_request_message = true
show.mass_cancel_done_message = true
show.mass_cancel_inst = true
show.mass_cancel_reject_message = true
show.mass_cancel_request_message = true
show.new_order_single_message = true
show.order_cancel_reject_message = true
show.order_cancel_replace_request_message = true
show.order_cancel_request_message = true
show.packet = true
show.parties_group = true
show.parties_groups = true
show.pending_mass_cancel_message = true
show.quotes_group = true
show.quotes_groups = true
show.repeating_group_dimensions = true
show.replay_all_request_message = true
show.replay_begin_message = true
show.replay_complete_message = true
show.replay_rejected_message = true
show.replay_request_message = true
show.sbe_header = true
show.sbe_message = true
show.sequenced_message = true
show.short_one_sided_bulk_quote_message = true
show.short_two_sided_bulk_quote_message = true
show.start_of_session_message = true
show.stream_begin_message = true
show.stream_complete_message = true
show.stream_rejected_message = true
show.stream_request_message = true
show.unsequenced_message = true
show.user_notification_message = true
show.data = false
show.payload = false

-- Register Memx Options Memo Sbe 1.3 Show Options
memx_options_memo_sbe_v1_3.prefs.show_allocation_instruction_ack_message = Pref.bool("Show Allocation Instruction Ack Message", show.allocation_instruction_ack_message, "Parse and add Allocation Instruction Ack Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_allocation_instruction_message = Pref.bool("Show Allocation Instruction Message", show.allocation_instruction_message, "Parse and add Allocation Instruction Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_allocation_report_message = Pref.bool("Show Allocation Report Message", show.allocation_report_message, "Parse and add Allocation Report Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_allocations_group = Pref.bool("Show Allocations Group", show.allocations_group, "Parse and add Allocations Group to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_allocations_groups = Pref.bool("Show Allocations Groups", show.allocations_groups, "Parse and add Allocations Groups to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_common_header = Pref.bool("Show Common Header", show.common_header, "Parse and add Common Header to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_exec_inst = Pref.bool("Show Exec Inst", show.exec_inst, "Parse and add Exec Inst to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_bulk_quote_component_new_message = Pref.bool("Show Execution Report Bulk Quote Component New Message", show.execution_report_bulk_quote_component_new_message, "Parse and add Execution Report Bulk Quote Component New Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_bulk_quote_pending_new_message = Pref.bool("Show Execution Report Bulk Quote Pending New Message", show.execution_report_bulk_quote_pending_new_message, "Parse and add Execution Report Bulk Quote Pending New Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_canceled_message = Pref.bool("Show Execution Report Canceled Message", show.execution_report_canceled_message, "Parse and add Execution Report Canceled Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_new_message = Pref.bool("Show Execution Report New Message", show.execution_report_new_message, "Parse and add Execution Report New Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_pending_cancel_message = Pref.bool("Show Execution Report Pending Cancel Message", show.execution_report_pending_cancel_message, "Parse and add Execution Report Pending Cancel Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_pending_replace_message = Pref.bool("Show Execution Report Pending Replace Message", show.execution_report_pending_replace_message, "Parse and add Execution Report Pending Replace Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_rejected_message = Pref.bool("Show Execution Report Rejected Message", show.execution_report_rejected_message, "Parse and add Execution Report Rejected Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_replaced_message = Pref.bool("Show Execution Report Replaced Message", show.execution_report_replaced_message, "Parse and add Execution Report Replaced Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_restatement_message = Pref.bool("Show Execution Report Restatement Message", show.execution_report_restatement_message, "Parse and add Execution Report Restatement Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_trade_break_message = Pref.bool("Show Execution Report Trade Break Message", show.execution_report_trade_break_message, "Parse and add Execution Report Trade Break Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_trade_correction_message = Pref.bool("Show Execution Report Trade Correction Message", show.execution_report_trade_correction_message, "Parse and add Execution Report Trade Correction Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_execution_report_trade_message = Pref.bool("Show Execution Report Trade Message", show.execution_report_trade_message, "Parse and add Execution Report Trade Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_login_accepted_message = Pref.bool("Show Login Accepted Message", show.login_accepted_message, "Parse and add Login Accepted Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_login_rejected_message = Pref.bool("Show Login Rejected Message", show.login_rejected_message, "Parse and add Login Rejected Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_login_request_message = Pref.bool("Show Login Request Message", show.login_request_message, "Parse and add Login Request Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_long_one_sided_bulk_quote_message = Pref.bool("Show Long One Sided Bulk Quote Message", show.long_one_sided_bulk_quote_message, "Parse and add Long One Sided Bulk Quote Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_long_two_sided_bulk_quote_message = Pref.bool("Show Long Two Sided Bulk Quote Message", show.long_two_sided_bulk_quote_message, "Parse and add Long Two Sided Bulk Quote Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_clear_lockout_done_message = Pref.bool("Show Mass Cancel Clear Lockout Done Message", show.mass_cancel_clear_lockout_done_message, "Parse and add Mass Cancel Clear Lockout Done Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_clear_lockout_reject_message = Pref.bool("Show Mass Cancel Clear Lockout Reject Message", show.mass_cancel_clear_lockout_reject_message, "Parse and add Mass Cancel Clear Lockout Reject Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_clear_lockout_request_message = Pref.bool("Show Mass Cancel Clear Lockout Request Message", show.mass_cancel_clear_lockout_request_message, "Parse and add Mass Cancel Clear Lockout Request Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_done_message = Pref.bool("Show Mass Cancel Done Message", show.mass_cancel_done_message, "Parse and add Mass Cancel Done Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_inst = Pref.bool("Show Mass Cancel Inst", show.mass_cancel_inst, "Parse and add Mass Cancel Inst to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_reject_message = Pref.bool("Show Mass Cancel Reject Message", show.mass_cancel_reject_message, "Parse and add Mass Cancel Reject Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_request_message = Pref.bool("Show Mass Cancel Request Message", show.mass_cancel_request_message, "Parse and add Mass Cancel Request Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_new_order_single_message = Pref.bool("Show New Order Single Message", show.new_order_single_message, "Parse and add New Order Single Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_order_cancel_reject_message = Pref.bool("Show Order Cancel Reject Message", show.order_cancel_reject_message, "Parse and add Order Cancel Reject Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_order_cancel_replace_request_message = Pref.bool("Show Order Cancel Replace Request Message", show.order_cancel_replace_request_message, "Parse and add Order Cancel Replace Request Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_order_cancel_request_message = Pref.bool("Show Order Cancel Request Message", show.order_cancel_request_message, "Parse and add Order Cancel Request Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_parties_group = Pref.bool("Show Parties Group", show.parties_group, "Parse and add Parties Group to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_parties_groups = Pref.bool("Show Parties Groups", show.parties_groups, "Parse and add Parties Groups to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_pending_mass_cancel_message = Pref.bool("Show Pending Mass Cancel Message", show.pending_mass_cancel_message, "Parse and add Pending Mass Cancel Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_quotes_group = Pref.bool("Show Quotes Group", show.quotes_group, "Parse and add Quotes Group to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_quotes_groups = Pref.bool("Show Quotes Groups", show.quotes_groups, "Parse and add Quotes Groups to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_repeating_group_dimensions = Pref.bool("Show Repeating Group Dimensions", show.repeating_group_dimensions, "Parse and add Repeating Group Dimensions to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_replay_all_request_message = Pref.bool("Show Replay All Request Message", show.replay_all_request_message, "Parse and add Replay All Request Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_replay_begin_message = Pref.bool("Show Replay Begin Message", show.replay_begin_message, "Parse and add Replay Begin Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_replay_complete_message = Pref.bool("Show Replay Complete Message", show.replay_complete_message, "Parse and add Replay Complete Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_replay_rejected_message = Pref.bool("Show Replay Rejected Message", show.replay_rejected_message, "Parse and add Replay Rejected Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_replay_request_message = Pref.bool("Show Replay Request Message", show.replay_request_message, "Parse and add Replay Request Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_sbe_header = Pref.bool("Show Sbe Header", show.sbe_header, "Parse and add Sbe Header to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_sbe_message = Pref.bool("Show Sbe Message", show.sbe_message, "Parse and add Sbe Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_sequenced_message = Pref.bool("Show Sequenced Message", show.sequenced_message, "Parse and add Sequenced Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_short_one_sided_bulk_quote_message = Pref.bool("Show Short One Sided Bulk Quote Message", show.short_one_sided_bulk_quote_message, "Parse and add Short One Sided Bulk Quote Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_short_two_sided_bulk_quote_message = Pref.bool("Show Short Two Sided Bulk Quote Message", show.short_two_sided_bulk_quote_message, "Parse and add Short Two Sided Bulk Quote Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_start_of_session_message = Pref.bool("Show Start Of Session Message", show.start_of_session_message, "Parse and add Start Of Session Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_stream_begin_message = Pref.bool("Show Stream Begin Message", show.stream_begin_message, "Parse and add Stream Begin Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_stream_complete_message = Pref.bool("Show Stream Complete Message", show.stream_complete_message, "Parse and add Stream Complete Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_stream_rejected_message = Pref.bool("Show Stream Rejected Message", show.stream_rejected_message, "Parse and add Stream Rejected Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_stream_request_message = Pref.bool("Show Stream Request Message", show.stream_request_message, "Parse and add Stream Request Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_unsequenced_message = Pref.bool("Show Unsequenced Message", show.unsequenced_message, "Parse and add Unsequenced Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_user_notification_message = Pref.bool("Show User Notification Message", show.user_notification_message, "Parse and add User Notification Message to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_data = Pref.bool("Show Data", show.data, "Parse and add Data to protocol tree")
memx_options_memo_sbe_v1_3.prefs.show_payload = Pref.bool("Show Payload", show.payload, "Parse and add Payload to protocol tree")

-- Handle changed preferences
function memx_options_memo_sbe_v1_3.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.allocation_instruction_ack_message ~= memx_options_memo_sbe_v1_3.prefs.show_allocation_instruction_ack_message then
    show.allocation_instruction_ack_message = memx_options_memo_sbe_v1_3.prefs.show_allocation_instruction_ack_message
    changed = true
  end
  if show.allocation_instruction_message ~= memx_options_memo_sbe_v1_3.prefs.show_allocation_instruction_message then
    show.allocation_instruction_message = memx_options_memo_sbe_v1_3.prefs.show_allocation_instruction_message
    changed = true
  end
  if show.allocation_report_message ~= memx_options_memo_sbe_v1_3.prefs.show_allocation_report_message then
    show.allocation_report_message = memx_options_memo_sbe_v1_3.prefs.show_allocation_report_message
    changed = true
  end
  if show.allocations_group ~= memx_options_memo_sbe_v1_3.prefs.show_allocations_group then
    show.allocations_group = memx_options_memo_sbe_v1_3.prefs.show_allocations_group
    changed = true
  end
  if show.allocations_groups ~= memx_options_memo_sbe_v1_3.prefs.show_allocations_groups then
    show.allocations_groups = memx_options_memo_sbe_v1_3.prefs.show_allocations_groups
    changed = true
  end
  if show.common_header ~= memx_options_memo_sbe_v1_3.prefs.show_common_header then
    show.common_header = memx_options_memo_sbe_v1_3.prefs.show_common_header
    changed = true
  end
  if show.exec_inst ~= memx_options_memo_sbe_v1_3.prefs.show_exec_inst then
    show.exec_inst = memx_options_memo_sbe_v1_3.prefs.show_exec_inst
    changed = true
  end
  if show.execution_report_bulk_quote_component_new_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_bulk_quote_component_new_message then
    show.execution_report_bulk_quote_component_new_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_bulk_quote_component_new_message
    changed = true
  end
  if show.execution_report_bulk_quote_pending_new_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_bulk_quote_pending_new_message then
    show.execution_report_bulk_quote_pending_new_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_bulk_quote_pending_new_message
    changed = true
  end
  if show.execution_report_canceled_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_canceled_message then
    show.execution_report_canceled_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_canceled_message
    changed = true
  end
  if show.execution_report_new_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_new_message then
    show.execution_report_new_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_new_message
    changed = true
  end
  if show.execution_report_pending_cancel_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_pending_cancel_message then
    show.execution_report_pending_cancel_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_pending_cancel_message
    changed = true
  end
  if show.execution_report_pending_replace_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_pending_replace_message then
    show.execution_report_pending_replace_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_pending_replace_message
    changed = true
  end
  if show.execution_report_rejected_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_rejected_message then
    show.execution_report_rejected_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_rejected_message
    changed = true
  end
  if show.execution_report_replaced_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_replaced_message then
    show.execution_report_replaced_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_replaced_message
    changed = true
  end
  if show.execution_report_restatement_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_restatement_message then
    show.execution_report_restatement_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_restatement_message
    changed = true
  end
  if show.execution_report_trade_break_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_trade_break_message then
    show.execution_report_trade_break_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_trade_break_message
    changed = true
  end
  if show.execution_report_trade_correction_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_trade_correction_message then
    show.execution_report_trade_correction_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_trade_correction_message
    changed = true
  end
  if show.execution_report_trade_message ~= memx_options_memo_sbe_v1_3.prefs.show_execution_report_trade_message then
    show.execution_report_trade_message = memx_options_memo_sbe_v1_3.prefs.show_execution_report_trade_message
    changed = true
  end
  if show.login_accepted_message ~= memx_options_memo_sbe_v1_3.prefs.show_login_accepted_message then
    show.login_accepted_message = memx_options_memo_sbe_v1_3.prefs.show_login_accepted_message
    changed = true
  end
  if show.login_rejected_message ~= memx_options_memo_sbe_v1_3.prefs.show_login_rejected_message then
    show.login_rejected_message = memx_options_memo_sbe_v1_3.prefs.show_login_rejected_message
    changed = true
  end
  if show.login_request_message ~= memx_options_memo_sbe_v1_3.prefs.show_login_request_message then
    show.login_request_message = memx_options_memo_sbe_v1_3.prefs.show_login_request_message
    changed = true
  end
  if show.long_one_sided_bulk_quote_message ~= memx_options_memo_sbe_v1_3.prefs.show_long_one_sided_bulk_quote_message then
    show.long_one_sided_bulk_quote_message = memx_options_memo_sbe_v1_3.prefs.show_long_one_sided_bulk_quote_message
    changed = true
  end
  if show.long_two_sided_bulk_quote_message ~= memx_options_memo_sbe_v1_3.prefs.show_long_two_sided_bulk_quote_message then
    show.long_two_sided_bulk_quote_message = memx_options_memo_sbe_v1_3.prefs.show_long_two_sided_bulk_quote_message
    changed = true
  end
  if show.mass_cancel_clear_lockout_done_message ~= memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_clear_lockout_done_message then
    show.mass_cancel_clear_lockout_done_message = memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_clear_lockout_done_message
    changed = true
  end
  if show.mass_cancel_clear_lockout_reject_message ~= memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_clear_lockout_reject_message then
    show.mass_cancel_clear_lockout_reject_message = memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_clear_lockout_reject_message
    changed = true
  end
  if show.mass_cancel_clear_lockout_request_message ~= memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_clear_lockout_request_message then
    show.mass_cancel_clear_lockout_request_message = memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_clear_lockout_request_message
    changed = true
  end
  if show.mass_cancel_done_message ~= memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_done_message then
    show.mass_cancel_done_message = memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_done_message
    changed = true
  end
  if show.mass_cancel_inst ~= memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_inst then
    show.mass_cancel_inst = memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_inst
    changed = true
  end
  if show.mass_cancel_reject_message ~= memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_reject_message then
    show.mass_cancel_reject_message = memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_reject_message
    changed = true
  end
  if show.mass_cancel_request_message ~= memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_request_message then
    show.mass_cancel_request_message = memx_options_memo_sbe_v1_3.prefs.show_mass_cancel_request_message
    changed = true
  end
  if show.new_order_single_message ~= memx_options_memo_sbe_v1_3.prefs.show_new_order_single_message then
    show.new_order_single_message = memx_options_memo_sbe_v1_3.prefs.show_new_order_single_message
    changed = true
  end
  if show.order_cancel_reject_message ~= memx_options_memo_sbe_v1_3.prefs.show_order_cancel_reject_message then
    show.order_cancel_reject_message = memx_options_memo_sbe_v1_3.prefs.show_order_cancel_reject_message
    changed = true
  end
  if show.order_cancel_replace_request_message ~= memx_options_memo_sbe_v1_3.prefs.show_order_cancel_replace_request_message then
    show.order_cancel_replace_request_message = memx_options_memo_sbe_v1_3.prefs.show_order_cancel_replace_request_message
    changed = true
  end
  if show.order_cancel_request_message ~= memx_options_memo_sbe_v1_3.prefs.show_order_cancel_request_message then
    show.order_cancel_request_message = memx_options_memo_sbe_v1_3.prefs.show_order_cancel_request_message
    changed = true
  end
  if show.packet ~= memx_options_memo_sbe_v1_3.prefs.show_packet then
    show.packet = memx_options_memo_sbe_v1_3.prefs.show_packet
    changed = true
  end
  if show.parties_group ~= memx_options_memo_sbe_v1_3.prefs.show_parties_group then
    show.parties_group = memx_options_memo_sbe_v1_3.prefs.show_parties_group
    changed = true
  end
  if show.parties_groups ~= memx_options_memo_sbe_v1_3.prefs.show_parties_groups then
    show.parties_groups = memx_options_memo_sbe_v1_3.prefs.show_parties_groups
    changed = true
  end
  if show.pending_mass_cancel_message ~= memx_options_memo_sbe_v1_3.prefs.show_pending_mass_cancel_message then
    show.pending_mass_cancel_message = memx_options_memo_sbe_v1_3.prefs.show_pending_mass_cancel_message
    changed = true
  end
  if show.quotes_group ~= memx_options_memo_sbe_v1_3.prefs.show_quotes_group then
    show.quotes_group = memx_options_memo_sbe_v1_3.prefs.show_quotes_group
    changed = true
  end
  if show.quotes_groups ~= memx_options_memo_sbe_v1_3.prefs.show_quotes_groups then
    show.quotes_groups = memx_options_memo_sbe_v1_3.prefs.show_quotes_groups
    changed = true
  end
  if show.repeating_group_dimensions ~= memx_options_memo_sbe_v1_3.prefs.show_repeating_group_dimensions then
    show.repeating_group_dimensions = memx_options_memo_sbe_v1_3.prefs.show_repeating_group_dimensions
    changed = true
  end
  if show.replay_all_request_message ~= memx_options_memo_sbe_v1_3.prefs.show_replay_all_request_message then
    show.replay_all_request_message = memx_options_memo_sbe_v1_3.prefs.show_replay_all_request_message
    changed = true
  end
  if show.replay_begin_message ~= memx_options_memo_sbe_v1_3.prefs.show_replay_begin_message then
    show.replay_begin_message = memx_options_memo_sbe_v1_3.prefs.show_replay_begin_message
    changed = true
  end
  if show.replay_complete_message ~= memx_options_memo_sbe_v1_3.prefs.show_replay_complete_message then
    show.replay_complete_message = memx_options_memo_sbe_v1_3.prefs.show_replay_complete_message
    changed = true
  end
  if show.replay_rejected_message ~= memx_options_memo_sbe_v1_3.prefs.show_replay_rejected_message then
    show.replay_rejected_message = memx_options_memo_sbe_v1_3.prefs.show_replay_rejected_message
    changed = true
  end
  if show.replay_request_message ~= memx_options_memo_sbe_v1_3.prefs.show_replay_request_message then
    show.replay_request_message = memx_options_memo_sbe_v1_3.prefs.show_replay_request_message
    changed = true
  end
  if show.sbe_header ~= memx_options_memo_sbe_v1_3.prefs.show_sbe_header then
    show.sbe_header = memx_options_memo_sbe_v1_3.prefs.show_sbe_header
    changed = true
  end
  if show.sbe_message ~= memx_options_memo_sbe_v1_3.prefs.show_sbe_message then
    show.sbe_message = memx_options_memo_sbe_v1_3.prefs.show_sbe_message
    changed = true
  end
  if show.sequenced_message ~= memx_options_memo_sbe_v1_3.prefs.show_sequenced_message then
    show.sequenced_message = memx_options_memo_sbe_v1_3.prefs.show_sequenced_message
    changed = true
  end
  if show.short_one_sided_bulk_quote_message ~= memx_options_memo_sbe_v1_3.prefs.show_short_one_sided_bulk_quote_message then
    show.short_one_sided_bulk_quote_message = memx_options_memo_sbe_v1_3.prefs.show_short_one_sided_bulk_quote_message
    changed = true
  end
  if show.short_two_sided_bulk_quote_message ~= memx_options_memo_sbe_v1_3.prefs.show_short_two_sided_bulk_quote_message then
    show.short_two_sided_bulk_quote_message = memx_options_memo_sbe_v1_3.prefs.show_short_two_sided_bulk_quote_message
    changed = true
  end
  if show.start_of_session_message ~= memx_options_memo_sbe_v1_3.prefs.show_start_of_session_message then
    show.start_of_session_message = memx_options_memo_sbe_v1_3.prefs.show_start_of_session_message
    changed = true
  end
  if show.stream_begin_message ~= memx_options_memo_sbe_v1_3.prefs.show_stream_begin_message then
    show.stream_begin_message = memx_options_memo_sbe_v1_3.prefs.show_stream_begin_message
    changed = true
  end
  if show.stream_complete_message ~= memx_options_memo_sbe_v1_3.prefs.show_stream_complete_message then
    show.stream_complete_message = memx_options_memo_sbe_v1_3.prefs.show_stream_complete_message
    changed = true
  end
  if show.stream_rejected_message ~= memx_options_memo_sbe_v1_3.prefs.show_stream_rejected_message then
    show.stream_rejected_message = memx_options_memo_sbe_v1_3.prefs.show_stream_rejected_message
    changed = true
  end
  if show.stream_request_message ~= memx_options_memo_sbe_v1_3.prefs.show_stream_request_message then
    show.stream_request_message = memx_options_memo_sbe_v1_3.prefs.show_stream_request_message
    changed = true
  end
  if show.unsequenced_message ~= memx_options_memo_sbe_v1_3.prefs.show_unsequenced_message then
    show.unsequenced_message = memx_options_memo_sbe_v1_3.prefs.show_unsequenced_message
    changed = true
  end
  if show.user_notification_message ~= memx_options_memo_sbe_v1_3.prefs.show_user_notification_message then
    show.user_notification_message = memx_options_memo_sbe_v1_3.prefs.show_user_notification_message
    changed = true
  end
  if show.data ~= memx_options_memo_sbe_v1_3.prefs.show_data then
    show.data = memx_options_memo_sbe_v1_3.prefs.show_data
    changed = true
  end
  if show.payload ~= memx_options_memo_sbe_v1_3.prefs.show_payload then
    show.payload = memx_options_memo_sbe_v1_3.prefs.show_payload
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Memx Options Memo Sbe 1.3
-----------------------------------------------------------------------

-- Size: Sending Time
memx_options_memo_sbe_v1_3_size_of.sending_time = 1

-- Display: Sending Time
memx_options_memo_sbe_v1_3_display.sending_time = function(value)
  return "Sending Time: "..value
end

-- Dissect: Sending Time
memx_options_memo_sbe_v1_3_dissect.sending_time = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.sending_time
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.sending_time(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.sending_time, range, value, display)

  return offset + length, value
end

-- Size: Lockout Id
memx_options_memo_sbe_v1_3_size_of.lockout_id = 8

-- Display: Lockout Id
memx_options_memo_sbe_v1_3_display.lockout_id = function(value)
  -- Check if field has value
  if value == UInt64(0xFFFFFFFF, 0xFFFFFFFF) then
    return "Lockout Id: No Value"
  end

  return "Lockout Id: "..value
end

-- Dissect: Lockout Id
memx_options_memo_sbe_v1_3_dissect.lockout_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.lockout_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.lockout_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.lockout_id, range, value, display)

  return offset + length, value
end

-- Size: Cl Ord Id
memx_options_memo_sbe_v1_3_size_of.cl_ord_id = 20

-- Display: Cl Ord Id
memx_options_memo_sbe_v1_3_display.cl_ord_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Cl Ord Id: No Value"
  end

  return "Cl Ord Id: "..value
end

-- Dissect: Cl Ord Id
memx_options_memo_sbe_v1_3_dissect.cl_ord_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.cl_ord_id
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.cl_ord_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.cl_ord_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Mass Cancel Clear Lockout Done Message
memx_options_memo_sbe_v1_3_size_of.mass_cancel_clear_lockout_done_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.lockout_id

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Mass Cancel Clear Lockout Done Message
memx_options_memo_sbe_v1_3_display.mass_cancel_clear_lockout_done_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Mass Cancel Clear Lockout Done Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_done_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Lockout Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, lockout_id = memx_options_memo_sbe_v1_3_dissect.lockout_id(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Mass Cancel Clear Lockout Done Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_done_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.mass_cancel_clear_lockout_done_message then
    local length = memx_options_memo_sbe_v1_3_size_of.mass_cancel_clear_lockout_done_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.mass_cancel_clear_lockout_done_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.mass_cancel_clear_lockout_done_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_done_message_fields(buffer, offset, packet, parent)
end

-- Size: Rej Reason
memx_options_memo_sbe_v1_3_size_of.rej_reason = 2

-- Display: Rej Reason
memx_options_memo_sbe_v1_3_display.rej_reason = function(value)
  if value == 0 then
    return "Rej Reason: Other (0)"
  end
  if value == 1 then
    return "Rej Reason: Missing Cl Ord Id (1)"
  end
  if value == 2 then
    return "Rej Reason: Invalid Cl Ord Id (2)"
  end
  if value == 3 then
    return "Rej Reason: Missing Lockout Id (3)"
  end
  if value == 4 then
    return "Rej Reason: Invalid Lockout Id (4)"
  end
  if value == 65535 then
    return "Rej Reason: Null Value (65535)"
  end

  return "Rej Reason: Unknown("..value..")"
end

-- Dissect: Rej Reason
memx_options_memo_sbe_v1_3_dissect.rej_reason = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.rej_reason
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.rej_reason(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.rej_reason, range, value, display)

  return offset + length, value
end

-- Calculate size of: Mass Cancel Clear Lockout Reject Message
memx_options_memo_sbe_v1_3_size_of.mass_cancel_clear_lockout_reject_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.lockout_id

  index = index + memx_options_memo_sbe_v1_3_size_of.rej_reason

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Mass Cancel Clear Lockout Reject Message
memx_options_memo_sbe_v1_3_display.mass_cancel_clear_lockout_reject_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Mass Cancel Clear Lockout Reject Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_reject_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Lockout Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, lockout_id = memx_options_memo_sbe_v1_3_dissect.lockout_id(buffer, index, packet, parent)

  -- Rej Reason: 2 Byte Unsigned Fixed Width Integer Enum with 6 values
  index, rej_reason = memx_options_memo_sbe_v1_3_dissect.rej_reason(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Mass Cancel Clear Lockout Reject Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_reject_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.mass_cancel_clear_lockout_reject_message then
    local length = memx_options_memo_sbe_v1_3_size_of.mass_cancel_clear_lockout_reject_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.mass_cancel_clear_lockout_reject_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.mass_cancel_clear_lockout_reject_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_reject_message_fields(buffer, offset, packet, parent)
end

-- Size: User Status
memx_options_memo_sbe_v1_3_size_of.user_status = 1

-- Display: User Status
memx_options_memo_sbe_v1_3_display.user_status = function(value)
  if value == 8 then
    return "User Status: Session Shutdown Warning (8)"
  end
  if value == 100 then
    return "User Status: End Of Events For Session (100)"
  end
  if value == 255 then
    return "User Status: Null Value (255)"
  end

  return "User Status: Unknown("..value..")"
end

-- Dissect: User Status
memx_options_memo_sbe_v1_3_dissect.user_status = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.user_status
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.user_status(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.user_status, range, value, display)

  return offset + length, value
end

-- Calculate size of: User Notification Message
memx_options_memo_sbe_v1_3_size_of.user_notification_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.user_status

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: User Notification Message
memx_options_memo_sbe_v1_3_display.user_notification_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: User Notification Message
memx_options_memo_sbe_v1_3_dissect.user_notification_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- User Status: 1 Byte Unsigned Fixed Width Integer Enum with 3 values
  index, user_status = memx_options_memo_sbe_v1_3_dissect.user_status(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: User Notification Message
memx_options_memo_sbe_v1_3_dissect.user_notification_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.user_notification_message then
    local length = memx_options_memo_sbe_v1_3_size_of.user_notification_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.user_notification_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.user_notification_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.user_notification_message_fields(buffer, offset, packet, parent)
end

-- Size: Open Or Close
memx_options_memo_sbe_v1_3_size_of.open_or_close = 1

-- Display: Open Or Close
memx_options_memo_sbe_v1_3_display.open_or_close = function(value)
  if value == "O" then
    return "Open Or Close: Open (O)"
  end
  if value == "C" then
    return "Open Or Close: Close (C)"
  end
  if value == "0" then
    return "Open Or Close: Null Value (0)"
  end
  if value == 0 then
    return "Open Or Close: No Value"
  end

  return "Open Or Close: Unknown("..value..")"
end

-- Dissect: Open Or Close
memx_options_memo_sbe_v1_3_dissect.open_or_close = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.open_or_close
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.open_or_close(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.open_or_close, range, value, display)

  return offset + length, value
end

-- Size: Trading Capacity
memx_options_memo_sbe_v1_3_size_of.trading_capacity = 1

-- Display: Trading Capacity
memx_options_memo_sbe_v1_3_display.trading_capacity = function(value)
  if value == 1 then
    return "Trading Capacity: Customer (1)"
  end
  if value == 2 then
    return "Trading Capacity: Professional Customer (2)"
  end
  if value == 3 then
    return "Trading Capacity: Broker Dealer (3)"
  end
  if value == 4 then
    return "Trading Capacity: Broker Dealer Customer (4)"
  end
  if value == 5 then
    return "Trading Capacity: Firm (5)"
  end
  if value == 6 then
    return "Trading Capacity: Market Maker (6)"
  end
  if value == 7 then
    return "Trading Capacity: Away Market Maker (7)"
  end
  if value == 255 then
    return "Trading Capacity: Null Value (255)"
  end

  return "Trading Capacity: Unknown("..value..")"
end

-- Dissect: Trading Capacity
memx_options_memo_sbe_v1_3_dissect.trading_capacity = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.trading_capacity
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.trading_capacity(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.trading_capacity, range, value, display)

  return offset + length, value
end

-- Size: Alloc Qty
memx_options_memo_sbe_v1_3_size_of.alloc_qty = 4

-- Display: Alloc Qty
memx_options_memo_sbe_v1_3_display.alloc_qty = function(value)
  return "Alloc Qty: "..value
end

-- Dissect: Alloc Qty
memx_options_memo_sbe_v1_3_dissect.alloc_qty = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.alloc_qty
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.alloc_qty(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.alloc_qty, range, value, display)

  return offset + length, value
end

-- Calculate size of: Allocations Group
memx_options_memo_sbe_v1_3_size_of.allocations_group = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.open_or_close

  return index
end

-- Display: Allocations Group
memx_options_memo_sbe_v1_3_display.allocations_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Allocations Group
memx_options_memo_sbe_v1_3_dissect.allocations_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Alloc Qty: 4 Byte Unsigned Fixed Width Integer
  index, alloc_qty = memx_options_memo_sbe_v1_3_dissect.alloc_qty(buffer, index, packet, parent)

  -- Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, trading_capacity = memx_options_memo_sbe_v1_3_dissect.trading_capacity(buffer, index, packet, parent)

  -- Open Or Close: 1 Byte Ascii String Enum with 4 values
  index, open_or_close = memx_options_memo_sbe_v1_3_dissect.open_or_close(buffer, index, packet, parent)

  return index
end

-- Dissect: Allocations Group
memx_options_memo_sbe_v1_3_dissect.allocations_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.allocations_group then
    local length = memx_options_memo_sbe_v1_3_size_of.allocations_group(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.allocations_group(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.allocations_group, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.allocations_group_fields(buffer, offset, packet, parent)
end

-- Size: Num In Group
memx_options_memo_sbe_v1_3_size_of.num_in_group = 1

-- Display: Num In Group
memx_options_memo_sbe_v1_3_display.num_in_group = function(value)
  return "Num In Group: "..value
end

-- Dissect: Num In Group
memx_options_memo_sbe_v1_3_dissect.num_in_group = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.num_in_group
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.num_in_group(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.num_in_group, range, value, display)

  return offset + length, value
end

-- Size: Block Length uint 8
memx_options_memo_sbe_v1_3_size_of.block_length_uint_8 = 1

-- Display: Block Length uint 8
memx_options_memo_sbe_v1_3_display.block_length_uint_8 = function(value)
  return "Block Length uint 8: "..value
end

-- Dissect: Block Length uint 8
memx_options_memo_sbe_v1_3_dissect.block_length_uint_8 = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.block_length_uint_8
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.block_length_uint_8(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.block_length_uint_8, range, value, display)

  return offset + length, value
end

-- Calculate size of: Repeating Group Dimensions
memx_options_memo_sbe_v1_3_size_of.repeating_group_dimensions = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.block_length_uint_8

  index = index + memx_options_memo_sbe_v1_3_size_of.num_in_group

  return index
end

-- Display: Repeating Group Dimensions
memx_options_memo_sbe_v1_3_display.repeating_group_dimensions = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Repeating Group Dimensions
memx_options_memo_sbe_v1_3_dissect.repeating_group_dimensions_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Block Length uint 8: 1 Byte Unsigned Fixed Width Integer
  index, block_length_uint_8 = memx_options_memo_sbe_v1_3_dissect.block_length_uint_8(buffer, index, packet, parent)

  -- Num In Group: 1 Byte Unsigned Fixed Width Integer
  index, num_in_group = memx_options_memo_sbe_v1_3_dissect.num_in_group(buffer, index, packet, parent)

  return index
end

-- Dissect: Repeating Group Dimensions
memx_options_memo_sbe_v1_3_dissect.repeating_group_dimensions = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.repeating_group_dimensions then
    local length = memx_options_memo_sbe_v1_3_size_of.repeating_group_dimensions(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.repeating_group_dimensions(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.repeating_group_dimensions, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.repeating_group_dimensions_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Allocations Groups
memx_options_memo_sbe_v1_3_size_of.allocations_groups = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.repeating_group_dimensions(buffer, offset + index)

  -- Calculate field size from count
  local allocations_group_count = buffer(offset + index - 1, 1):uint()
  index = index + allocations_group_count * 6

  return index
end

-- Display: Allocations Groups
memx_options_memo_sbe_v1_3_display.allocations_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Allocations Groups
memx_options_memo_sbe_v1_3_dissect.allocations_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Repeating Group Dimensions: Struct of 2 fields
  index, repeating_group_dimensions = memx_options_memo_sbe_v1_3_dissect.repeating_group_dimensions(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):uint()

  -- Allocations Group: Struct of 3 fields
  for i = 1, num_in_group do
    index = memx_options_memo_sbe_v1_3_dissect.allocations_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Allocations Groups
memx_options_memo_sbe_v1_3_dissect.allocations_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.allocations_groups then
    local length = memx_options_memo_sbe_v1_3_size_of.allocations_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.allocations_groups(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.allocations_groups, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.allocations_groups_fields(buffer, offset, packet, parent)
end

-- Size: Trade Date
memx_options_memo_sbe_v1_3_size_of.trade_date = 8

-- Display: Trade Date
memx_options_memo_sbe_v1_3_display.trade_date = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Trade Date: No Value"
  end

  return "Trade Date: "..value
end

-- Dissect: Trade Date
memx_options_memo_sbe_v1_3_dissect.trade_date = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.trade_date
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.trade_date(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.trade_date, range, value, display)

  return offset + length, value
end

-- Size: Quantity uint 32
memx_options_memo_sbe_v1_3_size_of.quantity_uint_32 = 4

-- Display: Quantity uint 32
memx_options_memo_sbe_v1_3_display.quantity_uint_32 = function(value)
  return "Quantity uint 32: "..value
end

-- Dissect: Quantity uint 32
memx_options_memo_sbe_v1_3_dissect.quantity_uint_32 = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.quantity_uint_32
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.quantity_uint_32(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.quantity_uint_32, range, value, display)

  return offset + length, value
end

-- Size: Side
memx_options_memo_sbe_v1_3_size_of.side = 1

-- Display: Side
memx_options_memo_sbe_v1_3_display.side = function(value)
  if value == "1" then
    return "Side: Buy (1)"
  end
  if value == "2" then
    return "Side: Sell (2)"
  end
  if value == "B" then
    return "Side: As Defined (B)"
  end
  if value == 0 then
    return "Side: No Value"
  end

  return "Side: Unknown("..value..")"
end

-- Dissect: Side
memx_options_memo_sbe_v1_3_dissect.side = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.side
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.side(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.side, range, value, display)

  return offset + length, value
end

-- Size: Options Security Id
memx_options_memo_sbe_v1_3_size_of.options_security_id = 8

-- Display: Options Security Id
memx_options_memo_sbe_v1_3_display.options_security_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Options Security Id: No Value"
  end

  return "Options Security Id: "..value
end

-- Dissect: Options Security Id
memx_options_memo_sbe_v1_3_dissect.options_security_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.options_security_id
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.options_security_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.options_security_id, range, value, display)

  return offset + length, value
end

-- Size: Trd Match Id
memx_options_memo_sbe_v1_3_size_of.trd_match_id = 8

-- Display: Trd Match Id
memx_options_memo_sbe_v1_3_display.trd_match_id = function(value)
  return "Trd Match Id: "..value
end

-- Dissect: Trd Match Id
memx_options_memo_sbe_v1_3_dissect.trd_match_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.trd_match_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.trd_match_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.trd_match_id, range, value, display)

  return offset + length, value
end

-- Size: Exec Ref Id
memx_options_memo_sbe_v1_3_size_of.exec_ref_id = 8

-- Display: Exec Ref Id
memx_options_memo_sbe_v1_3_display.exec_ref_id = function(value)
  -- Check if field has value
  if value == UInt64(0xFFFFFFFF, 0xFFFFFFFF) then
    return "Exec Ref Id: No Value"
  end

  return "Exec Ref Id: "..value
end

-- Dissect: Exec Ref Id
memx_options_memo_sbe_v1_3_dissect.exec_ref_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.exec_ref_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.exec_ref_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.exec_ref_id, range, value, display)

  return offset + length, value
end

-- Size: Alloc Status
memx_options_memo_sbe_v1_3_size_of.alloc_status = 1

-- Display: Alloc Status
memx_options_memo_sbe_v1_3_display.alloc_status = function(value)
  if value == 0 then
    return "Alloc Status: Accepted (0)"
  end
  if value == 1 then
    return "Alloc Status: Block Level Reject (1)"
  end
  if value == 2 then
    return "Alloc Status: Account Level Reject (2)"
  end
  if value == 255 then
    return "Alloc Status: Null Value (255)"
  end

  return "Alloc Status: Unknown("..value..")"
end

-- Dissect: Alloc Status
memx_options_memo_sbe_v1_3_dissect.alloc_status = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.alloc_status
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.alloc_status(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.alloc_status, range, value, display)

  return offset + length, value
end

-- Size: Alloc Type
memx_options_memo_sbe_v1_3_size_of.alloc_type = 1

-- Display: Alloc Type
memx_options_memo_sbe_v1_3_display.alloc_type = function(value)
  if value == 100 then
    return "Alloc Type: Post Trade Edit (100)"
  end
  if value == 255 then
    return "Alloc Type: Null Value (255)"
  end

  return "Alloc Type: Unknown("..value..")"
end

-- Dissect: Alloc Type
memx_options_memo_sbe_v1_3_dissect.alloc_type = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.alloc_type
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.alloc_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.alloc_type, range, value, display)

  return offset + length, value
end

-- Size: Alloc Trans Type
memx_options_memo_sbe_v1_3_size_of.alloc_trans_type = 1

-- Display: Alloc Trans Type
memx_options_memo_sbe_v1_3_display.alloc_trans_type = function(value)
  if value == 0 then
    return "Alloc Trans Type: New (0)"
  end
  if value == 1 then
    return "Alloc Trans Type: Replace (1)"
  end
  if value == 255 then
    return "Alloc Trans Type: Null Value (255)"
  end

  return "Alloc Trans Type: Unknown("..value..")"
end

-- Dissect: Alloc Trans Type
memx_options_memo_sbe_v1_3_dissect.alloc_trans_type = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.alloc_trans_type
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.alloc_trans_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.alloc_trans_type, range, value, display)

  return offset + length, value
end

-- Size: Alloc Id
memx_options_memo_sbe_v1_3_size_of.alloc_id = 20

-- Display: Alloc Id
memx_options_memo_sbe_v1_3_display.alloc_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Alloc Id: No Value"
  end

  return "Alloc Id: "..value
end

-- Dissect: Alloc Id
memx_options_memo_sbe_v1_3_dissect.alloc_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.alloc_id
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.alloc_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.alloc_id, range, value, display)

  return offset + length, value
end

-- Size: Alloc Report Id
memx_options_memo_sbe_v1_3_size_of.alloc_report_id = 8

-- Display: Alloc Report Id
memx_options_memo_sbe_v1_3_display.alloc_report_id = function(value)
  return "Alloc Report Id: "..value
end

-- Dissect: Alloc Report Id
memx_options_memo_sbe_v1_3_dissect.alloc_report_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.alloc_report_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.alloc_report_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.alloc_report_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Allocation Report Message
memx_options_memo_sbe_v1_3_size_of.allocation_report_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_report_id

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_id

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_trans_type

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_type

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_status

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_ref_id

  index = index + memx_options_memo_sbe_v1_3_size_of.trd_match_id

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.quantity_uint_32

  index = index + memx_options_memo_sbe_v1_3_size_of.trade_date

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  index = index + memx_options_memo_sbe_v1_3_size_of.allocations_groups(buffer, offset + index)

  return index
end

-- Display: Allocation Report Message
memx_options_memo_sbe_v1_3_display.allocation_report_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Allocation Report Message
memx_options_memo_sbe_v1_3_dissect.allocation_report_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Alloc Report Id: 8 Byte Unsigned Fixed Width Integer
  index, alloc_report_id = memx_options_memo_sbe_v1_3_dissect.alloc_report_id(buffer, index, packet, parent)

  -- Alloc Id: 20 Byte Ascii String
  index, alloc_id = memx_options_memo_sbe_v1_3_dissect.alloc_id(buffer, index, packet, parent)

  -- Alloc Trans Type: 1 Byte Unsigned Fixed Width Integer Enum with 3 values
  index, alloc_trans_type = memx_options_memo_sbe_v1_3_dissect.alloc_trans_type(buffer, index, packet, parent)

  -- Alloc Type: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, alloc_type = memx_options_memo_sbe_v1_3_dissect.alloc_type(buffer, index, packet, parent)

  -- Alloc Status: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, alloc_status = memx_options_memo_sbe_v1_3_dissect.alloc_status(buffer, index, packet, parent)

  -- Exec Ref Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, exec_ref_id = memx_options_memo_sbe_v1_3_dissect.exec_ref_id(buffer, index, packet, parent)

  -- Trd Match Id: 8 Byte Unsigned Fixed Width Integer
  index, trd_match_id = memx_options_memo_sbe_v1_3_dissect.trd_match_id(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Quantity uint 32: 4 Byte Unsigned Fixed Width Integer
  index, quantity_uint_32 = memx_options_memo_sbe_v1_3_dissect.quantity_uint_32(buffer, index, packet, parent)

  -- Trade Date: 8 Byte Ascii String
  index, trade_date = memx_options_memo_sbe_v1_3_dissect.trade_date(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  -- Allocations Groups: Struct of 2 fields
  index, allocations_groups = memx_options_memo_sbe_v1_3_dissect.allocations_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Allocation Report Message
memx_options_memo_sbe_v1_3_dissect.allocation_report_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.allocation_report_message then
    local length = memx_options_memo_sbe_v1_3_size_of.allocation_report_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.allocation_report_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.allocation_report_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.allocation_report_message_fields(buffer, offset, packet, parent)
end

-- Size: Alloc Rej Code
memx_options_memo_sbe_v1_3_size_of.alloc_rej_code = 2

-- Display: Alloc Rej Code
memx_options_memo_sbe_v1_3_display.alloc_rej_code = function(value)
  if value == 1 then
    return "Alloc Rej Code: Incorrect Quantity (1)"
  end
  if value == 8 then
    return "Alloc Rej Code: Incorrect Allocated Quantity (8)"
  end
  if value == 10 then
    return "Alloc Rej Code: Unknown Or Stale Exec Id (10)"
  end
  if value == 11 then
    return "Alloc Rej Code: Mismatched Data (11)"
  end
  if value == 14 then
    return "Alloc Rej Code: Duplicate Or Missing Individual Alloc Id (14)"
  end
  if value == 15 then
    return "Alloc Rej Code: Trade Not Recognized (15)"
  end
  if value == 16 then
    return "Alloc Rej Code: Duplicate Trade (16)"
  end
  if value == 17 then
    return "Alloc Rej Code: Incorrect Or Missing Instrument (17)"
  end
  if value == 23 then
    return "Alloc Rej Code: Unknown Or Missing Party (23)"
  end
  if value == 24 then
    return "Alloc Rej Code: Incorrect Or Missing Side (24)"
  end
  if value == 26 then
    return "Alloc Rej Code: Incorrect Or Missing Trade Date (26)"
  end
  if value == 27 then
    return "Alloc Rej Code: Missing Trading Capacity (27)"
  end
  if value == 28 then
    return "Alloc Rej Code: Invalid Trading Capacity (28)"
  end
  if value == 29 then
    return "Alloc Rej Code: Missing Open Or Close Type (29)"
  end
  if value == 30 then
    return "Alloc Rej Code: Invalid Open Or Close Type (30)"
  end
  if value == 99 then
    return "Alloc Rej Code: Other (99)"
  end
  if value == 65535 then
    return "Alloc Rej Code: Null Value (65535)"
  end

  return "Alloc Rej Code: Unknown("..value..")"
end

-- Dissect: Alloc Rej Code
memx_options_memo_sbe_v1_3_dissect.alloc_rej_code = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.alloc_rej_code
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.alloc_rej_code(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.alloc_rej_code, range, value, display)

  return offset + length, value
end

-- Calculate size of: Allocation Instruction Ack Message
memx_options_memo_sbe_v1_3_size_of.allocation_instruction_ack_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_report_id

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_id

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_status

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_rej_code

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Allocation Instruction Ack Message
memx_options_memo_sbe_v1_3_display.allocation_instruction_ack_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Allocation Instruction Ack Message
memx_options_memo_sbe_v1_3_dissect.allocation_instruction_ack_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Alloc Report Id: 8 Byte Unsigned Fixed Width Integer
  index, alloc_report_id = memx_options_memo_sbe_v1_3_dissect.alloc_report_id(buffer, index, packet, parent)

  -- Alloc Id: 20 Byte Ascii String
  index, alloc_id = memx_options_memo_sbe_v1_3_dissect.alloc_id(buffer, index, packet, parent)

  -- Alloc Status: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, alloc_status = memx_options_memo_sbe_v1_3_dissect.alloc_status(buffer, index, packet, parent)

  -- Alloc Rej Code: 2 Byte Unsigned Fixed Width Integer Enum with 17 values
  index, alloc_rej_code = memx_options_memo_sbe_v1_3_dissect.alloc_rej_code(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Allocation Instruction Ack Message
memx_options_memo_sbe_v1_3_dissect.allocation_instruction_ack_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.allocation_instruction_ack_message then
    local length = memx_options_memo_sbe_v1_3_size_of.allocation_instruction_ack_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.allocation_instruction_ack_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.allocation_instruction_ack_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.allocation_instruction_ack_message_fields(buffer, offset, packet, parent)
end

-- Size: Cxl Rej Reason
memx_options_memo_sbe_v1_3_size_of.cxl_rej_reason = 2

-- Display: Cxl Rej Reason
memx_options_memo_sbe_v1_3_display.cxl_rej_reason = function(value)
  if value == 0 then
    return "Cxl Rej Reason: Too Late To Cancel (0)"
  end
  if value == 1 then
    return "Cxl Rej Reason: Unknown Order (1)"
  end
  if value == 3 then
    return "Cxl Rej Reason: Order Already Pending Cancel Or Replace (3)"
  end
  if value == 6 then
    return "Cxl Rej Reason: Duplicate Cl Ord Id (6)"
  end
  if value == 8 then
    return "Cxl Rej Reason: Price Exceeds Current Price Band (8)"
  end
  if value == 18 then
    return "Cxl Rej Reason: Invalid Price Increment (18)"
  end
  if value == 99 then
    return "Cxl Rej Reason: Other (99)"
  end
  if value == 100 then
    return "Cxl Rej Reason: Missing Symbol (100)"
  end
  if value == 101 then
    return "Cxl Rej Reason: Invalid Symbol (101)"
  end
  if value == 102 then
    return "Cxl Rej Reason: Missing Cl Ord Id (102)"
  end
  if value == 103 then
    return "Cxl Rej Reason: Invalid Cl Ord Id (103)"
  end
  if value == 104 then
    return "Cxl Rej Reason: Missing Side (104)"
  end
  if value == 105 then
    return "Cxl Rej Reason: Invalid Side (105)"
  end
  if value == 106 then
    return "Cxl Rej Reason: Missing Order Qty (106)"
  end
  if value == 107 then
    return "Cxl Rej Reason: Invalid Order Qty (107)"
  end
  if value == 108 then
    return "Cxl Rej Reason: Missing Order Type (108)"
  end
  if value == 109 then
    return "Cxl Rej Reason: Invalid Order Type (109)"
  end
  if value == 110 then
    return "Cxl Rej Reason: Missing Limit Price (110)"
  end
  if value == 111 then
    return "Cxl Rej Reason: Invalid Limit Price (111)"
  end
  if value == 114 then
    return "Cxl Rej Reason: Missing List Seq No (114)"
  end
  if value == 115 then
    return "Cxl Rej Reason: Invalid List Seq No (115)"
  end
  if value == 116 then
    return "Cxl Rej Reason: Missing Orig Cl Ord Id (116)"
  end
  if value == 117 then
    return "Cxl Rej Reason: Invalid Orig Cl Ord Id (117)"
  end
  if value == 118 then
    return "Cxl Rej Reason: Missing Order Id (118)"
  end
  if value == 119 then
    return "Cxl Rej Reason: Invalid Order Id (119)"
  end
  if value == 200 then
    return "Cxl Rej Reason: Halted (200)"
  end
  if value == 201 then
    return "Cxl Rej Reason: Firm Disabled (201)"
  end
  if value == 202 then
    return "Cxl Rej Reason: Efid Disabled (202)"
  end
  if value == 203 then
    return "Cxl Rej Reason: Account Disabled (203)"
  end
  if value == 204 then
    return "Cxl Rej Reason: Unsupported Ord Type Change (204)"
  end
  if value == 205 then
    return "Cxl Rej Reason: Unsupported Side Change (205)"
  end
  if value == 206 then
    return "Cxl Rej Reason: Symbol Mismatch (206)"
  end
  if value == 207 then
    return "Cxl Rej Reason: Orig Order Id Mismatch (207)"
  end
  if value == 300 then
    return "Cxl Rej Reason: Non Test Symbols Blocked (300)"
  end
  if value == 301 then
    return "Cxl Rej Reason: Notional Value Exceeds Threshold (301)"
  end
  if value == 302 then
    return "Cxl Rej Reason: Max Notional Value Per Order Risk Rule Violated (302)"
  end
  if value == 303 then
    return "Cxl Rej Reason: Block Non Test Symbol Risk Rule Violated (303)"
  end
  if value == 304 then
    return "Cxl Rej Reason: Max Contracts Per Order Risk Rule Violated (304)"
  end
  if value == 305 then
    return "Cxl Rej Reason: Nbbo Width Exceeds Threshold (305)"
  end
  if value == 306 then
    return "Cxl Rej Reason: Exchange Price Value Collar Risk Rule Violated (306)"
  end
  if value == 307 then
    return "Cxl Rej Reason: Execution Price Higher Than Strike Price (307)"
  end
  if value == 308 then
    return "Cxl Rej Reason: Market Buy When Nbo Is Zero (308)"
  end
  if value == 309 then
    return "Cxl Rej Reason: Market Sell When Nbb Greater Than Threshold (309)"
  end
  if value == 310 then
    return "Cxl Rej Reason: Quote Price Outside Exchange Threshold (310)"
  end
  if value == 312 then
    return "Cxl Rej Reason: Num Contracts Executed Exceeds Threshold (312)"
  end
  if value == 313 then
    return "Cxl Rej Reason: Notional Value Of Executions Exceeds Threshold (313)"
  end
  if value == 314 then
    return "Cxl Rej Reason: Count Of Executions Exceeds Threshold (314)"
  end
  if value == 315 then
    return "Cxl Rej Reason: Outstanding Percentage Threshold Exceeded (315)"
  end
  if value == 316 then
    return "Cxl Rej Reason: Trips Threshold Exceeded (316)"
  end
  if value == 317 then
    return "Cxl Rej Reason: Iso Orders Not Allowed (317)"
  end
  if value == 318 then
    return "Cxl Rej Reason: Market Is Crossed (318)"
  end
  if value == 319 then
    return "Cxl Rej Reason: Active Risk Breach (319)"
  end
  if value == 320 then
    return "Cxl Rej Reason: Manual Risk Breach (320)"
  end
  if value == 321 then
    return "Cxl Rej Reason: Gross Notional Value Exceeds Threshold (321)"
  end
  if value == 322 then
    return "Cxl Rej Reason: Net Notional Value Exceeds Threshold (322)"
  end
  if value == 323 then
    return "Cxl Rej Reason: Duplicate Order Threshold Exceeded (323)"
  end
  if value == 324 then
    return "Cxl Rej Reason: Order Rate Threshold Exceeded (324)"
  end
  if value == 325 then
    return "Cxl Rej Reason: Mass Cancel Lockout In Effect (325)"
  end
  if value == 326 then
    return "Cxl Rej Reason: Market Order Gross Notional Value Exceeds Threshold (326)"
  end
  if value == 327 then
    return "Cxl Rej Reason: Market Order Net Notional Value Exceeds Threshold (327)"
  end
  if value == 65535 then
    return "Cxl Rej Reason: Null Value (65535)"
  end

  return "Cxl Rej Reason: Unknown("..value..")"
end

-- Dissect: Cxl Rej Reason
memx_options_memo_sbe_v1_3_dissect.cxl_rej_reason = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.cxl_rej_reason
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.cxl_rej_reason(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.cxl_rej_reason, range, value, display)

  return offset + length, value
end

-- Size: Cxl Rej Response To
memx_options_memo_sbe_v1_3_size_of.cxl_rej_response_to = 1

-- Display: Cxl Rej Response To
memx_options_memo_sbe_v1_3_display.cxl_rej_response_to = function(value)
  if value == "1" then
    return "Cxl Rej Response To: Order Cancel Request (1)"
  end
  if value == "2" then
    return "Cxl Rej Response To: Order Cancel Replace Request (2)"
  end

  return "Cxl Rej Response To: Unknown("..value..")"
end

-- Dissect: Cxl Rej Response To
memx_options_memo_sbe_v1_3_dissect.cxl_rej_response_to = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.cxl_rej_response_to
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.cxl_rej_response_to(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.cxl_rej_response_to, range, value, display)

  return offset + length, value
end

-- Size: List Seq No
memx_options_memo_sbe_v1_3_size_of.list_seq_no = 1

-- Display: List Seq No
memx_options_memo_sbe_v1_3_display.list_seq_no = function(value)
  return "List Seq No: "..value
end

-- Dissect: List Seq No
memx_options_memo_sbe_v1_3_dissect.list_seq_no = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.list_seq_no
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.list_seq_no(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.list_seq_no, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Cancel Reject Message
memx_options_memo_sbe_v1_3_size_of.order_cancel_reject_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.cxl_rej_response_to

  index = index + memx_options_memo_sbe_v1_3_size_of.cxl_rej_reason

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Order Cancel Reject Message
memx_options_memo_sbe_v1_3_display.order_cancel_reject_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Cancel Reject Message
memx_options_memo_sbe_v1_3_dissect.order_cancel_reject_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Cxl Rej Response To: 1 Byte Ascii String Enum with 2 values
  index, cxl_rej_response_to = memx_options_memo_sbe_v1_3_dissect.cxl_rej_response_to(buffer, index, packet, parent)

  -- Cxl Rej Reason: 2 Byte Unsigned Fixed Width Integer Enum with 61 values
  index, cxl_rej_reason = memx_options_memo_sbe_v1_3_dissect.cxl_rej_reason(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Cancel Reject Message
memx_options_memo_sbe_v1_3_dissect.order_cancel_reject_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_cancel_reject_message then
    local length = memx_options_memo_sbe_v1_3_size_of.order_cancel_reject_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.order_cancel_reject_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.order_cancel_reject_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.order_cancel_reject_message_fields(buffer, offset, packet, parent)
end

-- Size: Total Affected Orders
memx_options_memo_sbe_v1_3_size_of.total_affected_orders = 4

-- Display: Total Affected Orders
memx_options_memo_sbe_v1_3_display.total_affected_orders = function(value)
  return "Total Affected Orders: "..value
end

-- Dissect: Total Affected Orders
memx_options_memo_sbe_v1_3_dissect.total_affected_orders = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.total_affected_orders
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.total_affected_orders(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.total_affected_orders, range, value, display)

  return offset + length, value
end

-- Calculate size of: Mass Cancel Done Message
memx_options_memo_sbe_v1_3_size_of.mass_cancel_done_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.total_affected_orders

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Mass Cancel Done Message
memx_options_memo_sbe_v1_3_display.mass_cancel_done_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Mass Cancel Done Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_done_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Total Affected Orders: 4 Byte Unsigned Fixed Width Integer
  index, total_affected_orders = memx_options_memo_sbe_v1_3_dissect.total_affected_orders(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Mass Cancel Done Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_done_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.mass_cancel_done_message then
    local length = memx_options_memo_sbe_v1_3_size_of.mass_cancel_done_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.mass_cancel_done_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.mass_cancel_done_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.mass_cancel_done_message_fields(buffer, offset, packet, parent)
end

-- Size: Mass Cancel Inst
memx_options_memo_sbe_v1_3_size_of.mass_cancel_inst = 1

-- Display: Mass Cancel Inst
memx_options_memo_sbe_v1_3_display.mass_cancel_inst = function(buffer, packet, parent)
  local display = ""

  -- Is Cancel Orders From This Port Only flag set?
  if buffer:bitfield(5) > 0 then
    display = display.."Cancel Orders From This Port Only|"
  end
  -- Is Send Cancels flag set?
  if buffer:bitfield(6) > 0 then
    display = display.."Send Cancels|"
  end
  -- Is Lockout flag set?
  if buffer:bitfield(7) > 0 then
    display = display.."Lockout|"
  end

  return display:sub(1, -2)
end

-- Dissect Bit Fields: Mass Cancel Inst
memx_options_memo_sbe_v1_3_dissect.mass_cancel_inst_bits = function(buffer, offset, packet, parent)

  -- Reserved 5: 5 Bit
  parent:add(memx_options_memo_sbe_v1_3.fields.reserved_5, buffer(offset, 1))

  -- Cancel Orders From This Port Only: 1 Bit
  parent:add(memx_options_memo_sbe_v1_3.fields.cancel_orders_from_this_port_only, buffer(offset, 1))

  -- Send Cancels: 1 Bit
  parent:add(memx_options_memo_sbe_v1_3.fields.send_cancels, buffer(offset, 1))

  -- Lockout: 1 Bit
  parent:add(memx_options_memo_sbe_v1_3.fields.lockout, buffer(offset, 1))
end

-- Dissect: Mass Cancel Inst
memx_options_memo_sbe_v1_3_dissect.mass_cancel_inst = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local display = memx_options_memo_sbe_v1_3_display.mass_cancel_inst(range, packet, parent)
  local element = parent:add(memx_options_memo_sbe_v1_3.fields.mass_cancel_inst, range, display)

  if show.mass_cancel_inst then
    memx_options_memo_sbe_v1_3_dissect.mass_cancel_inst_bits(buffer, offset, packet, element)
  end

  return offset + 1, range
end

-- Size: Cancel Group Id
memx_options_memo_sbe_v1_3_size_of.cancel_group_id = 2

-- Display: Cancel Group Id
memx_options_memo_sbe_v1_3_display.cancel_group_id = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Cancel Group Id: No Value"
  end

  return "Cancel Group Id: "..value
end

-- Dissect: Cancel Group Id
memx_options_memo_sbe_v1_3_dissect.cancel_group_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.cancel_group_id
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.cancel_group_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.cancel_group_id, range, value, display)

  return offset + length, value
end

-- Size: Underlier Mass Cancel Reject Underlier
memx_options_memo_sbe_v1_3_size_of.underlier_mass_cancel_reject_underlier = 6

-- Display: Underlier Mass Cancel Reject Underlier
memx_options_memo_sbe_v1_3_display.underlier_mass_cancel_reject_underlier = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Underlier Mass Cancel Reject Underlier: No Value"
  end

  return "Underlier Mass Cancel Reject Underlier: "..value
end

-- Dissect: Underlier Mass Cancel Reject Underlier
memx_options_memo_sbe_v1_3_dissect.underlier_mass_cancel_reject_underlier = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.underlier_mass_cancel_reject_underlier
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.underlier_mass_cancel_reject_underlier(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.underlier_mass_cancel_reject_underlier, range, value, display)

  return offset + length, value
end

-- Size: Underlying Or Series
memx_options_memo_sbe_v1_3_size_of.underlying_or_series = 1

-- Display: Underlying Or Series
memx_options_memo_sbe_v1_3_display.underlying_or_series = function(value)
  if value == 0 then
    return "Underlying Or Series: Cancel All On Underlying (0)"
  end
  if value == 1 then
    return "Underlying Or Series: Cancel All On Series (1)"
  end
  if value == 255 then
    return "Underlying Or Series: Null Value (255)"
  end
  if value == 255 then
    return "Underlying Or Series: No Value"
  end

  return "Underlying Or Series: Unknown("..value..")"
end

-- Dissect: Underlying Or Series
memx_options_memo_sbe_v1_3_dissect.underlying_or_series = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.underlying_or_series
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.underlying_or_series(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.underlying_or_series, range, value, display)

  return offset + length, value
end

-- Size: Efid
memx_options_memo_sbe_v1_3_size_of.efid = 4

-- Display: Efid
memx_options_memo_sbe_v1_3_display.efid = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Efid: No Value"
  end

  return "Efid: "..value
end

-- Dissect: Efid
memx_options_memo_sbe_v1_3_dissect.efid = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.efid
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.efid(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.efid, range, value, display)

  return offset + length, value
end

-- Size: Reject Reason
memx_options_memo_sbe_v1_3_size_of.reject_reason = 2

-- Display: Reject Reason
memx_options_memo_sbe_v1_3_display.reject_reason = function(value)
  if value == 1 then
    return "Reject Reason: Unknown Symbol (1)"
  end
  if value == 2 then
    return "Reject Reason: Exchange Closed (2)"
  end
  if value == 6 then
    return "Reject Reason: Duplicate Order (6)"
  end
  if value == 16 then
    return "Reject Reason: Price Exceeds Current Price Band (16)"
  end
  if value == 18 then
    return "Reject Reason: Invalid Price Increment (18)"
  end
  if value == 27 then
    return "Reject Reason: Max Notional Value Per Order Risk Rule Breach (27)"
  end
  if value == 99 then
    return "Reject Reason: Other (99)"
  end
  if value == 100 then
    return "Reject Reason: Missing Symbol (100)"
  end
  if value == 101 then
    return "Reject Reason: Invalid Symbol (101)"
  end
  if value == 102 then
    return "Reject Reason: Missing Cl Ord Id (102)"
  end
  if value == 103 then
    return "Reject Reason: Invalid Cl Ord Id (103)"
  end
  if value == 104 then
    return "Reject Reason: Missing Side (104)"
  end
  if value == 105 then
    return "Reject Reason: Invalid Side (105)"
  end
  if value == 106 then
    return "Reject Reason: Missing Order Qty (106)"
  end
  if value == 107 then
    return "Reject Reason: Invalid Order Qty (107)"
  end
  if value == 108 then
    return "Reject Reason: Missing Order Type (108)"
  end
  if value == 109 then
    return "Reject Reason: Invalid Order Type (109)"
  end
  if value == 110 then
    return "Reject Reason: Missing Time In Force (110)"
  end
  if value == 111 then
    return "Reject Reason: Invalid Time In Force (111)"
  end
  if value == 112 then
    return "Reject Reason: Missing Trading Capacity (112)"
  end
  if value == 113 then
    return "Reject Reason: Invalid Trading Capacity (113)"
  end
  if value == 114 then
    return "Reject Reason: Missing Exec Inst (114)"
  end
  if value == 115 then
    return "Reject Reason: Invalid Exec Inst (115)"
  end
  if value == 118 then
    return "Reject Reason: Missing Limit Price (118)"
  end
  if value == 119 then
    return "Reject Reason: Invalid Limit Price (119)"
  end
  if value == 124 then
    return "Reject Reason: Missing Match Trade Prevention Type (124)"
  end
  if value == 125 then
    return "Reject Reason: Invalid Match Trade Prevention Type (125)"
  end
  if value == 126 then
    return "Reject Reason: Missing Cancel Group Id (126)"
  end
  if value == 127 then
    return "Reject Reason: Invalid Cancel Group Id (127)"
  end
  if value == 128 then
    return "Reject Reason: Missing Mtp Group Id (128)"
  end
  if value == 129 then
    return "Reject Reason: Invalid Mtp Group Id (129)"
  end
  if value == 134 then
    return "Reject Reason: Missing Risk Group Id (134)"
  end
  if value == 135 then
    return "Reject Reason: Invalid Risk Group Id (135)"
  end
  if value == 136 then
    return "Reject Reason: Missing Efid (136)"
  end
  if value == 137 then
    return "Reject Reason: Invalid Efid (137)"
  end
  if value == 138 then
    return "Reject Reason: Missing List Seq No (138)"
  end
  if value == 139 then
    return "Reject Reason: Invalid List Seq No (139)"
  end
  if value == 140 then
    return "Reject Reason: Quotes Have Different Underliers (140)"
  end
  if value == 141 then
    return "Reject Reason: Two Sided Quotes Cross (141)"
  end
  if value == 142 then
    return "Reject Reason: Missing Open Or Close (142)"
  end
  if value == 143 then
    return "Reject Reason: Invalid Open Or Close (143)"
  end
  if value == 144 then
    return "Reject Reason: Missing Reprice Behavior Type (144)"
  end
  if value == 145 then
    return "Reject Reason: Invalid Reprice Behavior Type (145)"
  end
  if value == 146 then
    return "Reject Reason: Missing Reprice Frequency Type (146)"
  end
  if value == 147 then
    return "Reject Reason: Invalid Reprice Frequency Type (147)"
  end
  if value == 148 then
    return "Reject Reason: Missing Party Role Type (148)"
  end
  if value == 149 then
    return "Reject Reason: Invalid Party Role Type (149)"
  end
  if value == 150 then
    return "Reject Reason: Missing Party Id (150)"
  end
  if value == 151 then
    return "Reject Reason: Invalid Party Id (151)"
  end
  if value == 152 then
    return "Reject Reason: Missing Party Id Source (152)"
  end
  if value == 153 then
    return "Reject Reason: Invalid Party Id Source (153)"
  end
  if value == 200 then
    return "Reject Reason: Halted (200)"
  end
  if value == 201 then
    return "Reject Reason: Firm Disabled (201)"
  end
  if value == 202 then
    return "Reject Reason: Efid Disabled (202)"
  end
  if value == 203 then
    return "Reject Reason: Account Disabled (203)"
  end
  if value == 204 then
    return "Reject Reason: Invalid Modifier For Order Type (204)"
  end
  if value == 205 then
    return "Reject Reason: Invalid Time In Force For Order Type (205)"
  end
  if value == 207 then
    return "Reject Reason: Post Only Not Allowed (207)"
  end
  if value == 208 then
    return "Reject Reason: Quote Modify Rejected (208)"
  end
  if value == 209 then
    return "Reject Reason: Quoting Disabled (209)"
  end
  if value == 210 then
    return "Reject Reason: Invalid Quote Component Count (210)"
  end
  if value == 300 then
    return "Reject Reason: Non Test Symbols Blocked (300)"
  end
  if value == 301 then
    return "Reject Reason: Notional Value Exceeds Threshold (301)"
  end
  if value == 302 then
    return "Reject Reason: Max Notional Value Per Order Risk Rule Violated (302)"
  end
  if value == 303 then
    return "Reject Reason: Block Non Test Symbol Risk Rule Violated (303)"
  end
  if value == 304 then
    return "Reject Reason: Max Contracts Per Order Risk Rule Violated (304)"
  end
  if value == 305 then
    return "Reject Reason: Nbbo Width Exceeds Threshold (305)"
  end
  if value == 306 then
    return "Reject Reason: Exchange Price Value Collar Risk Rule Violated (306)"
  end
  if value == 307 then
    return "Reject Reason: Execution Price Higher Than Strike Price (307)"
  end
  if value == 308 then
    return "Reject Reason: Market Buy When Nbo Is Zero (308)"
  end
  if value == 309 then
    return "Reject Reason: Market Sell When Nbb Greater Than Threshold (309)"
  end
  if value == 310 then
    return "Reject Reason: Quote Price Outside Exchange Threshold (310)"
  end
  if value == 312 then
    return "Reject Reason: Num Contracts Executed Exceeds Threshold (312)"
  end
  if value == 313 then
    return "Reject Reason: Notional Value Of Executions Exceeds Threshold (313)"
  end
  if value == 314 then
    return "Reject Reason: Count Of Executions Exceeds Threshold (314)"
  end
  if value == 315 then
    return "Reject Reason: Outstanding Percentage Threshold Exceeded (315)"
  end
  if value == 316 then
    return "Reject Reason: Trips Threshold Exceeded (316)"
  end
  if value == 317 then
    return "Reject Reason: Iso Orders Not Allowed (317)"
  end
  if value == 318 then
    return "Reject Reason: Market Is Crossed (318)"
  end
  if value == 319 then
    return "Reject Reason: Active Risk Breach (319)"
  end
  if value == 320 then
    return "Reject Reason: Manual Risk Breach (320)"
  end
  if value == 321 then
    return "Reject Reason: Gross Notional Value Exceeds Threshold (321)"
  end
  if value == 322 then
    return "Reject Reason: Net Notional Value Exceeds Threshold (322)"
  end
  if value == 323 then
    return "Reject Reason: Duplicate Order Threshold Exceeded (323)"
  end
  if value == 324 then
    return "Reject Reason: Order Rate Threshold Exceeded (324)"
  end
  if value == 325 then
    return "Reject Reason: Mass Cancel Lockout In Effect (325)"
  end
  if value == 326 then
    return "Reject Reason: Market Order Gross Notional Value Exceeds Threshold (326)"
  end
  if value == 327 then
    return "Reject Reason: Market Order Net Notional Value Exceeds Threshold (327)"
  end
  if value == 65535 then
    return "Reject Reason: Null Value (65535)"
  end
  if value == 0 then
    return "Reject Reason: Other (0)"
  end
  if value == 1 then
    return "Reject Reason: Duplicate Cl Ord Id (1)"
  end
  if value == 2 then
    return "Reject Reason: Missing Cl Ord Id (2)"
  end
  if value == 3 then
    return "Reject Reason: Invalid Cl Ord Id (3)"
  end
  if value == 4 then
    return "Reject Reason: Missing Efid (4)"
  end
  if value == 5 then
    return "Reject Reason: Invalid Efid (5)"
  end
  if value == 6 then
    return "Reject Reason: Missing Underlying Or Series (6)"
  end
  if value == 7 then
    return "Reject Reason: Invalid Underlying Or Series (7)"
  end
  if value == 8 then
    return "Reject Reason: Missing Underlier (8)"
  end
  if value == 9 then
    return "Reject Reason: Invalid Underlier (9)"
  end
  if value == 10 then
    return "Reject Reason: Missing Options Security Id (10)"
  end
  if value == 11 then
    return "Reject Reason: Invalid Options Security Id (11)"
  end
  if value == 12 then
    return "Reject Reason: Missing Cancel Group Id (12)"
  end
  if value == 13 then
    return "Reject Reason: Invalid Cancel Group Id (13)"
  end
  if value == 14 then
    return "Reject Reason: Missing Mass Cancel Inst (14)"
  end
  if value == 15 then
    return "Reject Reason: Invalid Mass Cancel Inst (15)"
  end
  if value == 17 then
    return "Reject Reason: Mass Cancel In Progress (17)"
  end

  return "Reject Reason: Unknown("..value..")"
end

-- Dissect: Reject Reason
memx_options_memo_sbe_v1_3_dissect.reject_reason = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.reject_reason
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.reject_reason(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.reject_reason, range, value, display)

  return offset + length, value
end

-- Calculate size of: Mass Cancel Reject Message
memx_options_memo_sbe_v1_3_size_of.mass_cancel_reject_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.reject_reason

  index = index + memx_options_memo_sbe_v1_3_size_of.efid

  index = index + memx_options_memo_sbe_v1_3_size_of.underlying_or_series

  index = index + memx_options_memo_sbe_v1_3_size_of.underlier_mass_cancel_reject_underlier

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.mass_cancel_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Mass Cancel Reject Message
memx_options_memo_sbe_v1_3_display.mass_cancel_reject_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Mass Cancel Reject Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_reject_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Reject Reason: 2 Byte Unsigned Fixed Width Integer Enum with 106 values
  index, reject_reason = memx_options_memo_sbe_v1_3_dissect.reject_reason(buffer, index, packet, parent)

  -- Efid: 4 Byte Ascii String Nullable
  index, efid = memx_options_memo_sbe_v1_3_dissect.efid(buffer, index, packet, parent)

  -- Underlying Or Series: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, underlying_or_series = memx_options_memo_sbe_v1_3_dissect.underlying_or_series(buffer, index, packet, parent)

  -- Underlier Mass Cancel Reject Underlier: 6 Byte Ascii String Nullable
  index, underlier_mass_cancel_reject_underlier = memx_options_memo_sbe_v1_3_dissect.underlier_mass_cancel_reject_underlier(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Mass Cancel Inst: Struct of 4 fields
  index, mass_cancel_inst = memx_options_memo_sbe_v1_3_dissect.mass_cancel_inst(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Mass Cancel Reject Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_reject_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.mass_cancel_reject_message then
    local length = memx_options_memo_sbe_v1_3_size_of.mass_cancel_reject_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.mass_cancel_reject_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.mass_cancel_reject_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.mass_cancel_reject_message_fields(buffer, offset, packet, parent)
end

-- Size: Underlier Pending Mass Cancel Underlier
memx_options_memo_sbe_v1_3_size_of.underlier_pending_mass_cancel_underlier = 6

-- Display: Underlier Pending Mass Cancel Underlier
memx_options_memo_sbe_v1_3_display.underlier_pending_mass_cancel_underlier = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Underlier Pending Mass Cancel Underlier: No Value"
  end

  return "Underlier Pending Mass Cancel Underlier: "..value
end

-- Dissect: Underlier Pending Mass Cancel Underlier
memx_options_memo_sbe_v1_3_dissect.underlier_pending_mass_cancel_underlier = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.underlier_pending_mass_cancel_underlier
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.underlier_pending_mass_cancel_underlier(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.underlier_pending_mass_cancel_underlier, range, value, display)

  return offset + length, value
end

-- Calculate size of: Pending Mass Cancel Message
memx_options_memo_sbe_v1_3_size_of.pending_mass_cancel_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.mass_cancel_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.lockout_id

  index = index + memx_options_memo_sbe_v1_3_size_of.efid

  index = index + memx_options_memo_sbe_v1_3_size_of.underlying_or_series

  index = index + memx_options_memo_sbe_v1_3_size_of.underlier_pending_mass_cancel_underlier

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Pending Mass Cancel Message
memx_options_memo_sbe_v1_3_display.pending_mass_cancel_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Pending Mass Cancel Message
memx_options_memo_sbe_v1_3_dissect.pending_mass_cancel_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Mass Cancel Inst: Struct of 4 fields
  index, mass_cancel_inst = memx_options_memo_sbe_v1_3_dissect.mass_cancel_inst(buffer, index, packet, parent)

  -- Lockout Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, lockout_id = memx_options_memo_sbe_v1_3_dissect.lockout_id(buffer, index, packet, parent)

  -- Efid: 4 Byte Ascii String Nullable
  index, efid = memx_options_memo_sbe_v1_3_dissect.efid(buffer, index, packet, parent)

  -- Underlying Or Series: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, underlying_or_series = memx_options_memo_sbe_v1_3_dissect.underlying_or_series(buffer, index, packet, parent)

  -- Underlier Pending Mass Cancel Underlier: 6 Byte Ascii String Nullable
  index, underlier_pending_mass_cancel_underlier = memx_options_memo_sbe_v1_3_dissect.underlier_pending_mass_cancel_underlier(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Pending Mass Cancel Message
memx_options_memo_sbe_v1_3_dissect.pending_mass_cancel_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.pending_mass_cancel_message then
    local length = memx_options_memo_sbe_v1_3_size_of.pending_mass_cancel_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.pending_mass_cancel_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.pending_mass_cancel_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.pending_mass_cancel_message_fields(buffer, offset, packet, parent)
end

-- Size: Transact Time
memx_options_memo_sbe_v1_3_size_of.transact_time = 1

-- Display: Transact Time
memx_options_memo_sbe_v1_3_display.transact_time = function(value)
  return "Transact Time: "..value
end

-- Dissect: Transact Time
memx_options_memo_sbe_v1_3_dissect.transact_time = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.transact_time
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.transact_time(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.transact_time, range, value, display)

  return offset + length, value
end

-- Size: Cum Qty
memx_options_memo_sbe_v1_3_size_of.cum_qty = 4

-- Display: Cum Qty
memx_options_memo_sbe_v1_3_display.cum_qty = function(value)
  return "Cum Qty: "..value
end

-- Dissect: Cum Qty
memx_options_memo_sbe_v1_3_dissect.cum_qty = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.cum_qty
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.cum_qty(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.cum_qty, range, value, display)

  return offset + length, value
end

-- Size: Leaves Qty
memx_options_memo_sbe_v1_3_size_of.leaves_qty = 4

-- Display: Leaves Qty
memx_options_memo_sbe_v1_3_display.leaves_qty = function(value)
  return "Leaves Qty: "..value
end

-- Dissect: Leaves Qty
memx_options_memo_sbe_v1_3_dissect.leaves_qty = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.leaves_qty
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.leaves_qty(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.leaves_qty, range, value, display)

  return offset + length, value
end

-- Size: Last Qty
memx_options_memo_sbe_v1_3_size_of.last_qty = 4

-- Display: Last Qty
memx_options_memo_sbe_v1_3_display.last_qty = function(value)
  -- Check if field has value
  if value == 4294967295 then
    return "Last Qty: No Value"
  end

  return "Last Qty: "..value
end

-- Dissect: Last Qty
memx_options_memo_sbe_v1_3_dissect.last_qty = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.last_qty
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.last_qty(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.last_qty, range, value, display)

  return offset + length, value
end

-- Size: Last Px
memx_options_memo_sbe_v1_3_size_of.last_px = 1

-- Display: Last Px
memx_options_memo_sbe_v1_3_display.last_px = function(value)
  return "Last Px: "..value
end

-- Dissect: Last Px
memx_options_memo_sbe_v1_3_dissect.last_px = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.last_px
  local range = buffer(offset, length)
  local value = range:int()
  local display = memx_options_memo_sbe_v1_3_display.last_px(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.last_px, range, value, display)

  return offset + length, value
end

-- Size: Extended Restatement Reason
memx_options_memo_sbe_v1_3_size_of.extended_restatement_reason = 1

-- Display: Extended Restatement Reason
memx_options_memo_sbe_v1_3_display.extended_restatement_reason = function(value)
  if value == 0 then
    return "Extended Restatement Reason: None (0)"
  end
  if value == 3 then
    return "Extended Restatement Reason: Match Trade Cancel Newest (3)"
  end
  if value == 4 then
    return "Extended Restatement Reason: Match Trade Cancel Oldest (4)"
  end
  if value == 6 then
    return "Extended Restatement Reason: Match Trade Cancel Both (6)"
  end
  if value == 255 then
    return "Extended Restatement Reason: Null Value (255)"
  end
  if value == 255 then
    return "Extended Restatement Reason: No Value"
  end

  return "Extended Restatement Reason: Unknown("..value..")"
end

-- Dissect: Extended Restatement Reason
memx_options_memo_sbe_v1_3_dissect.extended_restatement_reason = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.extended_restatement_reason
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.extended_restatement_reason(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.extended_restatement_reason, range, value, display)

  return offset + length, value
end

-- Size: Exec Restatement Reason
memx_options_memo_sbe_v1_3_size_of.exec_restatement_reason = 1

-- Display: Exec Restatement Reason
memx_options_memo_sbe_v1_3_display.exec_restatement_reason = function(value)
  if value == 3 then
    return "Exec Restatement Reason: Order Reprice (3)"
  end
  if value == 5 then
    return "Exec Restatement Reason: Match Trade Prevention (5)"
  end
  if value == 99 then
    return "Exec Restatement Reason: Other (99)"
  end
  if value == 255 then
    return "Exec Restatement Reason: Null Value (255)"
  end

  return "Exec Restatement Reason: Unknown("..value..")"
end

-- Dissect: Exec Restatement Reason
memx_options_memo_sbe_v1_3_dissect.exec_restatement_reason = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.exec_restatement_reason
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.exec_restatement_reason(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.exec_restatement_reason, range, value, display)

  return offset + length, value
end

-- Size: Ord Status
memx_options_memo_sbe_v1_3_size_of.ord_status = 1

-- Display: Ord Status
memx_options_memo_sbe_v1_3_display.ord_status = function(value)
  if value == "0" then
    return "Ord Status: New (0)"
  end
  if value == "1" then
    return "Ord Status: Partial Filled (1)"
  end
  if value == "2" then
    return "Ord Status: Filled (2)"
  end
  if value == "4" then
    return "Ord Status: Canceled (4)"
  end
  if value == "6" then
    return "Ord Status: Pending Cancel (6)"
  end
  if value == "8" then
    return "Ord Status: Rejected (8)"
  end
  if value == "E" then
    return "Ord Status: Pending Replace (E)"
  end
  if value == "C" then
    return "Ord Status: Expired (C)"
  end

  return "Ord Status: Unknown("..value..")"
end

-- Dissect: Ord Status
memx_options_memo_sbe_v1_3_dissect.ord_status = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.ord_status
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.ord_status(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.ord_status, range, value, display)

  return offset + length, value
end

-- Size: Exec Id
memx_options_memo_sbe_v1_3_size_of.exec_id = 8

-- Display: Exec Id
memx_options_memo_sbe_v1_3_display.exec_id = function(value)
  return "Exec Id: "..value
end

-- Dissect: Exec Id
memx_options_memo_sbe_v1_3_dissect.exec_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.exec_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.exec_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.exec_id, range, value, display)

  return offset + length, value
end

-- Size: Order Id
memx_options_memo_sbe_v1_3_size_of.order_id = 8

-- Display: Order Id
memx_options_memo_sbe_v1_3_display.order_id = function(value)
  -- Check if field has value
  if value == UInt64(0xFFFFFFFF, 0xFFFFFFFF) then
    return "Order Id: No Value"
  end

  return "Order Id: "..value
end

-- Dissect: Order Id
memx_options_memo_sbe_v1_3_dissect.order_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.order_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.order_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.order_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Execution Report Restatement Message
memx_options_memo_sbe_v1_3_size_of.execution_report_restatement_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_restatement_reason

  index = index + memx_options_memo_sbe_v1_3_size_of.extended_restatement_reason

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.last_px

  index = index + memx_options_memo_sbe_v1_3_size_of.last_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.transact_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_21

  return index
end

-- Display: Execution Report Restatement Message
memx_options_memo_sbe_v1_3_display.execution_report_restatement_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Restatement Message
memx_options_memo_sbe_v1_3_dissect.execution_report_restatement_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Exec Restatement Reason: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, exec_restatement_reason = memx_options_memo_sbe_v1_3_dissect.exec_restatement_reason(buffer, index, packet, parent)

  -- Extended Restatement Reason: 1 Byte Unsigned Fixed Width Integer Enum with 6 values
  index, extended_restatement_reason = memx_options_memo_sbe_v1_3_dissect.extended_restatement_reason(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Last Px: 1 Byte Signed Fixed Width Integer
  index, last_px = memx_options_memo_sbe_v1_3_dissect.last_px(buffer, index, packet, parent)

  -- Last Qty: 4 Byte Unsigned Fixed Width Integer Nullable
  index, last_qty = memx_options_memo_sbe_v1_3_dissect.last_qty(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Transact Time: 1 Byte Unsigned Fixed Width Integer
  index, transact_time = memx_options_memo_sbe_v1_3_dissect.transact_time(buffer, index, packet, parent)

  -- Padding 21
  index, padding_21 = memx_options_memo_sbe_v1_3_dissect.padding_21(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Restatement Message
memx_options_memo_sbe_v1_3_dissect.execution_report_restatement_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.execution_report_restatement_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_restatement_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_restatement_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_restatement_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_restatement_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Execution Report Trade Break Message
memx_options_memo_sbe_v1_3_size_of.execution_report_trade_break_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.trd_match_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_ref_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Execution Report Trade Break Message
memx_options_memo_sbe_v1_3_display.execution_report_trade_break_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Trade Break Message
memx_options_memo_sbe_v1_3_dissect.execution_report_trade_break_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Trd Match Id: 8 Byte Unsigned Fixed Width Integer
  index, trd_match_id = memx_options_memo_sbe_v1_3_dissect.trd_match_id(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Exec Ref Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, exec_ref_id = memx_options_memo_sbe_v1_3_dissect.exec_ref_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Trade Break Message
memx_options_memo_sbe_v1_3_dissect.execution_report_trade_break_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.execution_report_trade_break_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_trade_break_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_trade_break_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_trade_break_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_trade_break_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Execution Report Trade Correction Message
memx_options_memo_sbe_v1_3_size_of.execution_report_trade_correction_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.trd_match_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_ref_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.last_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.last_px

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_14

  return index
end

-- Display: Execution Report Trade Correction Message
memx_options_memo_sbe_v1_3_display.execution_report_trade_correction_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Trade Correction Message
memx_options_memo_sbe_v1_3_dissect.execution_report_trade_correction_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Trd Match Id: 8 Byte Unsigned Fixed Width Integer
  index, trd_match_id = memx_options_memo_sbe_v1_3_dissect.trd_match_id(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Exec Ref Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, exec_ref_id = memx_options_memo_sbe_v1_3_dissect.exec_ref_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Last Qty: 4 Byte Unsigned Fixed Width Integer Nullable
  index, last_qty = memx_options_memo_sbe_v1_3_dissect.last_qty(buffer, index, packet, parent)

  -- Last Px: 1 Byte Signed Fixed Width Integer
  index, last_px = memx_options_memo_sbe_v1_3_dissect.last_px(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memo_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Trade Correction Message
memx_options_memo_sbe_v1_3_dissect.execution_report_trade_correction_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.execution_report_trade_correction_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_trade_correction_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_trade_correction_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_trade_correction_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_trade_correction_message_fields(buffer, offset, packet, parent)
end

-- Size: Price Price Type
memx_options_memo_sbe_v1_3_size_of.price_price_type = 1

-- Display: Price Price Type
memx_options_memo_sbe_v1_3_display.price_price_type = function(value)
  -- Check if field has value
  if value == 128 then
    return "Price Price Type: No Value"
  end

  return "Price Price Type: "..value
end

-- Dissect: Price Price Type
memx_options_memo_sbe_v1_3_dissect.price_price_type = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.price_price_type
  local range = buffer(offset, length)
  local value = range:int()
  local display = memx_options_memo_sbe_v1_3_display.price_price_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.price_price_type, range, value, display)

  return offset + length, value
end

-- Size: Ord Type
memx_options_memo_sbe_v1_3_size_of.ord_type = 1

-- Display: Ord Type
memx_options_memo_sbe_v1_3_display.ord_type = function(value)
  if value == "1" then
    return "Ord Type: Market (1)"
  end
  if value == "2" then
    return "Ord Type: Limit (2)"
  end

  return "Ord Type: Unknown("..value..")"
end

-- Dissect: Ord Type
memx_options_memo_sbe_v1_3_dissect.ord_type = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.ord_type
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.ord_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.ord_type, range, value, display)

  return offset + length, value
end

-- Size: Order Qty
memx_options_memo_sbe_v1_3_size_of.order_qty = 4

-- Display: Order Qty
memx_options_memo_sbe_v1_3_display.order_qty = function(value)
  return "Order Qty: "..value
end

-- Dissect: Order Qty
memx_options_memo_sbe_v1_3_dissect.order_qty = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.order_qty
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.order_qty(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.order_qty, range, value, display)

  return offset + length, value
end

-- Size: Orig Cl Ord Id
memx_options_memo_sbe_v1_3_size_of.orig_cl_ord_id = 20

-- Display: Orig Cl Ord Id
memx_options_memo_sbe_v1_3_display.orig_cl_ord_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Orig Cl Ord Id: No Value"
  end

  return "Orig Cl Ord Id: "..value
end

-- Dissect: Orig Cl Ord Id
memx_options_memo_sbe_v1_3_dissect.orig_cl_ord_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.orig_cl_ord_id
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.orig_cl_ord_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.orig_cl_ord_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Execution Report Replaced Message
memx_options_memo_sbe_v1_3_size_of.execution_report_replaced_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.orig_cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.order_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_type

  index = index + memx_options_memo_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.transact_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_21

  return index
end

-- Display: Execution Report Replaced Message
memx_options_memo_sbe_v1_3_display.execution_report_replaced_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Replaced Message
memx_options_memo_sbe_v1_3_dissect.execution_report_replaced_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Orig Cl Ord Id: 20 Byte Ascii String Nullable
  index, orig_cl_ord_id = memx_options_memo_sbe_v1_3_dissect.orig_cl_ord_id(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Order Qty: 4 Byte Unsigned Fixed Width Integer
  index, order_qty = memx_options_memo_sbe_v1_3_dissect.order_qty(buffer, index, packet, parent)

  -- Ord Type: 1 Byte Ascii String Enum with 2 values
  index, ord_type = memx_options_memo_sbe_v1_3_dissect.ord_type(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer Nullable
  index, price_price_type = memx_options_memo_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Transact Time: 1 Byte Unsigned Fixed Width Integer
  index, transact_time = memx_options_memo_sbe_v1_3_dissect.transact_time(buffer, index, packet, parent)

  -- Padding 21
  index, padding_21 = memx_options_memo_sbe_v1_3_dissect.padding_21(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Replaced Message
memx_options_memo_sbe_v1_3_dissect.execution_report_replaced_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.execution_report_replaced_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_replaced_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_replaced_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_replaced_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_replaced_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Execution Report Pending Replace Message
memx_options_memo_sbe_v1_3_size_of.execution_report_pending_replace_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.orig_cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.order_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_type

  index = index + memx_options_memo_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_14

  return index
end

-- Display: Execution Report Pending Replace Message
memx_options_memo_sbe_v1_3_display.execution_report_pending_replace_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Pending Replace Message
memx_options_memo_sbe_v1_3_dissect.execution_report_pending_replace_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Orig Cl Ord Id: 20 Byte Ascii String Nullable
  index, orig_cl_ord_id = memx_options_memo_sbe_v1_3_dissect.orig_cl_ord_id(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Order Qty: 4 Byte Unsigned Fixed Width Integer
  index, order_qty = memx_options_memo_sbe_v1_3_dissect.order_qty(buffer, index, packet, parent)

  -- Ord Type: 1 Byte Ascii String Enum with 2 values
  index, ord_type = memx_options_memo_sbe_v1_3_dissect.ord_type(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer Nullable
  index, price_price_type = memx_options_memo_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memo_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Pending Replace Message
memx_options_memo_sbe_v1_3_dissect.execution_report_pending_replace_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.execution_report_pending_replace_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_pending_replace_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_pending_replace_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_pending_replace_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_pending_replace_message_fields(buffer, offset, packet, parent)
end

-- Size: Cancel Reason
memx_options_memo_sbe_v1_3_size_of.cancel_reason = 1

-- Display: Cancel Reason
memx_options_memo_sbe_v1_3_display.cancel_reason = function(value)
  if value == 0 then
    return "Cancel Reason: Other (0)"
  end
  if value == 1 then
    return "Cancel Reason: User Requested Cancel (1)"
  end
  if value == 5 then
    return "Cancel Reason: Execution Price Collar (5)"
  end
  if value == 6 then
    return "Cancel Reason: Halted (6)"
  end
  if value == 7 then
    return "Cancel Reason: Exchange Supervisory (7)"
  end
  if value == 8 then
    return "Cancel Reason: Order Expired (8)"
  end
  if value == 10 then
    return "Cancel Reason: Match Trade Prevention (10)"
  end
  if value == 13 then
    return "Cancel Reason: Participant Disconnect (13)"
  end
  if value == 14 then
    return "Cancel Reason: Order Not Bookable (14)"
  end
  if value == 17 then
    return "Cancel Reason: Firm Disabled (17)"
  end
  if value == 18 then
    return "Cancel Reason: Efid Disabled (18)"
  end
  if value == 19 then
    return "Cancel Reason: Account Disabled (19)"
  end
  if value == 22 then
    return "Cancel Reason: Quote Update Rejected Orig Quote Canceled (22)"
  end
  if value == 23 then
    return "Cancel Reason: Active Risk Breach (23)"
  end
  if value == 24 then
    return "Cancel Reason: Manual Risk Breach (24)"
  end
  if value == 25 then
    return "Cancel Reason: Num Contracts Executed Exceeds Threshold (25)"
  end
  if value == 26 then
    return "Cancel Reason: Notional Value Of Executions Exceeds Threshold (26)"
  end
  if value == 27 then
    return "Cancel Reason: Count Of Executions Exceeds Threshold (27)"
  end
  if value == 28 then
    return "Cancel Reason: Outstanding Percentage Threshold Exceeded (28)"
  end
  if value == 29 then
    return "Cancel Reason: Trips Threshold Exceeded (29)"
  end
  if value == 30 then
    return "Cancel Reason: Gross Notional Value Exceeds Threshold (30)"
  end
  if value == 31 then
    return "Cancel Reason: Net Notional Value Exceeds Threshold (31)"
  end
  if value == 32 then
    return "Cancel Reason: Duplicate Order Threshold Exceeded (32)"
  end
  if value == 33 then
    return "Cancel Reason: Order Rate Threshold Exceeded (33)"
  end
  if value == 34 then
    return "Cancel Reason: Market Order Gross Notional Value Exceeds Threshold (34)"
  end
  if value == 35 then
    return "Cancel Reason: Market Order Net Notional Value Exceeds Threshold (35)"
  end
  if value == 255 then
    return "Cancel Reason: Null Value (255)"
  end

  return "Cancel Reason: Unknown("..value..")"
end

-- Dissect: Cancel Reason
memx_options_memo_sbe_v1_3_dissect.cancel_reason = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.cancel_reason
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.cancel_reason(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.cancel_reason, range, value, display)

  return offset + length, value
end

-- Calculate size of: Execution Report Canceled Message
memx_options_memo_sbe_v1_3_size_of.execution_report_canceled_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.orig_cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_reason

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.transact_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_14

  return index
end

-- Display: Execution Report Canceled Message
memx_options_memo_sbe_v1_3_display.execution_report_canceled_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Canceled Message
memx_options_memo_sbe_v1_3_dissect.execution_report_canceled_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Orig Cl Ord Id: 20 Byte Ascii String Nullable
  index, orig_cl_ord_id = memx_options_memo_sbe_v1_3_dissect.orig_cl_ord_id(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Cancel Reason: 1 Byte Unsigned Fixed Width Integer Enum with 27 values
  index, cancel_reason = memx_options_memo_sbe_v1_3_dissect.cancel_reason(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Transact Time: 1 Byte Unsigned Fixed Width Integer
  index, transact_time = memx_options_memo_sbe_v1_3_dissect.transact_time(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memo_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Canceled Message
memx_options_memo_sbe_v1_3_dissect.execution_report_canceled_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.execution_report_canceled_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_canceled_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_canceled_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_canceled_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_canceled_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Execution Report Pending Cancel Message
memx_options_memo_sbe_v1_3_size_of.execution_report_pending_cancel_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.orig_cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Execution Report Pending Cancel Message
memx_options_memo_sbe_v1_3_display.execution_report_pending_cancel_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Pending Cancel Message
memx_options_memo_sbe_v1_3_dissect.execution_report_pending_cancel_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Orig Cl Ord Id: 20 Byte Ascii String Nullable
  index, orig_cl_ord_id = memx_options_memo_sbe_v1_3_dissect.orig_cl_ord_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Pending Cancel Message
memx_options_memo_sbe_v1_3_dissect.execution_report_pending_cancel_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.execution_report_pending_cancel_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_pending_cancel_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_pending_cancel_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_pending_cancel_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_pending_cancel_message_fields(buffer, offset, packet, parent)
end

-- Size: Party Role
memx_options_memo_sbe_v1_3_size_of.party_role = 1

-- Display: Party Role
memx_options_memo_sbe_v1_3_display.party_role = function(value)
  if value == 1 then
    return "Party Role: Executing Firm Id (1)"
  end
  if value == 3 then
    return "Party Role: Actionable Identifier (3)"
  end
  if value == 14 then
    return "Party Role: Give Up Clearing Firm (14)"
  end
  if value == 17 then
    return "Party Role: Contra Efid (17)"
  end
  if value == 18 then
    return "Party Role: Contra Give Up (18)"
  end
  if value == 24 then
    return "Party Role: Optional Occ Data (24)"
  end
  if value == 37 then
    return "Party Role: Contra Mm Sub Account (37)"
  end
  if value == 40 then
    return "Party Role: Cmta (40)"
  end
  if value == 41 then
    return "Party Role: Contra Cmta (41)"
  end
  if value == 66 then
    return "Party Role: Market Maker Sub Account (66)"
  end

  return "Party Role: Unknown("..value..")"
end

-- Dissect: Party Role
memx_options_memo_sbe_v1_3_dissect.party_role = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.party_role
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.party_role(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.party_role, range, value, display)

  return offset + length, value
end

-- Size: Party Id Source
memx_options_memo_sbe_v1_3_size_of.party_id_source = 1

-- Display: Party Id Source
memx_options_memo_sbe_v1_3_display.party_id_source = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Party Id Source: No Value"
  end

  return "Party Id Source: "..value
end

-- Dissect: Party Id Source
memx_options_memo_sbe_v1_3_dissect.party_id_source = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.party_id_source
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.party_id_source(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.party_id_source, range, value, display)

  return offset + length, value
end

-- Size: Party Id
memx_options_memo_sbe_v1_3_size_of.party_id = 16

-- Display: Party Id
memx_options_memo_sbe_v1_3_display.party_id = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Party Id: No Value"
  end

  return "Party Id: "..value
end

-- Dissect: Party Id
memx_options_memo_sbe_v1_3_dissect.party_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.party_id
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.party_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.party_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Parties Group
memx_options_memo_sbe_v1_3_size_of.parties_group = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.party_id

  index = index + memx_options_memo_sbe_v1_3_size_of.party_id_source

  index = index + memx_options_memo_sbe_v1_3_size_of.party_role

  return index
end

-- Display: Parties Group
memx_options_memo_sbe_v1_3_display.parties_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Parties Group
memx_options_memo_sbe_v1_3_dissect.parties_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Party Id: 16 Byte Ascii String
  index, party_id = memx_options_memo_sbe_v1_3_dissect.party_id(buffer, index, packet, parent)

  -- Party Id Source: 1 Byte Ascii String
  index, party_id_source = memx_options_memo_sbe_v1_3_dissect.party_id_source(buffer, index, packet, parent)

  -- Party Role: 1 Byte Unsigned Fixed Width Integer Enum with 10 values
  index, party_role = memx_options_memo_sbe_v1_3_dissect.party_role(buffer, index, packet, parent)

  return index
end

-- Dissect: Parties Group
memx_options_memo_sbe_v1_3_dissect.parties_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.parties_group then
    local length = memx_options_memo_sbe_v1_3_size_of.parties_group(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.parties_group(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.parties_group, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.parties_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Parties Groups
memx_options_memo_sbe_v1_3_size_of.parties_groups = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.repeating_group_dimensions(buffer, offset + index)

  -- Calculate field size from count
  local parties_group_count = buffer(offset + index - 1, 1):uint()
  index = index + parties_group_count * 18

  return index
end

-- Display: Parties Groups
memx_options_memo_sbe_v1_3_display.parties_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Parties Groups
memx_options_memo_sbe_v1_3_dissect.parties_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Repeating Group Dimensions: Struct of 2 fields
  index, repeating_group_dimensions = memx_options_memo_sbe_v1_3_dissect.repeating_group_dimensions(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):uint()

  -- Parties Group: Struct of 3 fields
  for i = 1, num_in_group do
    index = memx_options_memo_sbe_v1_3_dissect.parties_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Parties Groups
memx_options_memo_sbe_v1_3_dissect.parties_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.parties_groups then
    local length = memx_options_memo_sbe_v1_3_size_of.parties_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.parties_groups(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.parties_groups, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.parties_groups_fields(buffer, offset, packet, parent)
end

-- Size: Contra Trading Capacity
memx_options_memo_sbe_v1_3_size_of.contra_trading_capacity = 1

-- Display: Contra Trading Capacity
memx_options_memo_sbe_v1_3_display.contra_trading_capacity = function(value)
  if value == 1 then
    return "Contra Trading Capacity: Customer (1)"
  end
  if value == 2 then
    return "Contra Trading Capacity: Professional Customer (2)"
  end
  if value == 3 then
    return "Contra Trading Capacity: Broker Dealer (3)"
  end
  if value == 4 then
    return "Contra Trading Capacity: Broker Dealer Customer (4)"
  end
  if value == 5 then
    return "Contra Trading Capacity: Firm (5)"
  end
  if value == 6 then
    return "Contra Trading Capacity: Market Maker (6)"
  end
  if value == 7 then
    return "Contra Trading Capacity: Away Market Maker (7)"
  end
  if value == 255 then
    return "Contra Trading Capacity: Null Value (255)"
  end

  return "Contra Trading Capacity: Unknown("..value..")"
end

-- Dissect: Contra Trading Capacity
memx_options_memo_sbe_v1_3_dissect.contra_trading_capacity = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.contra_trading_capacity
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.contra_trading_capacity(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.contra_trading_capacity, range, value, display)

  return offset + length, value
end

-- Size: Last Mkt
memx_options_memo_sbe_v1_3_size_of.last_mkt = 4

-- Display: Last Mkt
memx_options_memo_sbe_v1_3_display.last_mkt = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Last Mkt: No Value"
  end

  return "Last Mkt: "..value
end

-- Dissect: Last Mkt
memx_options_memo_sbe_v1_3_dissect.last_mkt = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.last_mkt
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.last_mkt(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.last_mkt, range, value, display)

  return offset + length, value
end

-- Size: Last Liquidity Ind
memx_options_memo_sbe_v1_3_size_of.last_liquidity_ind = 1

-- Display: Last Liquidity Ind
memx_options_memo_sbe_v1_3_display.last_liquidity_ind = function(value)
  if value == 1 then
    return "Last Liquidity Ind: Added (1)"
  end
  if value == 2 then
    return "Last Liquidity Ind: Removed (2)"
  end
  if value == 255 then
    return "Last Liquidity Ind: Null Value (255)"
  end

  return "Last Liquidity Ind: Unknown("..value..")"
end

-- Dissect: Last Liquidity Ind
memx_options_memo_sbe_v1_3_dissect.last_liquidity_ind = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.last_liquidity_ind
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.last_liquidity_ind(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.last_liquidity_ind, range, value, display)

  return offset + length, value
end

-- Calculate size of: Execution Report Trade Message
memx_options_memo_sbe_v1_3_size_of.execution_report_trade_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.trd_match_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.last_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.last_px

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.transact_time

  index = index + memx_options_memo_sbe_v1_3_size_of.last_liquidity_ind

  index = index + memx_options_memo_sbe_v1_3_size_of.last_mkt

  index = index + memx_options_memo_sbe_v1_3_size_of.open_or_close

  index = index + memx_options_memo_sbe_v1_3_size_of.trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.contra_trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_21

  index = index + memx_options_memo_sbe_v1_3_size_of.parties_groups(buffer, offset + index)

  return index
end

-- Display: Execution Report Trade Message
memx_options_memo_sbe_v1_3_display.execution_report_trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Trade Message
memx_options_memo_sbe_v1_3_dissect.execution_report_trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Trd Match Id: 8 Byte Unsigned Fixed Width Integer
  index, trd_match_id = memx_options_memo_sbe_v1_3_dissect.trd_match_id(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Last Qty: 4 Byte Unsigned Fixed Width Integer Nullable
  index, last_qty = memx_options_memo_sbe_v1_3_dissect.last_qty(buffer, index, packet, parent)

  -- Last Px: 1 Byte Signed Fixed Width Integer
  index, last_px = memx_options_memo_sbe_v1_3_dissect.last_px(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Transact Time: 1 Byte Unsigned Fixed Width Integer
  index, transact_time = memx_options_memo_sbe_v1_3_dissect.transact_time(buffer, index, packet, parent)

  -- Last Liquidity Ind: 1 Byte Unsigned Fixed Width Integer Enum with 3 values
  index, last_liquidity_ind = memx_options_memo_sbe_v1_3_dissect.last_liquidity_ind(buffer, index, packet, parent)

  -- Last Mkt: 4 Byte Ascii String
  index, last_mkt = memx_options_memo_sbe_v1_3_dissect.last_mkt(buffer, index, packet, parent)

  -- Open Or Close: 1 Byte Ascii String Enum with 4 values
  index, open_or_close = memx_options_memo_sbe_v1_3_dissect.open_or_close(buffer, index, packet, parent)

  -- Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, trading_capacity = memx_options_memo_sbe_v1_3_dissect.trading_capacity(buffer, index, packet, parent)

  -- Contra Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, contra_trading_capacity = memx_options_memo_sbe_v1_3_dissect.contra_trading_capacity(buffer, index, packet, parent)

  -- Padding 21
  index, padding_21 = memx_options_memo_sbe_v1_3_dissect.padding_21(buffer, index, packet, parent)

  -- Parties Groups: Struct of 2 fields
  index, parties_groups = memx_options_memo_sbe_v1_3_dissect.parties_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Trade Message
memx_options_memo_sbe_v1_3_dissect.execution_report_trade_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.execution_report_trade_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_trade_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_trade_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_trade_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_trade_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Execution Report Rejected Message
memx_options_memo_sbe_v1_3_size_of.execution_report_rejected_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.reject_reason

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Execution Report Rejected Message
memx_options_memo_sbe_v1_3_display.execution_report_rejected_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Rejected Message
memx_options_memo_sbe_v1_3_dissect.execution_report_rejected_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Reject Reason: 2 Byte Unsigned Fixed Width Integer Enum with 106 values
  index, reject_reason = memx_options_memo_sbe_v1_3_dissect.reject_reason(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Rejected Message
memx_options_memo_sbe_v1_3_dissect.execution_report_rejected_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.execution_report_rejected_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_rejected_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_rejected_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_rejected_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_rejected_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Execution Report Bulk Quote Component New Message
memx_options_memo_sbe_v1_3_size_of.execution_report_bulk_quote_component_new_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.order_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.transact_time

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_21

  return index
end

-- Display: Execution Report Bulk Quote Component New Message
memx_options_memo_sbe_v1_3_display.execution_report_bulk_quote_component_new_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Bulk Quote Component New Message
memx_options_memo_sbe_v1_3_dissect.execution_report_bulk_quote_component_new_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Order Qty: 4 Byte Unsigned Fixed Width Integer
  index, order_qty = memx_options_memo_sbe_v1_3_dissect.order_qty(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer Nullable
  index, price_price_type = memx_options_memo_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Transact Time: 1 Byte Unsigned Fixed Width Integer
  index, transact_time = memx_options_memo_sbe_v1_3_dissect.transact_time(buffer, index, packet, parent)

  -- Padding 21
  index, padding_21 = memx_options_memo_sbe_v1_3_dissect.padding_21(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Bulk Quote Component New Message
memx_options_memo_sbe_v1_3_dissect.execution_report_bulk_quote_component_new_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.execution_report_bulk_quote_component_new_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_bulk_quote_component_new_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_bulk_quote_component_new_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_bulk_quote_component_new_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_bulk_quote_component_new_message_fields(buffer, offset, packet, parent)
end

-- Size: Number Of Orders
memx_options_memo_sbe_v1_3_size_of.number_of_orders = 1

-- Display: Number Of Orders
memx_options_memo_sbe_v1_3_display.number_of_orders = function(value)
  return "Number Of Orders: "..value
end

-- Dissect: Number Of Orders
memx_options_memo_sbe_v1_3_dissect.number_of_orders = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.number_of_orders
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.number_of_orders(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.number_of_orders, range, value, display)

  return offset + length, value
end

-- Size: Risk Group Id
memx_options_memo_sbe_v1_3_size_of.risk_group_id = 2

-- Display: Risk Group Id
memx_options_memo_sbe_v1_3_display.risk_group_id = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Risk Group Id: No Value"
  end

  return "Risk Group Id: "..value
end

-- Dissect: Risk Group Id
memx_options_memo_sbe_v1_3_dissect.risk_group_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.risk_group_id
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.risk_group_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.risk_group_id, range, value, display)

  return offset + length, value
end

-- Size: Match Trade Prevention
memx_options_memo_sbe_v1_3_size_of.match_trade_prevention = 1

-- Display: Match Trade Prevention
memx_options_memo_sbe_v1_3_display.match_trade_prevention = function(value)
  if value == 0 then
    return "Match Trade Prevention: Cancel Newest (0)"
  end
  if value == 1 then
    return "Match Trade Prevention: Cancel Oldest (1)"
  end
  if value == 3 then
    return "Match Trade Prevention: Cancel Both (3)"
  end
  if value == 255 then
    return "Match Trade Prevention: Null Value (255)"
  end
  if value == 255 then
    return "Match Trade Prevention: No Value"
  end

  return "Match Trade Prevention: Unknown("..value..")"
end

-- Dissect: Match Trade Prevention
memx_options_memo_sbe_v1_3_dissect.match_trade_prevention = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.match_trade_prevention
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.match_trade_prevention(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.match_trade_prevention, range, value, display)

  return offset + length, value
end

-- Size: Mtp Group Id
memx_options_memo_sbe_v1_3_size_of.mtp_group_id = 2

-- Display: Mtp Group Id
memx_options_memo_sbe_v1_3_display.mtp_group_id = function(value)
  -- Check if field has value
  if value == 65535 then
    return "Mtp Group Id: No Value"
  end

  return "Mtp Group Id: "..value
end

-- Dissect: Mtp Group Id
memx_options_memo_sbe_v1_3_dissect.mtp_group_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.mtp_group_id
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.mtp_group_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.mtp_group_id, range, value, display)

  return offset + length, value
end

-- Size: Exec Inst
memx_options_memo_sbe_v1_3_size_of.exec_inst = 2

-- Display: Exec Inst
memx_options_memo_sbe_v1_3_display.exec_inst = function(buffer, packet, parent)
  local display = ""

  -- Is External Routing Not Allowed flag set?
  if buffer:bitfield(13) > 0 then
    display = display.."External Routing Not Allowed|"
  end
  -- Is Intermarket Sweep flag set?
  if buffer:bitfield(14) > 0 then
    display = display.."Intermarket Sweep|"
  end
  -- Is Participate Do Not Initiate flag set?
  if buffer:bitfield(15) > 0 then
    display = display.."Participate Do Not Initiate|"
  end

  return display:sub(1, -2)
end

-- Dissect Bit Fields: Exec Inst
memx_options_memo_sbe_v1_3_dissect.exec_inst_bits = function(buffer, offset, packet, parent)

  -- Reserved 13: 13 Bit
  parent:add(memx_options_memo_sbe_v1_3.fields.reserved_13, buffer(offset, 2))

  -- External Routing Not Allowed: 1 Bit
  parent:add(memx_options_memo_sbe_v1_3.fields.external_routing_not_allowed, buffer(offset, 2))

  -- Intermarket Sweep: 1 Bit
  parent:add(memx_options_memo_sbe_v1_3.fields.intermarket_sweep, buffer(offset, 2))

  -- Participate Do Not Initiate: 1 Bit
  parent:add(memx_options_memo_sbe_v1_3.fields.participate_do_not_initiate, buffer(offset, 2))
end

-- Dissect: Exec Inst
memx_options_memo_sbe_v1_3_dissect.exec_inst = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local display = memx_options_memo_sbe_v1_3_display.exec_inst(range, packet, parent)
  local element = parent:add(memx_options_memo_sbe_v1_3.fields.exec_inst, range, display)

  if show.exec_inst then
    memx_options_memo_sbe_v1_3_dissect.exec_inst_bits(buffer, offset, packet, element)
  end

  return offset + 2, range
end

-- Size: Time In Force
memx_options_memo_sbe_v1_3_size_of.time_in_force = 1

-- Display: Time In Force
memx_options_memo_sbe_v1_3_display.time_in_force = function(value)
  if value == "0" then
    return "Time In Force: Day (0)"
  end
  if value == "3" then
    return "Time In Force: Immediate Or Cancel (3)"
  end

  return "Time In Force: Unknown("..value..")"
end

-- Dissect: Time In Force
memx_options_memo_sbe_v1_3_dissect.time_in_force = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.time_in_force
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.time_in_force(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.time_in_force, range, value, display)

  return offset + length, value
end

-- Size: Symbol
memx_options_memo_sbe_v1_3_size_of.symbol = 6

-- Display: Symbol
memx_options_memo_sbe_v1_3_display.symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol: No Value"
  end

  return "Symbol: "..value
end

-- Dissect: Symbol
memx_options_memo_sbe_v1_3_dissect.symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.symbol
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Execution Report Bulk Quote Pending New Message
memx_options_memo_sbe_v1_3_size_of.execution_report_bulk_quote_pending_new_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.symbol

  index = index + memx_options_memo_sbe_v1_3_size_of.time_in_force

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.transact_time

  index = index + memx_options_memo_sbe_v1_3_size_of.mtp_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.match_trade_prevention

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.risk_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.number_of_orders

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_14

  index = index + memx_options_memo_sbe_v1_3_size_of.parties_groups(buffer, offset + index)

  return index
end

-- Display: Execution Report Bulk Quote Pending New Message
memx_options_memo_sbe_v1_3_display.execution_report_bulk_quote_pending_new_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report Bulk Quote Pending New Message
memx_options_memo_sbe_v1_3_dissect.execution_report_bulk_quote_pending_new_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Symbol: 6 Byte Ascii String
  index, symbol = memx_options_memo_sbe_v1_3_dissect.symbol(buffer, index, packet, parent)

  -- Time In Force: 1 Byte Ascii String Enum with 2 values
  index, time_in_force = memx_options_memo_sbe_v1_3_dissect.time_in_force(buffer, index, packet, parent)

  -- Exec Inst: Struct of 4 fields
  index, exec_inst = memx_options_memo_sbe_v1_3_dissect.exec_inst(buffer, index, packet, parent)

  -- Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, trading_capacity = memx_options_memo_sbe_v1_3_dissect.trading_capacity(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Transact Time: 1 Byte Unsigned Fixed Width Integer
  index, transact_time = memx_options_memo_sbe_v1_3_dissect.transact_time(buffer, index, packet, parent)

  -- Mtp Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, mtp_group_id = memx_options_memo_sbe_v1_3_dissect.mtp_group_id(buffer, index, packet, parent)

  -- Match Trade Prevention: 1 Byte Unsigned Fixed Width Integer Enum with 5 values
  index, match_trade_prevention = memx_options_memo_sbe_v1_3_dissect.match_trade_prevention(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Risk Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, risk_group_id = memx_options_memo_sbe_v1_3_dissect.risk_group_id(buffer, index, packet, parent)

  -- Number Of Orders: 1 Byte Unsigned Fixed Width Integer
  index, number_of_orders = memx_options_memo_sbe_v1_3_dissect.number_of_orders(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memo_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  -- Parties Groups: Struct of 2 fields
  index, parties_groups = memx_options_memo_sbe_v1_3_dissect.parties_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report Bulk Quote Pending New Message
memx_options_memo_sbe_v1_3_dissect.execution_report_bulk_quote_pending_new_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.execution_report_bulk_quote_pending_new_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_bulk_quote_pending_new_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_bulk_quote_pending_new_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_bulk_quote_pending_new_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_bulk_quote_pending_new_message_fields(buffer, offset, packet, parent)
end

-- Size: Reprice Behavior
memx_options_memo_sbe_v1_3_size_of.reprice_behavior = 1

-- Display: Reprice Behavior
memx_options_memo_sbe_v1_3_display.reprice_behavior = function(value)
  if value == 1 then
    return "Reprice Behavior: Reprice Lock Cancel Cross (1)"
  end
  if value == 2 then
    return "Reprice Behavior: Reprice Lock Reprice Cross (2)"
  end
  if value == 255 then
    return "Reprice Behavior: Null Value (255)"
  end
  if value == 255 then
    return "Reprice Behavior: No Value"
  end

  return "Reprice Behavior: Unknown("..value..")"
end

-- Dissect: Reprice Behavior
memx_options_memo_sbe_v1_3_dissect.reprice_behavior = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.reprice_behavior
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.reprice_behavior(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.reprice_behavior, range, value, display)

  return offset + length, value
end

-- Size: Reprice Frequency
memx_options_memo_sbe_v1_3_size_of.reprice_frequency = 1

-- Display: Reprice Frequency
memx_options_memo_sbe_v1_3_display.reprice_frequency = function(value)
  if value == 0 then
    return "Reprice Frequency: Single Reprice (0)"
  end
  if value == 1 then
    return "Reprice Frequency: Continuous Reprice (1)"
  end
  if value == 2 then
    return "Reprice Frequency: None (2)"
  end
  if value == 255 then
    return "Reprice Frequency: Null Value (255)"
  end
  if value == 255 then
    return "Reprice Frequency: No Value"
  end

  return "Reprice Frequency: Unknown("..value..")"
end

-- Dissect: Reprice Frequency
memx_options_memo_sbe_v1_3_dissect.reprice_frequency = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.reprice_frequency
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.reprice_frequency(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.reprice_frequency, range, value, display)

  return offset + length, value
end

-- Calculate size of: Execution Report New Message
memx_options_memo_sbe_v1_3_size_of.execution_report_new_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_id

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_status

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.order_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_type

  index = index + memx_options_memo_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memo_sbe_v1_3_size_of.time_in_force

  index = index + memx_options_memo_sbe_v1_3_size_of.open_or_close

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.reprice_frequency

  index = index + memx_options_memo_sbe_v1_3_size_of.reprice_behavior

  index = index + memx_options_memo_sbe_v1_3_size_of.leaves_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.cum_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.transact_time

  index = index + memx_options_memo_sbe_v1_3_size_of.mtp_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.match_trade_prevention

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.risk_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_21

  index = index + memx_options_memo_sbe_v1_3_size_of.parties_groups(buffer, offset + index)

  return index
end

-- Display: Execution Report New Message
memx_options_memo_sbe_v1_3_display.execution_report_new_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Execution Report New Message
memx_options_memo_sbe_v1_3_dissect.execution_report_new_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Unsigned Fixed Width Integer
  index, exec_id = memx_options_memo_sbe_v1_3_dissect.exec_id(buffer, index, packet, parent)

  -- Ord Status: 1 Byte Ascii String Enum with 8 values
  index, ord_status = memx_options_memo_sbe_v1_3_dissect.ord_status(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Order Qty: 4 Byte Unsigned Fixed Width Integer
  index, order_qty = memx_options_memo_sbe_v1_3_dissect.order_qty(buffer, index, packet, parent)

  -- Ord Type: 1 Byte Ascii String Enum with 2 values
  index, ord_type = memx_options_memo_sbe_v1_3_dissect.ord_type(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer Nullable
  index, price_price_type = memx_options_memo_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Time In Force: 1 Byte Ascii String Enum with 2 values
  index, time_in_force = memx_options_memo_sbe_v1_3_dissect.time_in_force(buffer, index, packet, parent)

  -- Open Or Close: 1 Byte Ascii String Enum with 4 values
  index, open_or_close = memx_options_memo_sbe_v1_3_dissect.open_or_close(buffer, index, packet, parent)

  -- Exec Inst: Struct of 4 fields
  index, exec_inst = memx_options_memo_sbe_v1_3_dissect.exec_inst(buffer, index, packet, parent)

  -- Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, trading_capacity = memx_options_memo_sbe_v1_3_dissect.trading_capacity(buffer, index, packet, parent)

  -- Reprice Frequency: 1 Byte Unsigned Fixed Width Integer Enum with 5 values
  index, reprice_frequency = memx_options_memo_sbe_v1_3_dissect.reprice_frequency(buffer, index, packet, parent)

  -- Reprice Behavior: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, reprice_behavior = memx_options_memo_sbe_v1_3_dissect.reprice_behavior(buffer, index, packet, parent)

  -- Leaves Qty: 4 Byte Unsigned Fixed Width Integer
  index, leaves_qty = memx_options_memo_sbe_v1_3_dissect.leaves_qty(buffer, index, packet, parent)

  -- Cum Qty: 4 Byte Unsigned Fixed Width Integer
  index, cum_qty = memx_options_memo_sbe_v1_3_dissect.cum_qty(buffer, index, packet, parent)

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Transact Time: 1 Byte Unsigned Fixed Width Integer
  index, transact_time = memx_options_memo_sbe_v1_3_dissect.transact_time(buffer, index, packet, parent)

  -- Mtp Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, mtp_group_id = memx_options_memo_sbe_v1_3_dissect.mtp_group_id(buffer, index, packet, parent)

  -- Match Trade Prevention: 1 Byte Unsigned Fixed Width Integer Enum with 5 values
  index, match_trade_prevention = memx_options_memo_sbe_v1_3_dissect.match_trade_prevention(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Risk Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, risk_group_id = memx_options_memo_sbe_v1_3_dissect.risk_group_id(buffer, index, packet, parent)

  -- Padding 21
  index, padding_21 = memx_options_memo_sbe_v1_3_dissect.padding_21(buffer, index, packet, parent)

  -- Parties Groups: Struct of 2 fields
  index, parties_groups = memx_options_memo_sbe_v1_3_dissect.parties_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Execution Report New Message
memx_options_memo_sbe_v1_3_dissect.execution_report_new_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.execution_report_new_message then
    local length = memx_options_memo_sbe_v1_3_size_of.execution_report_new_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.execution_report_new_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.execution_report_new_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.execution_report_new_message_fields(buffer, offset, packet, parent)
end

-- Size: Ref Alloc Report Id
memx_options_memo_sbe_v1_3_size_of.ref_alloc_report_id = 8

-- Display: Ref Alloc Report Id
memx_options_memo_sbe_v1_3_display.ref_alloc_report_id = function(value)
  -- Check if field has value
  if value == UInt64(0xFFFFFFFF, 0xFFFFFFFF) then
    return "Ref Alloc Report Id: No Value"
  end

  return "Ref Alloc Report Id: "..value
end

-- Dissect: Ref Alloc Report Id
memx_options_memo_sbe_v1_3_dissect.ref_alloc_report_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.ref_alloc_report_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.ref_alloc_report_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.ref_alloc_report_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Allocation Instruction Message
memx_options_memo_sbe_v1_3_size_of.allocation_instruction_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_id

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_trans_type

  index = index + memx_options_memo_sbe_v1_3_size_of.alloc_type

  index = index + memx_options_memo_sbe_v1_3_size_of.ref_alloc_report_id

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_ref_id

  index = index + memx_options_memo_sbe_v1_3_size_of.trd_match_id

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.quantity_uint_32

  index = index + memx_options_memo_sbe_v1_3_size_of.trade_date

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  index = index + memx_options_memo_sbe_v1_3_size_of.allocations_groups(buffer, offset + index)

  return index
end

-- Display: Allocation Instruction Message
memx_options_memo_sbe_v1_3_display.allocation_instruction_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Allocation Instruction Message
memx_options_memo_sbe_v1_3_dissect.allocation_instruction_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Alloc Id: 20 Byte Ascii String
  index, alloc_id = memx_options_memo_sbe_v1_3_dissect.alloc_id(buffer, index, packet, parent)

  -- Alloc Trans Type: 1 Byte Unsigned Fixed Width Integer Enum with 3 values
  index, alloc_trans_type = memx_options_memo_sbe_v1_3_dissect.alloc_trans_type(buffer, index, packet, parent)

  -- Alloc Type: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, alloc_type = memx_options_memo_sbe_v1_3_dissect.alloc_type(buffer, index, packet, parent)

  -- Ref Alloc Report Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, ref_alloc_report_id = memx_options_memo_sbe_v1_3_dissect.ref_alloc_report_id(buffer, index, packet, parent)

  -- Exec Ref Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, exec_ref_id = memx_options_memo_sbe_v1_3_dissect.exec_ref_id(buffer, index, packet, parent)

  -- Trd Match Id: 8 Byte Unsigned Fixed Width Integer
  index, trd_match_id = memx_options_memo_sbe_v1_3_dissect.trd_match_id(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Quantity uint 32: 4 Byte Unsigned Fixed Width Integer
  index, quantity_uint_32 = memx_options_memo_sbe_v1_3_dissect.quantity_uint_32(buffer, index, packet, parent)

  -- Trade Date: 8 Byte Ascii String
  index, trade_date = memx_options_memo_sbe_v1_3_dissect.trade_date(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  -- Allocations Groups: Struct of 2 fields
  index, allocations_groups = memx_options_memo_sbe_v1_3_dissect.allocations_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Allocation Instruction Message
memx_options_memo_sbe_v1_3_dissect.allocation_instruction_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.allocation_instruction_message then
    local length = memx_options_memo_sbe_v1_3_size_of.allocation_instruction_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.allocation_instruction_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.allocation_instruction_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.allocation_instruction_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Mass Cancel Clear Lockout Request Message
memx_options_memo_sbe_v1_3_size_of.mass_cancel_clear_lockout_request_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.lockout_id

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Mass Cancel Clear Lockout Request Message
memx_options_memo_sbe_v1_3_display.mass_cancel_clear_lockout_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Mass Cancel Clear Lockout Request Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Lockout Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, lockout_id = memx_options_memo_sbe_v1_3_dissect.lockout_id(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Mass Cancel Clear Lockout Request Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.mass_cancel_clear_lockout_request_message then
    local length = memx_options_memo_sbe_v1_3_size_of.mass_cancel_clear_lockout_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.mass_cancel_clear_lockout_request_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.mass_cancel_clear_lockout_request_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_request_message_fields(buffer, offset, packet, parent)
end

-- Size: Underlier Mass Cancel Request Underlier
memx_options_memo_sbe_v1_3_size_of.underlier_mass_cancel_request_underlier = 6

-- Display: Underlier Mass Cancel Request Underlier
memx_options_memo_sbe_v1_3_display.underlier_mass_cancel_request_underlier = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Underlier Mass Cancel Request Underlier: No Value"
  end

  return "Underlier Mass Cancel Request Underlier: "..value
end

-- Dissect: Underlier Mass Cancel Request Underlier
memx_options_memo_sbe_v1_3_dissect.underlier_mass_cancel_request_underlier = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.underlier_mass_cancel_request_underlier
  local range = buffer(offset, length)

  -- parse last octet
  local last = buffer(offset + length - 1, 1):uint()

  -- read full string or up to first zero
  local value = ''
  if last == 0 then
    value = range:stringz()
  else
    value = range:string()
  end

  local display = memx_options_memo_sbe_v1_3_display.underlier_mass_cancel_request_underlier(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.underlier_mass_cancel_request_underlier, range, value, display)

  return offset + length, value
end

-- Calculate size of: Mass Cancel Request Message
memx_options_memo_sbe_v1_3_size_of.mass_cancel_request_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.efid

  index = index + memx_options_memo_sbe_v1_3_size_of.underlying_or_series

  index = index + memx_options_memo_sbe_v1_3_size_of.underlier_mass_cancel_request_underlier

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.mass_cancel_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Mass Cancel Request Message
memx_options_memo_sbe_v1_3_display.mass_cancel_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Mass Cancel Request Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Efid: 4 Byte Ascii String Nullable
  index, efid = memx_options_memo_sbe_v1_3_dissect.efid(buffer, index, packet, parent)

  -- Underlying Or Series: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, underlying_or_series = memx_options_memo_sbe_v1_3_dissect.underlying_or_series(buffer, index, packet, parent)

  -- Underlier Mass Cancel Request Underlier: 6 Byte Ascii String Nullable
  index, underlier_mass_cancel_request_underlier = memx_options_memo_sbe_v1_3_dissect.underlier_mass_cancel_request_underlier(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Mass Cancel Inst: Struct of 4 fields
  index, mass_cancel_inst = memx_options_memo_sbe_v1_3_dissect.mass_cancel_inst(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Mass Cancel Request Message
memx_options_memo_sbe_v1_3_dissect.mass_cancel_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.mass_cancel_request_message then
    local length = memx_options_memo_sbe_v1_3_size_of.mass_cancel_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.mass_cancel_request_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.mass_cancel_request_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.mass_cancel_request_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Order Cancel Request Message
memx_options_memo_sbe_v1_3_size_of.order_cancel_request_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.orig_cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Order Cancel Request Message
memx_options_memo_sbe_v1_3_display.order_cancel_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Cancel Request Message
memx_options_memo_sbe_v1_3_dissect.order_cancel_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Orig Cl Ord Id: 20 Byte Ascii String Nullable
  index, orig_cl_ord_id = memx_options_memo_sbe_v1_3_dissect.orig_cl_ord_id(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Cancel Request Message
memx_options_memo_sbe_v1_3_dissect.order_cancel_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_cancel_request_message then
    local length = memx_options_memo_sbe_v1_3_size_of.order_cancel_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.order_cancel_request_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.order_cancel_request_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.order_cancel_request_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Order Cancel Replace Request Message
memx_options_memo_sbe_v1_3_size_of.order_cancel_replace_request_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.order_id

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.orig_cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.order_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_type

  index = index + memx_options_memo_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_14

  return index
end

-- Display: Order Cancel Replace Request Message
memx_options_memo_sbe_v1_3_display.order_cancel_replace_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Cancel Replace Request Message
memx_options_memo_sbe_v1_3_dissect.order_cancel_replace_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Order Id: 8 Byte Unsigned Fixed Width Integer Nullable
  index, order_id = memx_options_memo_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Orig Cl Ord Id: 20 Byte Ascii String Nullable
  index, orig_cl_ord_id = memx_options_memo_sbe_v1_3_dissect.orig_cl_ord_id(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Order Qty: 4 Byte Unsigned Fixed Width Integer
  index, order_qty = memx_options_memo_sbe_v1_3_dissect.order_qty(buffer, index, packet, parent)

  -- Ord Type: 1 Byte Ascii String Enum with 2 values
  index, ord_type = memx_options_memo_sbe_v1_3_dissect.ord_type(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer Nullable
  index, price_price_type = memx_options_memo_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memo_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Cancel Replace Request Message
memx_options_memo_sbe_v1_3_dissect.order_cancel_replace_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_cancel_replace_request_message then
    local length = memx_options_memo_sbe_v1_3_size_of.order_cancel_replace_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.order_cancel_replace_request_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.order_cancel_replace_request_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.order_cancel_replace_request_message_fields(buffer, offset, packet, parent)
end

-- Size: Offer Px
memx_options_memo_sbe_v1_3_size_of.offer_px = 1

-- Display: Offer Px
memx_options_memo_sbe_v1_3_display.offer_px = function(value)
  return "Offer Px: "..value
end

-- Dissect: Offer Px
memx_options_memo_sbe_v1_3_dissect.offer_px = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.offer_px
  local range = buffer(offset, length)
  local value = range:int()
  local display = memx_options_memo_sbe_v1_3_display.offer_px(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.offer_px, range, value, display)

  return offset + length, value
end

-- Size: Offer Size
memx_options_memo_sbe_v1_3_size_of.offer_size = 2

-- Display: Offer Size
memx_options_memo_sbe_v1_3_display.offer_size = function(value)
  return "Offer Size: "..value
end

-- Dissect: Offer Size
memx_options_memo_sbe_v1_3_dissect.offer_size = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.offer_size
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.offer_size(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.offer_size, range, value, display)

  return offset + length, value
end

-- Size: Bid Px
memx_options_memo_sbe_v1_3_size_of.bid_px = 1

-- Display: Bid Px
memx_options_memo_sbe_v1_3_display.bid_px = function(value)
  return "Bid Px: "..value
end

-- Dissect: Bid Px
memx_options_memo_sbe_v1_3_dissect.bid_px = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.bid_px
  local range = buffer(offset, length)
  local value = range:int()
  local display = memx_options_memo_sbe_v1_3_display.bid_px(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.bid_px, range, value, display)

  return offset + length, value
end

-- Size: Bid Size
memx_options_memo_sbe_v1_3_size_of.bid_size = 2

-- Display: Bid Size
memx_options_memo_sbe_v1_3_display.bid_size = function(value)
  return "Bid Size: "..value
end

-- Dissect: Bid Size
memx_options_memo_sbe_v1_3_dissect.bid_size = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.bid_size
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.bid_size(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.bid_size, range, value, display)

  return offset + length, value
end

-- Calculate size of: Quotes Group
memx_options_memo_sbe_v1_3_size_of.quotes_group = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.list_seq_no

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.bid_size

  index = index + memx_options_memo_sbe_v1_3_size_of.bid_px

  index = index + memx_options_memo_sbe_v1_3_size_of.offer_size

  index = index + memx_options_memo_sbe_v1_3_size_of.offer_px

  return index
end

-- Display: Quotes Group
memx_options_memo_sbe_v1_3_display.quotes_group = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Quotes Group
memx_options_memo_sbe_v1_3_dissect.quotes_group_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- List Seq No: 1 Byte Unsigned Fixed Width Integer
  index, list_seq_no = memx_options_memo_sbe_v1_3_dissect.list_seq_no(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Bid Size: 2 Byte Unsigned Fixed Width Integer
  index, bid_size = memx_options_memo_sbe_v1_3_dissect.bid_size(buffer, index, packet, parent)

  -- Bid Px: 1 Byte Signed Fixed Width Integer
  index, bid_px = memx_options_memo_sbe_v1_3_dissect.bid_px(buffer, index, packet, parent)

  -- Offer Size: 2 Byte Unsigned Fixed Width Integer
  index, offer_size = memx_options_memo_sbe_v1_3_dissect.offer_size(buffer, index, packet, parent)

  -- Offer Px: 1 Byte Signed Fixed Width Integer
  index, offer_px = memx_options_memo_sbe_v1_3_dissect.offer_px(buffer, index, packet, parent)

  return index
end

-- Dissect: Quotes Group
memx_options_memo_sbe_v1_3_dissect.quotes_group = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.quotes_group then
    local length = memx_options_memo_sbe_v1_3_size_of.quotes_group(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.quotes_group(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.quotes_group, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.quotes_group_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Quotes Groups
memx_options_memo_sbe_v1_3_size_of.quotes_groups = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.repeating_group_dimensions(buffer, offset + index)

  -- Calculate field size from count
  local quotes_group_count = buffer(offset + index - 1, 1):uint()
  index = index + quotes_group_count * 15

  return index
end

-- Display: Quotes Groups
memx_options_memo_sbe_v1_3_display.quotes_groups = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Quotes Groups
memx_options_memo_sbe_v1_3_dissect.quotes_groups_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Repeating Group Dimensions: Struct of 2 fields
  index, repeating_group_dimensions = memx_options_memo_sbe_v1_3_dissect.repeating_group_dimensions(buffer, index, packet, parent)

  -- Dependency element: Num In Group
  local num_in_group = buffer(index - 1, 1):uint()

  -- Quotes Group: Struct of 6 fields
  for i = 1, num_in_group do
    index = memx_options_memo_sbe_v1_3_dissect.quotes_group(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Quotes Groups
memx_options_memo_sbe_v1_3_dissect.quotes_groups = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.quotes_groups then
    local length = memx_options_memo_sbe_v1_3_size_of.quotes_groups(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.quotes_groups(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.quotes_groups, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.quotes_groups_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Long One Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_size_of.long_one_sided_bulk_quote_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.time_in_force

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.mtp_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.match_trade_prevention

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.risk_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  index = index + memx_options_memo_sbe_v1_3_size_of.parties_groups(buffer, offset + index)

  index = index + memx_options_memo_sbe_v1_3_size_of.quotes_groups(buffer, offset + index)

  return index
end

-- Display: Long One Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_display.long_one_sided_bulk_quote_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Long One Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_dissect.long_one_sided_bulk_quote_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Time In Force: 1 Byte Ascii String Enum with 2 values
  index, time_in_force = memx_options_memo_sbe_v1_3_dissect.time_in_force(buffer, index, packet, parent)

  -- Exec Inst: Struct of 4 fields
  index, exec_inst = memx_options_memo_sbe_v1_3_dissect.exec_inst(buffer, index, packet, parent)

  -- Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, trading_capacity = memx_options_memo_sbe_v1_3_dissect.trading_capacity(buffer, index, packet, parent)

  -- Mtp Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, mtp_group_id = memx_options_memo_sbe_v1_3_dissect.mtp_group_id(buffer, index, packet, parent)

  -- Match Trade Prevention: 1 Byte Unsigned Fixed Width Integer Enum with 5 values
  index, match_trade_prevention = memx_options_memo_sbe_v1_3_dissect.match_trade_prevention(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Risk Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, risk_group_id = memx_options_memo_sbe_v1_3_dissect.risk_group_id(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  -- Parties Groups: Struct of 2 fields
  index, parties_groups = memx_options_memo_sbe_v1_3_dissect.parties_groups(buffer, index, packet, parent)

  -- Quotes Groups: Struct of 2 fields
  index, quotes_groups = memx_options_memo_sbe_v1_3_dissect.quotes_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Long One Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_dissect.long_one_sided_bulk_quote_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.long_one_sided_bulk_quote_message then
    local length = memx_options_memo_sbe_v1_3_size_of.long_one_sided_bulk_quote_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.long_one_sided_bulk_quote_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.long_one_sided_bulk_quote_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.long_one_sided_bulk_quote_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Short One Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_size_of.short_one_sided_bulk_quote_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.time_in_force

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.mtp_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.match_trade_prevention

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.risk_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  index = index + memx_options_memo_sbe_v1_3_size_of.parties_groups(buffer, offset + index)

  index = index + memx_options_memo_sbe_v1_3_size_of.quotes_groups(buffer, offset + index)

  return index
end

-- Display: Short One Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_display.short_one_sided_bulk_quote_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Short One Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_dissect.short_one_sided_bulk_quote_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Time In Force: 1 Byte Ascii String Enum with 2 values
  index, time_in_force = memx_options_memo_sbe_v1_3_dissect.time_in_force(buffer, index, packet, parent)

  -- Exec Inst: Struct of 4 fields
  index, exec_inst = memx_options_memo_sbe_v1_3_dissect.exec_inst(buffer, index, packet, parent)

  -- Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, trading_capacity = memx_options_memo_sbe_v1_3_dissect.trading_capacity(buffer, index, packet, parent)

  -- Mtp Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, mtp_group_id = memx_options_memo_sbe_v1_3_dissect.mtp_group_id(buffer, index, packet, parent)

  -- Match Trade Prevention: 1 Byte Unsigned Fixed Width Integer Enum with 5 values
  index, match_trade_prevention = memx_options_memo_sbe_v1_3_dissect.match_trade_prevention(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Risk Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, risk_group_id = memx_options_memo_sbe_v1_3_dissect.risk_group_id(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  -- Parties Groups: Struct of 2 fields
  index, parties_groups = memx_options_memo_sbe_v1_3_dissect.parties_groups(buffer, index, packet, parent)

  -- Quotes Groups: Struct of 2 fields
  index, quotes_groups = memx_options_memo_sbe_v1_3_dissect.quotes_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Short One Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_dissect.short_one_sided_bulk_quote_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.short_one_sided_bulk_quote_message then
    local length = memx_options_memo_sbe_v1_3_size_of.short_one_sided_bulk_quote_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.short_one_sided_bulk_quote_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.short_one_sided_bulk_quote_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.short_one_sided_bulk_quote_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Long Two Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_size_of.long_two_sided_bulk_quote_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.time_in_force

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.mtp_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.match_trade_prevention

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.risk_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  index = index + memx_options_memo_sbe_v1_3_size_of.parties_groups(buffer, offset + index)

  index = index + memx_options_memo_sbe_v1_3_size_of.quotes_groups(buffer, offset + index)

  return index
end

-- Display: Long Two Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_display.long_two_sided_bulk_quote_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Long Two Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_dissect.long_two_sided_bulk_quote_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Time In Force: 1 Byte Ascii String Enum with 2 values
  index, time_in_force = memx_options_memo_sbe_v1_3_dissect.time_in_force(buffer, index, packet, parent)

  -- Exec Inst: Struct of 4 fields
  index, exec_inst = memx_options_memo_sbe_v1_3_dissect.exec_inst(buffer, index, packet, parent)

  -- Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, trading_capacity = memx_options_memo_sbe_v1_3_dissect.trading_capacity(buffer, index, packet, parent)

  -- Mtp Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, mtp_group_id = memx_options_memo_sbe_v1_3_dissect.mtp_group_id(buffer, index, packet, parent)

  -- Match Trade Prevention: 1 Byte Unsigned Fixed Width Integer Enum with 5 values
  index, match_trade_prevention = memx_options_memo_sbe_v1_3_dissect.match_trade_prevention(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Risk Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, risk_group_id = memx_options_memo_sbe_v1_3_dissect.risk_group_id(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  -- Parties Groups: Struct of 2 fields
  index, parties_groups = memx_options_memo_sbe_v1_3_dissect.parties_groups(buffer, index, packet, parent)

  -- Quotes Groups: Struct of 2 fields
  index, quotes_groups = memx_options_memo_sbe_v1_3_dissect.quotes_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Long Two Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_dissect.long_two_sided_bulk_quote_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.long_two_sided_bulk_quote_message then
    local length = memx_options_memo_sbe_v1_3_size_of.long_two_sided_bulk_quote_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.long_two_sided_bulk_quote_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.long_two_sided_bulk_quote_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.long_two_sided_bulk_quote_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Short Two Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_size_of.short_two_sided_bulk_quote_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.time_in_force

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.mtp_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.match_trade_prevention

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.risk_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_7

  index = index + memx_options_memo_sbe_v1_3_size_of.parties_groups(buffer, offset + index)

  index = index + memx_options_memo_sbe_v1_3_size_of.quotes_groups(buffer, offset + index)

  return index
end

-- Display: Short Two Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_display.short_two_sided_bulk_quote_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Short Two Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_dissect.short_two_sided_bulk_quote_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Time In Force: 1 Byte Ascii String Enum with 2 values
  index, time_in_force = memx_options_memo_sbe_v1_3_dissect.time_in_force(buffer, index, packet, parent)

  -- Exec Inst: Struct of 4 fields
  index, exec_inst = memx_options_memo_sbe_v1_3_dissect.exec_inst(buffer, index, packet, parent)

  -- Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, trading_capacity = memx_options_memo_sbe_v1_3_dissect.trading_capacity(buffer, index, packet, parent)

  -- Mtp Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, mtp_group_id = memx_options_memo_sbe_v1_3_dissect.mtp_group_id(buffer, index, packet, parent)

  -- Match Trade Prevention: 1 Byte Unsigned Fixed Width Integer Enum with 5 values
  index, match_trade_prevention = memx_options_memo_sbe_v1_3_dissect.match_trade_prevention(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Risk Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, risk_group_id = memx_options_memo_sbe_v1_3_dissect.risk_group_id(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memo_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  -- Parties Groups: Struct of 2 fields
  index, parties_groups = memx_options_memo_sbe_v1_3_dissect.parties_groups(buffer, index, packet, parent)

  -- Quotes Groups: Struct of 2 fields
  index, quotes_groups = memx_options_memo_sbe_v1_3_dissect.quotes_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: Short Two Sided Bulk Quote Message
memx_options_memo_sbe_v1_3_dissect.short_two_sided_bulk_quote_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.short_two_sided_bulk_quote_message then
    local length = memx_options_memo_sbe_v1_3_size_of.short_two_sided_bulk_quote_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.short_two_sided_bulk_quote_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.short_two_sided_bulk_quote_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.short_two_sided_bulk_quote_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: New Order Single Message
memx_options_memo_sbe_v1_3_size_of.new_order_single_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sending_time

  index = index + memx_options_memo_sbe_v1_3_size_of.cl_ord_id

  index = index + memx_options_memo_sbe_v1_3_size_of.options_security_id

  index = index + memx_options_memo_sbe_v1_3_size_of.side

  index = index + memx_options_memo_sbe_v1_3_size_of.order_qty

  index = index + memx_options_memo_sbe_v1_3_size_of.ord_type

  index = index + memx_options_memo_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memo_sbe_v1_3_size_of.time_in_force

  index = index + memx_options_memo_sbe_v1_3_size_of.open_or_close

  index = index + memx_options_memo_sbe_v1_3_size_of.exec_inst

  index = index + memx_options_memo_sbe_v1_3_size_of.trading_capacity

  index = index + memx_options_memo_sbe_v1_3_size_of.reprice_frequency

  index = index + memx_options_memo_sbe_v1_3_size_of.reprice_behavior

  index = index + memx_options_memo_sbe_v1_3_size_of.mtp_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.match_trade_prevention

  index = index + memx_options_memo_sbe_v1_3_size_of.cancel_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.risk_group_id

  index = index + memx_options_memo_sbe_v1_3_size_of.padding_14

  index = index + memx_options_memo_sbe_v1_3_size_of.parties_groups(buffer, offset + index)

  return index
end

-- Display: New Order Single Message
memx_options_memo_sbe_v1_3_display.new_order_single_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: New Order Single Message
memx_options_memo_sbe_v1_3_dissect.new_order_single_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sending Time: 1 Byte Unsigned Fixed Width Integer
  index, sending_time = memx_options_memo_sbe_v1_3_dissect.sending_time(buffer, index, packet, parent)

  -- Cl Ord Id: 20 Byte Ascii String
  index, cl_ord_id = memx_options_memo_sbe_v1_3_dissect.cl_ord_id(buffer, index, packet, parent)

  -- Options Security Id: 8 Byte Ascii String Nullable
  index, options_security_id = memx_options_memo_sbe_v1_3_dissect.options_security_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 4 values
  index, side = memx_options_memo_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Order Qty: 4 Byte Unsigned Fixed Width Integer
  index, order_qty = memx_options_memo_sbe_v1_3_dissect.order_qty(buffer, index, packet, parent)

  -- Ord Type: 1 Byte Ascii String Enum with 2 values
  index, ord_type = memx_options_memo_sbe_v1_3_dissect.ord_type(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer Nullable
  index, price_price_type = memx_options_memo_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Time In Force: 1 Byte Ascii String Enum with 2 values
  index, time_in_force = memx_options_memo_sbe_v1_3_dissect.time_in_force(buffer, index, packet, parent)

  -- Open Or Close: 1 Byte Ascii String Enum with 4 values
  index, open_or_close = memx_options_memo_sbe_v1_3_dissect.open_or_close(buffer, index, packet, parent)

  -- Exec Inst: Struct of 4 fields
  index, exec_inst = memx_options_memo_sbe_v1_3_dissect.exec_inst(buffer, index, packet, parent)

  -- Trading Capacity: 1 Byte Unsigned Fixed Width Integer Enum with 8 values
  index, trading_capacity = memx_options_memo_sbe_v1_3_dissect.trading_capacity(buffer, index, packet, parent)

  -- Reprice Frequency: 1 Byte Unsigned Fixed Width Integer Enum with 5 values
  index, reprice_frequency = memx_options_memo_sbe_v1_3_dissect.reprice_frequency(buffer, index, packet, parent)

  -- Reprice Behavior: 1 Byte Unsigned Fixed Width Integer Enum with 4 values
  index, reprice_behavior = memx_options_memo_sbe_v1_3_dissect.reprice_behavior(buffer, index, packet, parent)

  -- Mtp Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, mtp_group_id = memx_options_memo_sbe_v1_3_dissect.mtp_group_id(buffer, index, packet, parent)

  -- Match Trade Prevention: 1 Byte Unsigned Fixed Width Integer Enum with 5 values
  index, match_trade_prevention = memx_options_memo_sbe_v1_3_dissect.match_trade_prevention(buffer, index, packet, parent)

  -- Cancel Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, cancel_group_id = memx_options_memo_sbe_v1_3_dissect.cancel_group_id(buffer, index, packet, parent)

  -- Risk Group Id: 2 Byte Unsigned Fixed Width Integer Nullable
  index, risk_group_id = memx_options_memo_sbe_v1_3_dissect.risk_group_id(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memo_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  -- Parties Groups: Struct of 2 fields
  index, parties_groups = memx_options_memo_sbe_v1_3_dissect.parties_groups(buffer, index, packet, parent)

  return index
end

-- Dissect: New Order Single Message
memx_options_memo_sbe_v1_3_dissect.new_order_single_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.new_order_single_message then
    local length = memx_options_memo_sbe_v1_3_size_of.new_order_single_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.new_order_single_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.new_order_single_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.new_order_single_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Payload
memx_options_memo_sbe_v1_3_size_of.payload = function(buffer, offset, template_id)
  -- Size of New Order Single Message
  if template_id == 1 then
    return memx_options_memo_sbe_v1_3_size_of.new_order_single_message(buffer, offset)
  end
  -- Size of Short Two Sided Bulk Quote Message
  if template_id == 2 then
    return memx_options_memo_sbe_v1_3_size_of.short_two_sided_bulk_quote_message(buffer, offset)
  end
  -- Size of Long Two Sided Bulk Quote Message
  if template_id == 3 then
    return memx_options_memo_sbe_v1_3_size_of.long_two_sided_bulk_quote_message(buffer, offset)
  end
  -- Size of Short One Sided Bulk Quote Message
  if template_id == 4 then
    return memx_options_memo_sbe_v1_3_size_of.short_one_sided_bulk_quote_message(buffer, offset)
  end
  -- Size of Long One Sided Bulk Quote Message
  if template_id == 5 then
    return memx_options_memo_sbe_v1_3_size_of.long_one_sided_bulk_quote_message(buffer, offset)
  end
  -- Size of Order Cancel Replace Request Message
  if template_id == 6 then
    return memx_options_memo_sbe_v1_3_size_of.order_cancel_replace_request_message(buffer, offset)
  end
  -- Size of Order Cancel Request Message
  if template_id == 7 then
    return memx_options_memo_sbe_v1_3_size_of.order_cancel_request_message(buffer, offset)
  end
  -- Size of Mass Cancel Request Message
  if template_id == 8 then
    return memx_options_memo_sbe_v1_3_size_of.mass_cancel_request_message(buffer, offset)
  end
  -- Size of Mass Cancel Clear Lockout Request Message
  if template_id == 9 then
    return memx_options_memo_sbe_v1_3_size_of.mass_cancel_clear_lockout_request_message(buffer, offset)
  end
  -- Size of Allocation Instruction Message
  if template_id == 10 then
    return memx_options_memo_sbe_v1_3_size_of.allocation_instruction_message(buffer, offset)
  end
  -- Size of Execution Report New Message
  if template_id == 11 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_new_message(buffer, offset)
  end
  -- Size of Execution Report Bulk Quote Pending New Message
  if template_id == 12 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_bulk_quote_pending_new_message(buffer, offset)
  end
  -- Size of Execution Report Bulk Quote Component New Message
  if template_id == 13 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_bulk_quote_component_new_message(buffer, offset)
  end
  -- Size of Execution Report Rejected Message
  if template_id == 14 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_rejected_message(buffer, offset)
  end
  -- Size of Execution Report Trade Message
  if template_id == 15 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_trade_message(buffer, offset)
  end
  -- Size of Execution Report Pending Cancel Message
  if template_id == 16 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_pending_cancel_message(buffer, offset)
  end
  -- Size of Execution Report Canceled Message
  if template_id == 17 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_canceled_message(buffer, offset)
  end
  -- Size of Execution Report Pending Replace Message
  if template_id == 18 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_pending_replace_message(buffer, offset)
  end
  -- Size of Execution Report Replaced Message
  if template_id == 19 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_replaced_message(buffer, offset)
  end
  -- Size of Execution Report Trade Correction Message
  if template_id == 20 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_trade_correction_message(buffer, offset)
  end
  -- Size of Execution Report Trade Break Message
  if template_id == 21 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_trade_break_message(buffer, offset)
  end
  -- Size of Execution Report Restatement Message
  if template_id == 22 then
    return memx_options_memo_sbe_v1_3_size_of.execution_report_restatement_message(buffer, offset)
  end
  -- Size of Pending Mass Cancel Message
  if template_id == 23 then
    return memx_options_memo_sbe_v1_3_size_of.pending_mass_cancel_message(buffer, offset)
  end
  -- Size of Mass Cancel Reject Message
  if template_id == 24 then
    return memx_options_memo_sbe_v1_3_size_of.mass_cancel_reject_message(buffer, offset)
  end
  -- Size of Mass Cancel Done Message
  if template_id == 25 then
    return memx_options_memo_sbe_v1_3_size_of.mass_cancel_done_message(buffer, offset)
  end
  -- Size of Order Cancel Reject Message
  if template_id == 26 then
    return memx_options_memo_sbe_v1_3_size_of.order_cancel_reject_message(buffer, offset)
  end
  -- Size of Allocation Instruction Ack Message
  if template_id == 27 then
    return memx_options_memo_sbe_v1_3_size_of.allocation_instruction_ack_message(buffer, offset)
  end
  -- Size of Allocation Report Message
  if template_id == 28 then
    return memx_options_memo_sbe_v1_3_size_of.allocation_report_message(buffer, offset)
  end
  -- Size of User Notification Message
  if template_id == 29 then
    return memx_options_memo_sbe_v1_3_size_of.user_notification_message(buffer, offset)
  end
  -- Size of Mass Cancel Clear Lockout Reject Message
  if template_id == 30 then
    return memx_options_memo_sbe_v1_3_size_of.mass_cancel_clear_lockout_reject_message(buffer, offset)
  end
  -- Size of Mass Cancel Clear Lockout Done Message
  if template_id == 31 then
    return memx_options_memo_sbe_v1_3_size_of.mass_cancel_clear_lockout_done_message(buffer, offset)
  end

  return 0
end

-- Display: Payload
memx_options_memo_sbe_v1_3_display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Payload
memx_options_memo_sbe_v1_3_dissect.payload_branches = function(buffer, offset, packet, parent, template_id)
  -- Dissect New Order Single Message
  if template_id == 1 then
    return memx_options_memo_sbe_v1_3_dissect.new_order_single_message(buffer, offset, packet, parent)
  end
  -- Dissect Short Two Sided Bulk Quote Message
  if template_id == 2 then
    return memx_options_memo_sbe_v1_3_dissect.short_two_sided_bulk_quote_message(buffer, offset, packet, parent)
  end
  -- Dissect Long Two Sided Bulk Quote Message
  if template_id == 3 then
    return memx_options_memo_sbe_v1_3_dissect.long_two_sided_bulk_quote_message(buffer, offset, packet, parent)
  end
  -- Dissect Short One Sided Bulk Quote Message
  if template_id == 4 then
    return memx_options_memo_sbe_v1_3_dissect.short_one_sided_bulk_quote_message(buffer, offset, packet, parent)
  end
  -- Dissect Long One Sided Bulk Quote Message
  if template_id == 5 then
    return memx_options_memo_sbe_v1_3_dissect.long_one_sided_bulk_quote_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Cancel Replace Request Message
  if template_id == 6 then
    return memx_options_memo_sbe_v1_3_dissect.order_cancel_replace_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Cancel Request Message
  if template_id == 7 then
    return memx_options_memo_sbe_v1_3_dissect.order_cancel_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Mass Cancel Request Message
  if template_id == 8 then
    return memx_options_memo_sbe_v1_3_dissect.mass_cancel_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Mass Cancel Clear Lockout Request Message
  if template_id == 9 then
    return memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Allocation Instruction Message
  if template_id == 10 then
    return memx_options_memo_sbe_v1_3_dissect.allocation_instruction_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report New Message
  if template_id == 11 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_new_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Bulk Quote Pending New Message
  if template_id == 12 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_bulk_quote_pending_new_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Bulk Quote Component New Message
  if template_id == 13 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_bulk_quote_component_new_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Rejected Message
  if template_id == 14 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_rejected_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Trade Message
  if template_id == 15 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Pending Cancel Message
  if template_id == 16 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_pending_cancel_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Canceled Message
  if template_id == 17 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_canceled_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Pending Replace Message
  if template_id == 18 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_pending_replace_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Replaced Message
  if template_id == 19 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_replaced_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Trade Correction Message
  if template_id == 20 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_trade_correction_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Trade Break Message
  if template_id == 21 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_trade_break_message(buffer, offset, packet, parent)
  end
  -- Dissect Execution Report Restatement Message
  if template_id == 22 then
    return memx_options_memo_sbe_v1_3_dissect.execution_report_restatement_message(buffer, offset, packet, parent)
  end
  -- Dissect Pending Mass Cancel Message
  if template_id == 23 then
    return memx_options_memo_sbe_v1_3_dissect.pending_mass_cancel_message(buffer, offset, packet, parent)
  end
  -- Dissect Mass Cancel Reject Message
  if template_id == 24 then
    return memx_options_memo_sbe_v1_3_dissect.mass_cancel_reject_message(buffer, offset, packet, parent)
  end
  -- Dissect Mass Cancel Done Message
  if template_id == 25 then
    return memx_options_memo_sbe_v1_3_dissect.mass_cancel_done_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Cancel Reject Message
  if template_id == 26 then
    return memx_options_memo_sbe_v1_3_dissect.order_cancel_reject_message(buffer, offset, packet, parent)
  end
  -- Dissect Allocation Instruction Ack Message
  if template_id == 27 then
    return memx_options_memo_sbe_v1_3_dissect.allocation_instruction_ack_message(buffer, offset, packet, parent)
  end
  -- Dissect Allocation Report Message
  if template_id == 28 then
    return memx_options_memo_sbe_v1_3_dissect.allocation_report_message(buffer, offset, packet, parent)
  end
  -- Dissect User Notification Message
  if template_id == 29 then
    return memx_options_memo_sbe_v1_3_dissect.user_notification_message(buffer, offset, packet, parent)
  end
  -- Dissect Mass Cancel Clear Lockout Reject Message
  if template_id == 30 then
    return memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_reject_message(buffer, offset, packet, parent)
  end
  -- Dissect Mass Cancel Clear Lockout Done Message
  if template_id == 31 then
    return memx_options_memo_sbe_v1_3_dissect.mass_cancel_clear_lockout_done_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
memx_options_memo_sbe_v1_3_dissect.payload = function(buffer, offset, packet, parent, template_id)
  if not show.payload then
    return memx_options_memo_sbe_v1_3_dissect.payload_branches(buffer, offset, packet, parent, template_id)
  end

  -- Calculate size and check that branch is not empty
  local size = memx_options_memo_sbe_v1_3_size_of.payload(buffer, offset, template_id)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = memx_options_memo_sbe_v1_3_display.payload(buffer, packet, parent)
  local element = parent:add(memx_options_memo_sbe_v1_3.fields.payload, range, display)

  return memx_options_memo_sbe_v1_3_dissect.payload_branches(buffer, offset, packet, parent, template_id)
end

-- Size: Version
memx_options_memo_sbe_v1_3_size_of.version = 2

-- Display: Version
memx_options_memo_sbe_v1_3_display.version = function(value)
  return "Version: "..value
end

-- Dissect: Version
memx_options_memo_sbe_v1_3_dissect.version = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.version
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.version(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.version, range, value, display)

  return offset + length, value
end

-- Size: Schema Id
memx_options_memo_sbe_v1_3_size_of.schema_id = 1

-- Display: Schema Id
memx_options_memo_sbe_v1_3_display.schema_id = function(value)
  return "Schema Id: "..value
end

-- Dissect: Schema Id
memx_options_memo_sbe_v1_3_dissect.schema_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.schema_id
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.schema_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.schema_id, range, value, display)

  return offset + length, value
end

-- Size: Template Id
memx_options_memo_sbe_v1_3_size_of.template_id = 1

-- Display: Template Id
memx_options_memo_sbe_v1_3_display.template_id = function(value)
  if value == 1 then
    return "Template Id: New Order Single Message (1)"
  end
  if value == 2 then
    return "Template Id: Short Two Sided Bulk Quote Message (2)"
  end
  if value == 3 then
    return "Template Id: Long Two Sided Bulk Quote Message (3)"
  end
  if value == 4 then
    return "Template Id: Short One Sided Bulk Quote Message (4)"
  end
  if value == 5 then
    return "Template Id: Long One Sided Bulk Quote Message (5)"
  end
  if value == 6 then
    return "Template Id: Order Cancel Replace Request Message (6)"
  end
  if value == 7 then
    return "Template Id: Order Cancel Request Message (7)"
  end
  if value == 8 then
    return "Template Id: Mass Cancel Request Message (8)"
  end
  if value == 9 then
    return "Template Id: Mass Cancel Clear Lockout Request Message (9)"
  end
  if value == 10 then
    return "Template Id: Allocation Instruction Message (10)"
  end
  if value == 11 then
    return "Template Id: Execution Report New Message (11)"
  end
  if value == 12 then
    return "Template Id: Execution Report Bulk Quote Pending New Message (12)"
  end
  if value == 13 then
    return "Template Id: Execution Report Bulk Quote Component New Message (13)"
  end
  if value == 14 then
    return "Template Id: Execution Report Rejected Message (14)"
  end
  if value == 15 then
    return "Template Id: Execution Report Trade Message (15)"
  end
  if value == 16 then
    return "Template Id: Execution Report Pending Cancel Message (16)"
  end
  if value == 17 then
    return "Template Id: Execution Report Canceled Message (17)"
  end
  if value == 18 then
    return "Template Id: Execution Report Pending Replace Message (18)"
  end
  if value == 19 then
    return "Template Id: Execution Report Replaced Message (19)"
  end
  if value == 20 then
    return "Template Id: Execution Report Trade Correction Message (20)"
  end
  if value == 21 then
    return "Template Id: Execution Report Trade Break Message (21)"
  end
  if value == 22 then
    return "Template Id: Execution Report Restatement Message (22)"
  end
  if value == 23 then
    return "Template Id: Pending Mass Cancel Message (23)"
  end
  if value == 24 then
    return "Template Id: Mass Cancel Reject Message (24)"
  end
  if value == 25 then
    return "Template Id: Mass Cancel Done Message (25)"
  end
  if value == 26 then
    return "Template Id: Order Cancel Reject Message (26)"
  end
  if value == 27 then
    return "Template Id: Allocation Instruction Ack Message (27)"
  end
  if value == 28 then
    return "Template Id: Allocation Report Message (28)"
  end
  if value == 29 then
    return "Template Id: User Notification Message (29)"
  end
  if value == 30 then
    return "Template Id: Mass Cancel Clear Lockout Reject Message (30)"
  end
  if value == 31 then
    return "Template Id: Mass Cancel Clear Lockout Done Message (31)"
  end

  return "Template Id: Unknown("..value..")"
end

-- Dissect: Template Id
memx_options_memo_sbe_v1_3_dissect.template_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.template_id
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.template_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.template_id, range, value, display)

  return offset + length, value
end

-- Size: Block Length
memx_options_memo_sbe_v1_3_size_of.block_length = 2

-- Display: Block Length
memx_options_memo_sbe_v1_3_display.block_length = function(value)
  return "Block Length: "..value
end

-- Dissect: Block Length
memx_options_memo_sbe_v1_3_dissect.block_length = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.block_length
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.block_length(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.block_length, range, value, display)

  return offset + length, value
end

-- Calculate size of: Sbe Header
memx_options_memo_sbe_v1_3_size_of.sbe_header = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.block_length

  index = index + memx_options_memo_sbe_v1_3_size_of.template_id

  index = index + memx_options_memo_sbe_v1_3_size_of.schema_id

  index = index + memx_options_memo_sbe_v1_3_size_of.version

  return index
end

-- Display: Sbe Header
memx_options_memo_sbe_v1_3_display.sbe_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Sbe Header
memx_options_memo_sbe_v1_3_dissect.sbe_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Block Length: 2 Byte Unsigned Fixed Width Integer
  index, block_length = memx_options_memo_sbe_v1_3_dissect.block_length(buffer, index, packet, parent)

  -- Template Id: 1 Byte Unsigned Fixed Width Integer Enum with 31 values
  index, template_id = memx_options_memo_sbe_v1_3_dissect.template_id(buffer, index, packet, parent)

  -- Schema Id: 1 Byte Unsigned Fixed Width Integer Static
  index, schema_id = memx_options_memo_sbe_v1_3_dissect.schema_id(buffer, index, packet, parent)

  -- Version: 2 Byte Unsigned Fixed Width Integer Static
  index, version = memx_options_memo_sbe_v1_3_dissect.version(buffer, index, packet, parent)

  return index
end

-- Dissect: Sbe Header
memx_options_memo_sbe_v1_3_dissect.sbe_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.sbe_header then
    local length = memx_options_memo_sbe_v1_3_size_of.sbe_header(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.sbe_header(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.sbe_header, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.sbe_header_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Sbe Message
memx_options_memo_sbe_v1_3_size_of.sbe_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sbe_header(buffer, offset + index)

  -- Calculate runtime size of Payload field
  local payload_offset = offset + index
  local payload_type = buffer(payload_offset - 4, 1):uint()
  index = index + memx_options_memo_sbe_v1_3_size_of.payload(buffer, payload_offset, payload_type)

  return index
end

-- Display: Sbe Message
memx_options_memo_sbe_v1_3_display.sbe_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Sbe Message
memx_options_memo_sbe_v1_3_dissect.sbe_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sbe Header: Struct of 4 fields
  index, sbe_header = memx_options_memo_sbe_v1_3_dissect.sbe_header(buffer, index, packet, parent)

  -- Dependency element: Template Id
  local template_id = buffer(index - 4, 1):uint()

  -- Payload: Runtime Type with 31 branches
  index = memx_options_memo_sbe_v1_3_dissect.payload(buffer, index, packet, parent, template_id)

  return index
end

-- Dissect: Sbe Message
memx_options_memo_sbe_v1_3_dissect.sbe_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.sbe_message then
    local length = memx_options_memo_sbe_v1_3_size_of.sbe_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.sbe_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.sbe_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.sbe_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Sequenced Message
memx_options_memo_sbe_v1_3_size_of.sequenced_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sbe_message(buffer, offset + index)

  return index
end

-- Display: Sequenced Message
memx_options_memo_sbe_v1_3_display.sequenced_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Sequenced Message
memx_options_memo_sbe_v1_3_dissect.sequenced_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sbe Message: Struct of 2 fields
  index, sbe_message = memx_options_memo_sbe_v1_3_dissect.sbe_message(buffer, index, packet, parent)

  return index
end

-- Dissect: Sequenced Message
memx_options_memo_sbe_v1_3_dissect.sequenced_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.sequenced_message then
    local length = memx_options_memo_sbe_v1_3_size_of.sequenced_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.sequenced_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.sequenced_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.sequenced_message_fields(buffer, offset, packet, parent)
end

-- Size: Total Sequence Count
memx_options_memo_sbe_v1_3_size_of.total_sequence_count = 8

-- Display: Total Sequence Count
memx_options_memo_sbe_v1_3_display.total_sequence_count = function(value)
  return "Total Sequence Count: "..value
end

-- Dissect: Total Sequence Count
memx_options_memo_sbe_v1_3_dissect.total_sequence_count = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.total_sequence_count
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.total_sequence_count(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.total_sequence_count, range, value, display)

  return offset + length, value
end

-- Calculate size of: Stream Complete Message
memx_options_memo_sbe_v1_3_size_of.stream_complete_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.total_sequence_count

  return index
end

-- Display: Stream Complete Message
memx_options_memo_sbe_v1_3_display.stream_complete_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Stream Complete Message
memx_options_memo_sbe_v1_3_dissect.stream_complete_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Total Sequence Count: 8 Byte Unsigned Fixed Width Integer
  index, total_sequence_count = memx_options_memo_sbe_v1_3_dissect.total_sequence_count(buffer, index, packet, parent)

  return index
end

-- Dissect: Stream Complete Message
memx_options_memo_sbe_v1_3_dissect.stream_complete_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.stream_complete_message then
    local length = memx_options_memo_sbe_v1_3_size_of.stream_complete_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.stream_complete_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.stream_complete_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.stream_complete_message_fields(buffer, offset, packet, parent)
end

-- Size: Stream Reject Code
memx_options_memo_sbe_v1_3_size_of.stream_reject_code = 1

-- Display: Stream Reject Code
memx_options_memo_sbe_v1_3_display.stream_reject_code = function(value)
  if value == "R" then
    return "Stream Reject Code: Stream Requests Are Not Allowed (R)"
  end
  if value == "P" then
    return "Stream Reject Code: Not The Active Session (P)"
  end
  if value == "S" then
    return "Stream Reject Code: Sequence Number Out Of Range (S)"
  end

  return "Stream Reject Code: Unknown("..value..")"
end

-- Dissect: Stream Reject Code
memx_options_memo_sbe_v1_3_dissect.stream_reject_code = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.stream_reject_code
  local range = buffer(offset, length)
  local value = range:string()
  local display = memx_options_memo_sbe_v1_3_display.stream_reject_code(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.stream_reject_code, range, value, display)

  return offset + length, value
end

-- Calculate size of: Stream Rejected Message
memx_options_memo_sbe_v1_3_size_of.stream_rejected_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.stream_reject_code

  return index
end

-- Display: Stream Rejected Message
memx_options_memo_sbe_v1_3_display.stream_rejected_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Stream Rejected Message
memx_options_memo_sbe_v1_3_dissect.stream_rejected_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Stream Reject Code: 1 Byte Ascii String Enum with 3 values
  index, stream_reject_code = memx_options_memo_sbe_v1_3_dissect.stream_reject_code(buffer, index, packet, parent)

  return index
end

-- Dissect: Stream Rejected Message
memx_options_memo_sbe_v1_3_dissect.stream_rejected_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.stream_rejected_message then
    local length = memx_options_memo_sbe_v1_3_size_of.stream_rejected_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.stream_rejected_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.stream_rejected_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.stream_rejected_message_fields(buffer, offset, packet, parent)
end

-- Size: Next Sequence Number
memx_options_memo_sbe_v1_3_size_of.next_sequence_number = 8

-- Display: Next Sequence Number
memx_options_memo_sbe_v1_3_display.next_sequence_number = function(value)
  return "Next Sequence Number: "..value
end

-- Dissect: Next Sequence Number
memx_options_memo_sbe_v1_3_dissect.next_sequence_number = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.next_sequence_number
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.next_sequence_number(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.next_sequence_number, range, value, display)

  return offset + length, value
end

-- Calculate size of: Stream Begin Message
memx_options_memo_sbe_v1_3_size_of.stream_begin_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.next_sequence_number

  index = index + memx_options_memo_sbe_v1_3_size_of.max_sequence_number

  return index
end

-- Display: Stream Begin Message
memx_options_memo_sbe_v1_3_display.stream_begin_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Stream Begin Message
memx_options_memo_sbe_v1_3_dissect.stream_begin_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Next Sequence Number: 8 Byte Unsigned Fixed Width Integer
  index, next_sequence_number = memx_options_memo_sbe_v1_3_dissect.next_sequence_number(buffer, index, packet, parent)

  -- Max Sequence Number
  index, max_sequence_number = memx_options_memo_sbe_v1_3_dissect.max_sequence_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Stream Begin Message
memx_options_memo_sbe_v1_3_dissect.stream_begin_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.stream_begin_message then
    local length = memx_options_memo_sbe_v1_3_size_of.stream_begin_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.stream_begin_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.stream_begin_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.stream_begin_message_fields(buffer, offset, packet, parent)
end

-- Size: Message Count
memx_options_memo_sbe_v1_3_size_of.message_count = 8

-- Display: Message Count
memx_options_memo_sbe_v1_3_display.message_count = function(value)
  return "Message Count: "..value
end

-- Dissect: Message Count
memx_options_memo_sbe_v1_3_dissect.message_count = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.message_count
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.message_count(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.message_count, range, value, display)

  return offset + length, value
end

-- Calculate size of: Replay Complete Message
memx_options_memo_sbe_v1_3_size_of.replay_complete_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.message_count

  return index
end

-- Display: Replay Complete Message
memx_options_memo_sbe_v1_3_display.replay_complete_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Replay Complete Message
memx_options_memo_sbe_v1_3_dissect.replay_complete_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Count: 8 Byte Unsigned Fixed Width Integer
  index, message_count = memx_options_memo_sbe_v1_3_dissect.message_count(buffer, index, packet, parent)

  return index
end

-- Dissect: Replay Complete Message
memx_options_memo_sbe_v1_3_dissect.replay_complete_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.replay_complete_message then
    local length = memx_options_memo_sbe_v1_3_size_of.replay_complete_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.replay_complete_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.replay_complete_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.replay_complete_message_fields(buffer, offset, packet, parent)
end

-- Size: Replay Reject Code
memx_options_memo_sbe_v1_3_size_of.replay_reject_code = 1

-- Display: Replay Reject Code
memx_options_memo_sbe_v1_3_display.replay_reject_code = function(value)
  if value == "R" then
    return "Replay Reject Code: Replay Requests Are Not Allowed (R)"
  end
  if value == "A" then
    return "Replay Reject Code: Replay All Requests Are Not Allowed (A)"
  end
  if value == "P" then
    return "Replay Reject Code: Not The Active Session (P)"
  end
  if value == "S" then
    return "Replay Reject Code: Sequence Number Out Of Range (S)"
  end

  return "Replay Reject Code: Unknown("..value..")"
end

-- Dissect: Replay Reject Code
memx_options_memo_sbe_v1_3_dissect.replay_reject_code = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.replay_reject_code
  local range = buffer(offset, length)
  local value = range:string()
  local display = memx_options_memo_sbe_v1_3_display.replay_reject_code(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.replay_reject_code, range, value, display)

  return offset + length, value
end

-- Calculate size of: Replay Rejected Message
memx_options_memo_sbe_v1_3_size_of.replay_rejected_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.replay_reject_code

  return index
end

-- Display: Replay Rejected Message
memx_options_memo_sbe_v1_3_display.replay_rejected_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Replay Rejected Message
memx_options_memo_sbe_v1_3_dissect.replay_rejected_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Replay Reject Code: 1 Byte Ascii String Enum with 4 values
  index, replay_reject_code = memx_options_memo_sbe_v1_3_dissect.replay_reject_code(buffer, index, packet, parent)

  return index
end

-- Dissect: Replay Rejected Message
memx_options_memo_sbe_v1_3_dissect.replay_rejected_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.replay_rejected_message then
    local length = memx_options_memo_sbe_v1_3_size_of.replay_rejected_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.replay_rejected_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.replay_rejected_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.replay_rejected_message_fields(buffer, offset, packet, parent)
end

-- Size: Pending Message Count
memx_options_memo_sbe_v1_3_size_of.pending_message_count = 4

-- Display: Pending Message Count
memx_options_memo_sbe_v1_3_display.pending_message_count = function(value)
  return "Pending Message Count: "..value
end

-- Dissect: Pending Message Count
memx_options_memo_sbe_v1_3_dissect.pending_message_count = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.pending_message_count
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.pending_message_count(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.pending_message_count, range, value, display)

  return offset + length, value
end

-- Calculate size of: Replay Begin Message
memx_options_memo_sbe_v1_3_size_of.replay_begin_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.next_sequence_number

  index = index + memx_options_memo_sbe_v1_3_size_of.pending_message_count

  return index
end

-- Display: Replay Begin Message
memx_options_memo_sbe_v1_3_display.replay_begin_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Replay Begin Message
memx_options_memo_sbe_v1_3_dissect.replay_begin_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Next Sequence Number: 8 Byte Unsigned Fixed Width Integer
  index, next_sequence_number = memx_options_memo_sbe_v1_3_dissect.next_sequence_number(buffer, index, packet, parent)

  -- Pending Message Count: 4 Byte Unsigned Fixed Width Integer
  index, pending_message_count = memx_options_memo_sbe_v1_3_dissect.pending_message_count(buffer, index, packet, parent)

  return index
end

-- Dissect: Replay Begin Message
memx_options_memo_sbe_v1_3_dissect.replay_begin_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.replay_begin_message then
    local length = memx_options_memo_sbe_v1_3_size_of.replay_begin_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.replay_begin_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.replay_begin_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.replay_begin_message_fields(buffer, offset, packet, parent)
end

-- Size: Session Id
memx_options_memo_sbe_v1_3_size_of.session_id = 8

-- Display: Session Id
memx_options_memo_sbe_v1_3_display.session_id = function(value)
  return "Session Id: "..value
end

-- Dissect: Session Id
memx_options_memo_sbe_v1_3_dissect.session_id = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.session_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memo_sbe_v1_3_display.session_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.session_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Start Of Session Message
memx_options_memo_sbe_v1_3_size_of.start_of_session_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.session_id

  return index
end

-- Display: Start Of Session Message
memx_options_memo_sbe_v1_3_display.start_of_session_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Start Of Session Message
memx_options_memo_sbe_v1_3_dissect.start_of_session_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session Id: 8 Byte Unsigned Fixed Width Integer
  index, session_id = memx_options_memo_sbe_v1_3_dissect.session_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Start Of Session Message
memx_options_memo_sbe_v1_3_dissect.start_of_session_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.start_of_session_message then
    local length = memx_options_memo_sbe_v1_3_size_of.start_of_session_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.start_of_session_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.start_of_session_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.start_of_session_message_fields(buffer, offset, packet, parent)
end

-- Size: Login Reject Code
memx_options_memo_sbe_v1_3_size_of.login_reject_code = 1

-- Display: Login Reject Code
memx_options_memo_sbe_v1_3_display.login_reject_code = function(value)
  if value == "T" then
    return "Login Reject Code: Malformed Token (T)"
  end
  if value == "U" then
    return "Login Reject Code: Token Type Unsupported (U)"
  end
  if value == "V" then
    return "Login Reject Code: Token Type Invalid (V)"
  end
  if value == "A" then
    return "Login Reject Code: Authorization Failed (A)"
  end

  return "Login Reject Code: Unknown("..value..")"
end

-- Dissect: Login Reject Code
memx_options_memo_sbe_v1_3_dissect.login_reject_code = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.login_reject_code
  local range = buffer(offset, length)
  local value = range:string()
  local display = memx_options_memo_sbe_v1_3_display.login_reject_code(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.login_reject_code, range, value, display)

  return offset + length, value
end

-- Calculate size of: Login Rejected Message
memx_options_memo_sbe_v1_3_size_of.login_rejected_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.login_reject_code

  return index
end

-- Display: Login Rejected Message
memx_options_memo_sbe_v1_3_display.login_rejected_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Login Rejected Message
memx_options_memo_sbe_v1_3_dissect.login_rejected_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Login Reject Code: 1 Byte Ascii String Enum with 4 values
  index, login_reject_code = memx_options_memo_sbe_v1_3_dissect.login_reject_code(buffer, index, packet, parent)

  return index
end

-- Dissect: Login Rejected Message
memx_options_memo_sbe_v1_3_dissect.login_rejected_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.login_rejected_message then
    local length = memx_options_memo_sbe_v1_3_size_of.login_rejected_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.login_rejected_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.login_rejected_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.login_rejected_message_fields(buffer, offset, packet, parent)
end

-- Size: Supported Request Mode
memx_options_memo_sbe_v1_3_size_of.supported_request_mode = 1

-- Display: Supported Request Mode
memx_options_memo_sbe_v1_3_display.supported_request_mode = function(value)
  if value == "S" then
    return "Supported Request Mode: Stream (S)"
  end
  if value == "R" then
    return "Supported Request Mode: Replay (R)"
  end
  if value == "T" then
    return "Supported Request Mode: Snapshot Mode (T)"
  end

  return "Supported Request Mode: Unknown("..value..")"
end

-- Dissect: Supported Request Mode
memx_options_memo_sbe_v1_3_dissect.supported_request_mode = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.supported_request_mode
  local range = buffer(offset, length)
  local value = range:string()
  local display = memx_options_memo_sbe_v1_3_display.supported_request_mode(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.supported_request_mode, range, value, display)

  return offset + length, value
end

-- Calculate size of: Login Accepted Message
memx_options_memo_sbe_v1_3_size_of.login_accepted_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.supported_request_mode

  return index
end

-- Display: Login Accepted Message
memx_options_memo_sbe_v1_3_display.login_accepted_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Login Accepted Message
memx_options_memo_sbe_v1_3_dissect.login_accepted_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Supported Request Mode: 1 Byte Ascii String Enum with 3 values
  index, supported_request_mode = memx_options_memo_sbe_v1_3_dissect.supported_request_mode(buffer, index, packet, parent)

  return index
end

-- Dissect: Login Accepted Message
memx_options_memo_sbe_v1_3_dissect.login_accepted_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.login_accepted_message then
    local length = memx_options_memo_sbe_v1_3_size_of.login_accepted_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.login_accepted_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.login_accepted_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.login_accepted_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Unsequenced Message
memx_options_memo_sbe_v1_3_size_of.unsequenced_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.sbe_message(buffer, offset + index)

  return index
end

-- Display: Unsequenced Message
memx_options_memo_sbe_v1_3_display.unsequenced_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Unsequenced Message
memx_options_memo_sbe_v1_3_dissect.unsequenced_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sbe Message: Struct of 2 fields
  index, sbe_message = memx_options_memo_sbe_v1_3_dissect.sbe_message(buffer, index, packet, parent)

  return index
end

-- Dissect: Unsequenced Message
memx_options_memo_sbe_v1_3_dissect.unsequenced_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.unsequenced_message then
    local length = memx_options_memo_sbe_v1_3_size_of.unsequenced_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.unsequenced_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.unsequenced_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.unsequenced_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Stream Request Message
memx_options_memo_sbe_v1_3_size_of.stream_request_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.session_id

  index = index + memx_options_memo_sbe_v1_3_size_of.next_sequence_number

  return index
end

-- Display: Stream Request Message
memx_options_memo_sbe_v1_3_display.stream_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Stream Request Message
memx_options_memo_sbe_v1_3_dissect.stream_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session Id: 8 Byte Unsigned Fixed Width Integer
  index, session_id = memx_options_memo_sbe_v1_3_dissect.session_id(buffer, index, packet, parent)

  -- Next Sequence Number: 8 Byte Unsigned Fixed Width Integer
  index, next_sequence_number = memx_options_memo_sbe_v1_3_dissect.next_sequence_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Stream Request Message
memx_options_memo_sbe_v1_3_dissect.stream_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.stream_request_message then
    local length = memx_options_memo_sbe_v1_3_size_of.stream_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.stream_request_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.stream_request_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.stream_request_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Replay All Request Message
memx_options_memo_sbe_v1_3_size_of.replay_all_request_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.session_id

  return index
end

-- Display: Replay All Request Message
memx_options_memo_sbe_v1_3_display.replay_all_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Replay All Request Message
memx_options_memo_sbe_v1_3_dissect.replay_all_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session Id: 8 Byte Unsigned Fixed Width Integer
  index, session_id = memx_options_memo_sbe_v1_3_dissect.session_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Replay All Request Message
memx_options_memo_sbe_v1_3_dissect.replay_all_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.replay_all_request_message then
    local length = memx_options_memo_sbe_v1_3_size_of.replay_all_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.replay_all_request_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.replay_all_request_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.replay_all_request_message_fields(buffer, offset, packet, parent)
end

-- Size: Count
memx_options_memo_sbe_v1_3_size_of.count = 4

-- Display: Count
memx_options_memo_sbe_v1_3_display.count = function(value)
  return "Count: "..value
end

-- Dissect: Count
memx_options_memo_sbe_v1_3_dissect.count = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.count
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.count(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.count, range, value, display)

  return offset + length, value
end

-- Calculate size of: Replay Request Message
memx_options_memo_sbe_v1_3_size_of.replay_request_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.session_id

  index = index + memx_options_memo_sbe_v1_3_size_of.next_sequence_number

  index = index + memx_options_memo_sbe_v1_3_size_of.count

  return index
end

-- Display: Replay Request Message
memx_options_memo_sbe_v1_3_display.replay_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Replay Request Message
memx_options_memo_sbe_v1_3_dissect.replay_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session Id: 8 Byte Unsigned Fixed Width Integer
  index, session_id = memx_options_memo_sbe_v1_3_dissect.session_id(buffer, index, packet, parent)

  -- Next Sequence Number: 8 Byte Unsigned Fixed Width Integer
  index, next_sequence_number = memx_options_memo_sbe_v1_3_dissect.next_sequence_number(buffer, index, packet, parent)

  -- Count: 4 Byte Unsigned Fixed Width Integer
  index, count = memx_options_memo_sbe_v1_3_dissect.count(buffer, index, packet, parent)

  return index
end

-- Dissect: Replay Request Message
memx_options_memo_sbe_v1_3_dissect.replay_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.replay_request_message then
    local length = memx_options_memo_sbe_v1_3_size_of.replay_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.replay_request_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.replay_request_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.replay_request_message_fields(buffer, offset, packet, parent)
end

-- Size: Token
memx_options_memo_sbe_v1_3_size_of.token = 1

-- Display: Token
memx_options_memo_sbe_v1_3_display.token = function(value)
  return "Token: "..value
end

-- Dissect: Token
memx_options_memo_sbe_v1_3_dissect.token = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.token
  local range = buffer(offset, length)
  local value = range:string()
  local display = memx_options_memo_sbe_v1_3_display.token(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.token, range, value, display)

  return offset + length, value
end

-- Size: Token Type
memx_options_memo_sbe_v1_3_size_of.token_type = 1

-- Display: Token Type
memx_options_memo_sbe_v1_3_display.token_type = function(value)
  return "Token Type: "..value
end

-- Dissect: Token Type
memx_options_memo_sbe_v1_3_dissect.token_type = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.token_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = memx_options_memo_sbe_v1_3_display.token_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.token_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: Login Request Message
memx_options_memo_sbe_v1_3_size_of.login_request_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.token_type

  index = index + memx_options_memo_sbe_v1_3_size_of.token

  return index
end

-- Display: Login Request Message
memx_options_memo_sbe_v1_3_display.login_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Login Request Message
memx_options_memo_sbe_v1_3_dissect.login_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Token Type: 1 Byte Ascii String
  index, token_type = memx_options_memo_sbe_v1_3_dissect.token_type(buffer, index, packet, parent)

  -- Token: 1 Byte Ascii String
  index, token = memx_options_memo_sbe_v1_3_dissect.token(buffer, index, packet, parent)

  return index
end

-- Dissect: Login Request Message
memx_options_memo_sbe_v1_3_dissect.login_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.login_request_message then
    local length = memx_options_memo_sbe_v1_3_size_of.login_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.login_request_message(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.login_request_message, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.login_request_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Data
memx_options_memo_sbe_v1_3_size_of.data = function(buffer, offset, message_type)
  -- Size of Login Request Message
  if message_type == 100 then
    return memx_options_memo_sbe_v1_3_size_of.login_request_message(buffer, offset)
  end
  -- Size of Replay Request Message
  if message_type == 101 then
    return memx_options_memo_sbe_v1_3_size_of.replay_request_message(buffer, offset)
  end
  -- Size of Replay All Request Message
  if message_type == 102 then
    return memx_options_memo_sbe_v1_3_size_of.replay_all_request_message(buffer, offset)
  end
  -- Size of Stream Request Message
  if message_type == 103 then
    return memx_options_memo_sbe_v1_3_size_of.stream_request_message(buffer, offset)
  end
  -- Size of Unsequenced Message
  if message_type == 104 then
    return memx_options_memo_sbe_v1_3_size_of.unsequenced_message(buffer, offset)
  end
  -- Size of Login Accepted Message
  if message_type == 1 then
    return memx_options_memo_sbe_v1_3_size_of.login_accepted_message(buffer, offset)
  end
  -- Size of Login Rejected Message
  if message_type == 2 then
    return memx_options_memo_sbe_v1_3_size_of.login_rejected_message(buffer, offset)
  end
  -- Size of Start Of Session Message
  if message_type == 3 then
    return memx_options_memo_sbe_v1_3_size_of.start_of_session_message(buffer, offset)
  end
  -- Size of Replay Begin Message
  if message_type == 5 then
    return memx_options_memo_sbe_v1_3_size_of.replay_begin_message(buffer, offset)
  end
  -- Size of Replay Rejected Message
  if message_type == 6 then
    return memx_options_memo_sbe_v1_3_size_of.replay_rejected_message(buffer, offset)
  end
  -- Size of Replay Complete Message
  if message_type == 7 then
    return memx_options_memo_sbe_v1_3_size_of.replay_complete_message(buffer, offset)
  end
  -- Size of Stream Begin Message
  if message_type == 8 then
    return memx_options_memo_sbe_v1_3_size_of.stream_begin_message(buffer, offset)
  end
  -- Size of Stream Rejected Message
  if message_type == 9 then
    return memx_options_memo_sbe_v1_3_size_of.stream_rejected_message(buffer, offset)
  end
  -- Size of Stream Complete Message
  if message_type == 10 then
    return memx_options_memo_sbe_v1_3_size_of.stream_complete_message(buffer, offset)
  end
  -- Size of Sequenced Message
  if message_type == 11 then
    return memx_options_memo_sbe_v1_3_size_of.sequenced_message(buffer, offset)
  end

  return 0
end

-- Display: Data
memx_options_memo_sbe_v1_3_display.data = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Data
memx_options_memo_sbe_v1_3_dissect.data_branches = function(buffer, offset, packet, parent, message_type)
  -- Dissect Login Request Message
  if message_type == 100 then
    return memx_options_memo_sbe_v1_3_dissect.login_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Replay Request Message
  if message_type == 101 then
    return memx_options_memo_sbe_v1_3_dissect.replay_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Replay All Request Message
  if message_type == 102 then
    return memx_options_memo_sbe_v1_3_dissect.replay_all_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Stream Request Message
  if message_type == 103 then
    return memx_options_memo_sbe_v1_3_dissect.stream_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Unsequenced Message
  if message_type == 104 then
    return memx_options_memo_sbe_v1_3_dissect.unsequenced_message(buffer, offset, packet, parent)
  end
  -- Dissect Login Accepted Message
  if message_type == 1 then
    return memx_options_memo_sbe_v1_3_dissect.login_accepted_message(buffer, offset, packet, parent)
  end
  -- Dissect Login Rejected Message
  if message_type == 2 then
    return memx_options_memo_sbe_v1_3_dissect.login_rejected_message(buffer, offset, packet, parent)
  end
  -- Dissect Start Of Session Message
  if message_type == 3 then
    return memx_options_memo_sbe_v1_3_dissect.start_of_session_message(buffer, offset, packet, parent)
  end
  -- Dissect Replay Begin Message
  if message_type == 5 then
    return memx_options_memo_sbe_v1_3_dissect.replay_begin_message(buffer, offset, packet, parent)
  end
  -- Dissect Replay Rejected Message
  if message_type == 6 then
    return memx_options_memo_sbe_v1_3_dissect.replay_rejected_message(buffer, offset, packet, parent)
  end
  -- Dissect Replay Complete Message
  if message_type == 7 then
    return memx_options_memo_sbe_v1_3_dissect.replay_complete_message(buffer, offset, packet, parent)
  end
  -- Dissect Stream Begin Message
  if message_type == 8 then
    return memx_options_memo_sbe_v1_3_dissect.stream_begin_message(buffer, offset, packet, parent)
  end
  -- Dissect Stream Rejected Message
  if message_type == 9 then
    return memx_options_memo_sbe_v1_3_dissect.stream_rejected_message(buffer, offset, packet, parent)
  end
  -- Dissect Stream Complete Message
  if message_type == 10 then
    return memx_options_memo_sbe_v1_3_dissect.stream_complete_message(buffer, offset, packet, parent)
  end
  -- Dissect Sequenced Message
  if message_type == 11 then
    return memx_options_memo_sbe_v1_3_dissect.sequenced_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Data
memx_options_memo_sbe_v1_3_dissect.data = function(buffer, offset, packet, parent, message_type)
  if not show.data then
    return memx_options_memo_sbe_v1_3_dissect.data_branches(buffer, offset, packet, parent, message_type)
  end

  -- Calculate size and check that branch is not empty
  local size = memx_options_memo_sbe_v1_3_size_of.data(buffer, offset, message_type)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = memx_options_memo_sbe_v1_3_display.data(buffer, packet, parent)
  local element = parent:add(memx_options_memo_sbe_v1_3.fields.data, range, display)

  return memx_options_memo_sbe_v1_3_dissect.data_branches(buffer, offset, packet, parent, message_type)
end

-- Size: Message Length
memx_options_memo_sbe_v1_3_size_of.message_length = 2

-- Display: Message Length
memx_options_memo_sbe_v1_3_display.message_length = function(value)
  return "Message Length: "..value
end

-- Dissect: Message Length
memx_options_memo_sbe_v1_3_dissect.message_length = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.message_length
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.message_length(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.message_length, range, value, display)

  return offset + length, value
end

-- Size: Message Type
memx_options_memo_sbe_v1_3_size_of.message_type = 1

-- Display: Message Type
memx_options_memo_sbe_v1_3_display.message_type = function(value)
  if value == 100 then
    return "Message Type: Login Request (100)"
  end
  if value == 101 then
    return "Message Type: Replay Request (101)"
  end
  if value == 102 then
    return "Message Type: Replay All Request (102)"
  end
  if value == 103 then
    return "Message Type: Stream Request (103)"
  end
  if value == 104 then
    return "Message Type: Unsequenced Message (104)"
  end
  if value == 1 then
    return "Message Type: Login Accepted (1)"
  end
  if value == 2 then
    return "Message Type: Login Rejected (2)"
  end
  if value == 3 then
    return "Message Type: Start Of Session (3)"
  end
  if value == 3 then
    return "Message Type: End Of Session (3)"
  end
  if value == 5 then
    return "Message Type: Replay Begin (5)"
  end
  if value == 6 then
    return "Message Type: Replay Rejected (6)"
  end
  if value == 7 then
    return "Message Type: Replay Complete (7)"
  end
  if value == 8 then
    return "Message Type: Stream Begin (8)"
  end
  if value == 9 then
    return "Message Type: Stream Rejected (9)"
  end
  if value == 10 then
    return "Message Type: Stream Complete (10)"
  end
  if value == 11 then
    return "Message Type: Sequenced Message (11)"
  end

  return "Message Type: Unknown("..value..")"
end

-- Dissect: Message Type
memx_options_memo_sbe_v1_3_dissect.message_type = function(buffer, offset, packet, parent)
  local length = memx_options_memo_sbe_v1_3_size_of.message_type
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memo_sbe_v1_3_display.message_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memo_sbe_v1_3.fields.message_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: Common Header
memx_options_memo_sbe_v1_3_size_of.common_header = function(buffer, offset)
  local index = 0

  index = index + memx_options_memo_sbe_v1_3_size_of.message_type

  index = index + memx_options_memo_sbe_v1_3_size_of.message_length

  return index
end

-- Display: Common Header
memx_options_memo_sbe_v1_3_display.common_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Common Header
memx_options_memo_sbe_v1_3_dissect.common_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Type: 1 Byte Unsigned Fixed Width Integer Enum with 16 values
  index, message_type = memx_options_memo_sbe_v1_3_dissect.message_type(buffer, index, packet, parent)

  -- Message Length: 2 Byte Unsigned Fixed Width Integer
  index, message_length = memx_options_memo_sbe_v1_3_dissect.message_length(buffer, index, packet, parent)

  return index
end

-- Dissect: Common Header
memx_options_memo_sbe_v1_3_dissect.common_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.common_header then
    local length = memx_options_memo_sbe_v1_3_size_of.common_header(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memo_sbe_v1_3_display.common_header(buffer, packet, parent)
    parent = parent:add(memx_options_memo_sbe_v1_3.fields.common_header, range, display)
  end

  return memx_options_memo_sbe_v1_3_dissect.common_header_fields(buffer, offset, packet, parent)
end

-- Dissect Packet
memx_options_memo_sbe_v1_3_dissect.packet = function(buffer, packet, parent)
  local index = 0

  -- Common Header: Struct of 2 fields
  index, common_header = memx_options_memo_sbe_v1_3_dissect.common_header(buffer, index, packet, parent)

  -- Dependency element: Message Type
  local message_type = buffer(index - 3, 1):uint()

  -- Data: Runtime Type with 15 branches
  index = memx_options_memo_sbe_v1_3_dissect.data(buffer, index, packet, parent, message_type)

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function memx_options_memo_sbe_v1_3.init()
end

-- Dissector for Memx Options Memo Sbe 1.3
function memx_options_memo_sbe_v1_3.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = memx_options_memo_sbe_v1_3.name

  -- Dissect protocol
  local protocol = parent:add(memx_options_memo_sbe_v1_3, buffer(), memx_options_memo_sbe_v1_3.description, "("..buffer:len().." Bytes)")
  return memx_options_memo_sbe_v1_3_dissect.packet(buffer, packet, protocol)
end

-- Register With Tcp Table
local tcp_table = DissectorTable.get("tcp.port")
tcp_table:add(65333, memx_options_memo_sbe_v1_3)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.memx_options_memo_sbe_v1_3_packet_size = function(buffer)

  return true
end

-- Verify Schema Id Field
verify.schema_id = function(buffer)
  -- Attempt to read field
  local value = buffer(52, 1):uint()

  if value == 9 then
    return true
  end

  return false
end

-- Verify Version Field
verify.version = function(buffer)
  -- Attempt to read field
  local value = buffer(53, 2):uint()

  if value == 259 then
    return true
  end

  return false
end

-- Verify Schema Id Field
verify.schema_id = function(buffer)
  -- Attempt to read field
  local value = buffer(1929, 1):uint()

  if value == 9 then
    return true
  end

  return false
end

-- Verify Version Field
verify.version = function(buffer)
  -- Attempt to read field
  local value = buffer(1930, 2):uint()

  if value == 259 then
    return true
  end

  return false
end

-- Dissector Heuristic for Memx Options Memo Sbe 1.3
local function memx_options_memo_sbe_v1_3_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.memx_options_memo_sbe_v1_3_packet_size(buffer) then return false end

  -- Verify Schema Id
  if not verify.schema_id(buffer) then return false end

  -- Verify Version
  if not verify.version(buffer) then return false end

  -- Verify Schema Id
  if not verify.schema_id(buffer) then return false end

  -- Verify Version
  if not verify.version(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = memx_options_memo_sbe_v1_3
  memx_options_memo_sbe_v1_3.dissector(buffer, packet, parent)

  return true
end

-- Register Heuristic for Memx Options Memo Sbe 1.3
memx_options_memo_sbe_v1_3:register_heuristic("tcp", memx_options_memo_sbe_v1_3_heuristic)

-----------------------------------------------------------------------
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- 
-- Protocol:
--   Organization: Members Exchange
--   Version: 1.3
--   Date: Thursday, June 29, 2023
--   Specification: MEMO SBE for Options-v1_3
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