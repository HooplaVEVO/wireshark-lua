-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Memx Options MemoirDepth Sbe 1.3 Protocol
local memx_options_memoirdepth_sbe_v1_3 = Proto("Memx.Options.MemoirDepth.Sbe.v1.3.Lua", "Memx Options MemoirDepth Sbe 1.3")

-- Component Tables
local show = {}
local format = {}
local memx_options_memoirdepth_sbe_v1_3_display = {}
local memx_options_memoirdepth_sbe_v1_3_dissect = {}
local memx_options_memoirdepth_sbe_v1_3_size_of = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Memx Options MemoirDepth Sbe 1.3 Fields
memx_options_memoirdepth_sbe_v1_3.fields.as_of_sequence_number = ProtoField.new("As Of Sequence Number", "memx.options.memoirdepth.sbe.v1.3.asofsequencenumber", ftypes.UINT64)
memx_options_memoirdepth_sbe_v1_3.fields.block_length = ProtoField.new("Block Length", "memx.options.memoirdepth.sbe.v1.3.blocklength", ftypes.UINT16)
memx_options_memoirdepth_sbe_v1_3.fields.broken_trade_message = ProtoField.new("Broken Trade Message", "memx.options.memoirdepth.sbe.v1.3.brokentrademessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.clear_book_message = ProtoField.new("Clear Book Message", "memx.options.memoirdepth.sbe.v1.3.clearbookmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.closing_only = ProtoField.new("Closing Only", "memx.options.memoirdepth.sbe.v1.3.closingonly", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.closing_time = ProtoField.new("Closing Time", "memx.options.memoirdepth.sbe.v1.3.closingtime", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.common_header = ProtoField.new("Common Header", "memx.options.memoirdepth.sbe.v1.3.commonheader", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.corrected_price = ProtoField.new("Corrected Price", "memx.options.memoirdepth.sbe.v1.3.correctedprice", ftypes.INT8)
memx_options_memoirdepth_sbe_v1_3.fields.corrected_quantity = ProtoField.new("Corrected Quantity", "memx.options.memoirdepth.sbe.v1.3.correctedquantity", ftypes.UINT32)
memx_options_memoirdepth_sbe_v1_3.fields.corrected_trade_message = ProtoField.new("Corrected Trade Message", "memx.options.memoirdepth.sbe.v1.3.correctedtrademessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.header_length = ProtoField.new("Header Length", "memx.options.memoirdepth.sbe.v1.3.headerlength", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.instrument_directory_message = ProtoField.new("Instrument Directory Message", "memx.options.memoirdepth.sbe.v1.3.instrumentdirectorymessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.instrument_trading_status = ProtoField.new("Instrument Trading Status", "memx.options.memoirdepth.sbe.v1.3.instrumenttradingstatus", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.instrument_trading_status_message = ProtoField.new("Instrument Trading Status Message", "memx.options.memoirdepth.sbe.v1.3.instrumenttradingstatusmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.instrument_trading_status_reason = ProtoField.new("Instrument Trading Status Reason", "memx.options.memoirdepth.sbe.v1.3.instrumenttradingstatusreason", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.intermarket_sweep = ProtoField.new("Intermarket Sweep", "memx.options.memoirdepth.sbe.v1.3.intermarketsweep", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x01")
memx_options_memoirdepth_sbe_v1_3.fields.is_test_symbol = ProtoField.new("Is Test Symbol", "memx.options.memoirdepth.sbe.v1.3.istestsymbol", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.maturity_date = ProtoField.new("Maturity Date", "memx.options.memoirdepth.sbe.v1.3.maturitydate", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.message = ProtoField.new("Message", "memx.options.memoirdepth.sbe.v1.3.message", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.message_count = ProtoField.new("Message Count", "memx.options.memoirdepth.sbe.v1.3.messagecount", ftypes.UINT16)
memx_options_memoirdepth_sbe_v1_3.fields.message_length = ProtoField.new("Message Length", "memx.options.memoirdepth.sbe.v1.3.messagelength", ftypes.UINT16)
memx_options_memoirdepth_sbe_v1_3.fields.message_type = ProtoField.new("Message Type", "memx.options.memoirdepth.sbe.v1.3.messagetype", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.options_product_type = ProtoField.new("Options Product Type", "memx.options.memoirdepth.sbe.v1.3.optionsproducttype", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.order_added_extended_message = ProtoField.new("Order Added Extended Message", "memx.options.memoirdepth.sbe.v1.3.orderaddedextendedmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.order_added_long_message = ProtoField.new("Order Added Long Message", "memx.options.memoirdepth.sbe.v1.3.orderaddedlongmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.order_added_short_message = ProtoField.new("Order Added Short Message", "memx.options.memoirdepth.sbe.v1.3.orderaddedshortmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.order_capacity = ProtoField.new("Order Capacity", "memx.options.memoirdepth.sbe.v1.3.ordercapacity", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.order_deleted_message = ProtoField.new("Order Deleted Message", "memx.options.memoirdepth.sbe.v1.3.orderdeletedmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.order_executed_message = ProtoField.new("Order Executed Message", "memx.options.memoirdepth.sbe.v1.3.orderexecutedmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.order_id = ProtoField.new("Order Id", "memx.options.memoirdepth.sbe.v1.3.orderid", ftypes.UINT64)
memx_options_memoirdepth_sbe_v1_3.fields.order_reduced_message = ProtoField.new("Order Reduced Message", "memx.options.memoirdepth.sbe.v1.3.orderreducedmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.original_price = ProtoField.new("Original Price", "memx.options.memoirdepth.sbe.v1.3.originalprice", ftypes.INT8)
memx_options_memoirdepth_sbe_v1_3.fields.original_quantity = ProtoField.new("Original Quantity", "memx.options.memoirdepth.sbe.v1.3.originalquantity", ftypes.UINT32)
memx_options_memoirdepth_sbe_v1_3.fields.osi_root = ProtoField.new("Osi Root", "memx.options.memoirdepth.sbe.v1.3.osiroot", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.packet = ProtoField.new("Packet", "memx.options.memoirdepth.sbe.v1.3.packet", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.payload = ProtoField.new("Payload", "memx.options.memoirdepth.sbe.v1.3.payload", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.price_price_type = ProtoField.new("Price Price Type", "memx.options.memoirdepth.sbe.v1.3.pricepricetype", ftypes.INT8)
memx_options_memoirdepth_sbe_v1_3.fields.price_short_price_type = ProtoField.new("Price Short Price Type", "memx.options.memoirdepth.sbe.v1.3.priceshortpricetype", ftypes.INT8)
memx_options_memoirdepth_sbe_v1_3.fields.quantity_reduced = ProtoField.new("Quantity Reduced", "memx.options.memoirdepth.sbe.v1.3.quantityreduced", ftypes.UINT32)
memx_options_memoirdepth_sbe_v1_3.fields.quantity_uint_16 = ProtoField.new("Quantity uint 16", "memx.options.memoirdepth.sbe.v1.3.quantityuint16", ftypes.UINT16)
memx_options_memoirdepth_sbe_v1_3.fields.quantity_uint_32 = ProtoField.new("Quantity uint 32", "memx.options.memoirdepth.sbe.v1.3.quantityuint32", ftypes.UINT32)
memx_options_memoirdepth_sbe_v1_3.fields.reserved_7 = ProtoField.new("Reserved 7", "memx.options.memoirdepth.sbe.v1.3.reserved7", ftypes.UINT8, nil, base.DEC, "0xFE")
memx_options_memoirdepth_sbe_v1_3.fields.sbe_header = ProtoField.new("Sbe Header", "memx.options.memoirdepth.sbe.v1.3.sbeheader", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.sbe_message = ProtoField.new("Sbe Message", "memx.options.memoirdepth.sbe.v1.3.sbemessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.schema_id = ProtoField.new("Schema Id", "memx.options.memoirdepth.sbe.v1.3.schemaid", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.sequence_number = ProtoField.new("Sequence Number", "memx.options.memoirdepth.sbe.v1.3.sequencenumber", ftypes.UINT64)
memx_options_memoirdepth_sbe_v1_3.fields.sequenced_message = ProtoField.new("Sequenced Message", "memx.options.memoirdepth.sbe.v1.3.sequencedmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.sequenced_messages = ProtoField.new("Sequenced Messages", "memx.options.memoirdepth.sbe.v1.3.sequencedmessages", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.session_id = ProtoField.new("Session Id", "memx.options.memoirdepth.sbe.v1.3.sessionid", ftypes.UINT64)
memx_options_memoirdepth_sbe_v1_3.fields.side = ProtoField.new("Side", "memx.options.memoirdepth.sbe.v1.3.side", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.snapshot_complete_message = ProtoField.new("Snapshot Complete Message", "memx.options.memoirdepth.sbe.v1.3.snapshotcompletemessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.strike_price = ProtoField.new("Strike Price", "memx.options.memoirdepth.sbe.v1.3.strikeprice", ftypes.INT8)
memx_options_memoirdepth_sbe_v1_3.fields.strike_put_or_call = ProtoField.new("Strike Put Or Call", "memx.options.memoirdepth.sbe.v1.3.strikeputorcall", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_broken_trade_symbol = ProtoField.new("Symbol Broken Trade Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolbrokentradesymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_clear_book_symbol = ProtoField.new("Symbol Clear Book Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolclearbooksymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_corrected_trade_symbol = ProtoField.new("Symbol Corrected Trade Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolcorrectedtradesymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_instrument_directory_symbol = ProtoField.new("Symbol Instrument Directory Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolinstrumentdirectorysymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_instrument_trading_status_symbol = ProtoField.new("Symbol Instrument Trading Status Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolinstrumenttradingstatussymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_added_extended_symbol = ProtoField.new("Symbol Order Added Extended Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolorderaddedextendedsymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_added_long_symbol = ProtoField.new("Symbol Order Added Long Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolorderaddedlongsymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_added_short_symbol = ProtoField.new("Symbol Order Added Short Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolorderaddedshortsymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_deleted_symbol = ProtoField.new("Symbol Order Deleted Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolorderdeletedsymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_executed_symbol = ProtoField.new("Symbol Order Executed Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolorderexecutedsymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_reduced_symbol = ProtoField.new("Symbol Order Reduced Symbol", "memx.options.memoirdepth.sbe.v1.3.symbolorderreducedsymbol", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.template_id = ProtoField.new("Template Id", "memx.options.memoirdepth.sbe.v1.3.templateid", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.timestamp = ProtoField.new("Timestamp", "memx.options.memoirdepth.sbe.v1.3.timestamp", ftypes.UINT8)
memx_options_memoirdepth_sbe_v1_3.fields.trade_conditions = ProtoField.new("Trade Conditions", "memx.options.memoirdepth.sbe.v1.3.tradeconditions", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.trade_id = ProtoField.new("Trade Id", "memx.options.memoirdepth.sbe.v1.3.tradeid", ftypes.UINT64)
memx_options_memoirdepth_sbe_v1_3.fields.trading_session = ProtoField.new("Trading Session", "memx.options.memoirdepth.sbe.v1.3.tradingsession", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.trading_session_status_message = ProtoField.new("Trading Session Status Message", "memx.options.memoirdepth.sbe.v1.3.tradingsessionstatusmessage", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.underlier = ProtoField.new("Underlier", "memx.options.memoirdepth.sbe.v1.3.underlier", ftypes.STRING)
memx_options_memoirdepth_sbe_v1_3.fields.version = ProtoField.new("Version", "memx.options.memoirdepth.sbe.v1.3.version", ftypes.UINT16)

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Memx Options MemoirDepth Sbe 1.3 Element Dissection Options
show.broken_trade_message = true
show.clear_book_message = true
show.common_header = true
show.corrected_trade_message = true
show.instrument_directory_message = true
show.instrument_trading_status_message = true
show.message = true
show.order_added_extended_message = true
show.order_added_long_message = true
show.order_added_short_message = true
show.order_deleted_message = true
show.order_executed_message = true
show.order_reduced_message = true
show.packet = true
show.sbe_header = true
show.sbe_message = true
show.sequenced_message = true
show.snapshot_complete_message = true
show.trade_conditions = true
show.trading_session_status_message = true
show.payload = false
show.sequenced_messages = false

-- Register Memx Options MemoirDepth Sbe 1.3 Show Options
memx_options_memoirdepth_sbe_v1_3.prefs.show_broken_trade_message = Pref.bool("Show Broken Trade Message", show.broken_trade_message, "Parse and add Broken Trade Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_clear_book_message = Pref.bool("Show Clear Book Message", show.clear_book_message, "Parse and add Clear Book Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_common_header = Pref.bool("Show Common Header", show.common_header, "Parse and add Common Header to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_corrected_trade_message = Pref.bool("Show Corrected Trade Message", show.corrected_trade_message, "Parse and add Corrected Trade Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_instrument_directory_message = Pref.bool("Show Instrument Directory Message", show.instrument_directory_message, "Parse and add Instrument Directory Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_instrument_trading_status_message = Pref.bool("Show Instrument Trading Status Message", show.instrument_trading_status_message, "Parse and add Instrument Trading Status Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_message = Pref.bool("Show Message", show.message, "Parse and add Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_order_added_extended_message = Pref.bool("Show Order Added Extended Message", show.order_added_extended_message, "Parse and add Order Added Extended Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_order_added_long_message = Pref.bool("Show Order Added Long Message", show.order_added_long_message, "Parse and add Order Added Long Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_order_added_short_message = Pref.bool("Show Order Added Short Message", show.order_added_short_message, "Parse and add Order Added Short Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_order_deleted_message = Pref.bool("Show Order Deleted Message", show.order_deleted_message, "Parse and add Order Deleted Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_order_executed_message = Pref.bool("Show Order Executed Message", show.order_executed_message, "Parse and add Order Executed Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_order_reduced_message = Pref.bool("Show Order Reduced Message", show.order_reduced_message, "Parse and add Order Reduced Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_sbe_header = Pref.bool("Show Sbe Header", show.sbe_header, "Parse and add Sbe Header to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_sbe_message = Pref.bool("Show Sbe Message", show.sbe_message, "Parse and add Sbe Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_sequenced_message = Pref.bool("Show Sequenced Message", show.sequenced_message, "Parse and add Sequenced Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_snapshot_complete_message = Pref.bool("Show Snapshot Complete Message", show.snapshot_complete_message, "Parse and add Snapshot Complete Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_trade_conditions = Pref.bool("Show Trade Conditions", show.trade_conditions, "Parse and add Trade Conditions to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_trading_session_status_message = Pref.bool("Show Trading Session Status Message", show.trading_session_status_message, "Parse and add Trading Session Status Message to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_payload = Pref.bool("Show Payload", show.payload, "Parse and add Payload to protocol tree")
memx_options_memoirdepth_sbe_v1_3.prefs.show_sequenced_messages = Pref.bool("Show Sequenced Messages", show.sequenced_messages, "Parse and add Sequenced Messages to protocol tree")

-- Handle changed preferences
function memx_options_memoirdepth_sbe_v1_3.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.broken_trade_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_broken_trade_message then
    show.broken_trade_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_broken_trade_message
    changed = true
  end
  if show.clear_book_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_clear_book_message then
    show.clear_book_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_clear_book_message
    changed = true
  end
  if show.common_header ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_common_header then
    show.common_header = memx_options_memoirdepth_sbe_v1_3.prefs.show_common_header
    changed = true
  end
  if show.corrected_trade_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_corrected_trade_message then
    show.corrected_trade_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_corrected_trade_message
    changed = true
  end
  if show.instrument_directory_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_instrument_directory_message then
    show.instrument_directory_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_instrument_directory_message
    changed = true
  end
  if show.instrument_trading_status_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_instrument_trading_status_message then
    show.instrument_trading_status_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_instrument_trading_status_message
    changed = true
  end
  if show.message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_message then
    show.message = memx_options_memoirdepth_sbe_v1_3.prefs.show_message
    changed = true
  end
  if show.order_added_extended_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_order_added_extended_message then
    show.order_added_extended_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_order_added_extended_message
    changed = true
  end
  if show.order_added_long_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_order_added_long_message then
    show.order_added_long_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_order_added_long_message
    changed = true
  end
  if show.order_added_short_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_order_added_short_message then
    show.order_added_short_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_order_added_short_message
    changed = true
  end
  if show.order_deleted_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_order_deleted_message then
    show.order_deleted_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_order_deleted_message
    changed = true
  end
  if show.order_executed_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_order_executed_message then
    show.order_executed_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_order_executed_message
    changed = true
  end
  if show.order_reduced_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_order_reduced_message then
    show.order_reduced_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_order_reduced_message
    changed = true
  end
  if show.packet ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_packet then
    show.packet = memx_options_memoirdepth_sbe_v1_3.prefs.show_packet
    changed = true
  end
  if show.sbe_header ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_sbe_header then
    show.sbe_header = memx_options_memoirdepth_sbe_v1_3.prefs.show_sbe_header
    changed = true
  end
  if show.sbe_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_sbe_message then
    show.sbe_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_sbe_message
    changed = true
  end
  if show.sequenced_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_sequenced_message then
    show.sequenced_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_sequenced_message
    changed = true
  end
  if show.snapshot_complete_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_snapshot_complete_message then
    show.snapshot_complete_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_snapshot_complete_message
    changed = true
  end
  if show.trade_conditions ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_trade_conditions then
    show.trade_conditions = memx_options_memoirdepth_sbe_v1_3.prefs.show_trade_conditions
    changed = true
  end
  if show.trading_session_status_message ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_trading_session_status_message then
    show.trading_session_status_message = memx_options_memoirdepth_sbe_v1_3.prefs.show_trading_session_status_message
    changed = true
  end
  if show.payload ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_payload then
    show.payload = memx_options_memoirdepth_sbe_v1_3.prefs.show_payload
    changed = true
  end
  if show.sequenced_messages ~= memx_options_memoirdepth_sbe_v1_3.prefs.show_sequenced_messages then
    show.sequenced_messages = memx_options_memoirdepth_sbe_v1_3.prefs.show_sequenced_messages
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Memx Options MemoirDepth Sbe 1.3
-----------------------------------------------------------------------

-- Size: Symbol Clear Book Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_clear_book_symbol = 8

-- Display: Symbol Clear Book Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_clear_book_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Clear Book Symbol: No Value"
  end

  return "Symbol Clear Book Symbol: "..value
end

-- Dissect: Symbol Clear Book Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_clear_book_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_clear_book_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_clear_book_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_clear_book_symbol, range, value, display)

  return offset + length, value
end

-- Size: Timestamp
memx_options_memoirdepth_sbe_v1_3_size_of.timestamp = 1

-- Display: Timestamp
memx_options_memoirdepth_sbe_v1_3_display.timestamp = function(value)
  return "Timestamp: "..value
end

-- Dissect: Timestamp
memx_options_memoirdepth_sbe_v1_3_dissect.timestamp = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.timestamp
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.timestamp(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.timestamp, range, value, display)

  return offset + length, value
end

-- Calculate size of: Clear Book Message
memx_options_memoirdepth_sbe_v1_3_size_of.clear_book_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_clear_book_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Clear Book Message
memx_options_memoirdepth_sbe_v1_3_display.clear_book_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Clear Book Message
memx_options_memoirdepth_sbe_v1_3_dissect.clear_book_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Clear Book Symbol: 8 Byte Ascii String
  index, symbol_clear_book_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_clear_book_symbol(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Clear Book Message
memx_options_memoirdepth_sbe_v1_3_dissect.clear_book_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.clear_book_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.clear_book_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.clear_book_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.clear_book_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.clear_book_message_fields(buffer, offset, packet, parent)
end

-- Size: Price Price Type
memx_options_memoirdepth_sbe_v1_3_size_of.price_price_type = 1

-- Display: Price Price Type
memx_options_memoirdepth_sbe_v1_3_display.price_price_type = function(value)
  return "Price Price Type: "..value
end

-- Dissect: Price Price Type
memx_options_memoirdepth_sbe_v1_3_dissect.price_price_type = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.price_price_type
  local range = buffer(offset, length)
  local value = range:int()
  local display = memx_options_memoirdepth_sbe_v1_3_display.price_price_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.price_price_type, range, value, display)

  return offset + length, value
end

-- Size: Quantity uint 32
memx_options_memoirdepth_sbe_v1_3_size_of.quantity_uint_32 = 4

-- Display: Quantity uint 32
memx_options_memoirdepth_sbe_v1_3_display.quantity_uint_32 = function(value)
  return "Quantity uint 32: "..value
end

-- Dissect: Quantity uint 32
memx_options_memoirdepth_sbe_v1_3_dissect.quantity_uint_32 = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.quantity_uint_32
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.quantity_uint_32(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.quantity_uint_32, range, value, display)

  return offset + length, value
end

-- Size: Trade Id
memx_options_memoirdepth_sbe_v1_3_size_of.trade_id = 8

-- Display: Trade Id
memx_options_memoirdepth_sbe_v1_3_display.trade_id = function(value)
  return "Trade Id: "..value
end

-- Dissect: Trade Id
memx_options_memoirdepth_sbe_v1_3_dissect.trade_id = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.trade_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memoirdepth_sbe_v1_3_display.trade_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.trade_id, range, value, display)

  return offset + length, value
end

-- Size: Order Id
memx_options_memoirdepth_sbe_v1_3_size_of.order_id = 8

-- Display: Order Id
memx_options_memoirdepth_sbe_v1_3_display.order_id = function(value)
  return "Order Id: "..value
end

-- Dissect: Order Id
memx_options_memoirdepth_sbe_v1_3_dissect.order_id = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.order_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memoirdepth_sbe_v1_3_display.order_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.order_id, range, value, display)

  return offset + length, value
end

-- Size: Trade Conditions
memx_options_memoirdepth_sbe_v1_3_size_of.trade_conditions = 1

-- Display: Trade Conditions
memx_options_memoirdepth_sbe_v1_3_display.trade_conditions = function(buffer, packet, parent)
  local display = ""

  -- Is Intermarket Sweep flag set?
  if buffer:bitfield(7) > 0 then
    display = display.."Intermarket Sweep|"
  end

  return display:sub(1, -2)
end

-- Dissect Bit Fields: Trade Conditions
memx_options_memoirdepth_sbe_v1_3_dissect.trade_conditions_bits = function(buffer, offset, packet, parent)

  -- Reserved 7: 7 Bit
  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.reserved_7, buffer(offset, 1))

  -- Intermarket Sweep: 1 Bit
  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.intermarket_sweep, buffer(offset, 1))
end

-- Dissect: Trade Conditions
memx_options_memoirdepth_sbe_v1_3_dissect.trade_conditions = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local display = memx_options_memoirdepth_sbe_v1_3_display.trade_conditions(range, packet, parent)
  local element = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.trade_conditions, range, display)

  if show.trade_conditions then
    memx_options_memoirdepth_sbe_v1_3_dissect.trade_conditions_bits(buffer, offset, packet, element)
  end

  return offset + 1, range
end

-- Size: Order Capacity
memx_options_memoirdepth_sbe_v1_3_size_of.order_capacity = 1

-- Display: Order Capacity
memx_options_memoirdepth_sbe_v1_3_display.order_capacity = function(value)
  if value == "C" then
    return "Order Capacity: Customer (C)"
  end
  if value == "N" then
    return "Order Capacity: Non Customer (N)"
  end

  return "Order Capacity: Unknown("..value..")"
end

-- Dissect: Order Capacity
memx_options_memoirdepth_sbe_v1_3_dissect.order_capacity = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.order_capacity
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memoirdepth_sbe_v1_3_display.order_capacity(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.order_capacity, range, value, display)

  return offset + length, value
end

-- Size: Symbol Order Executed Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_executed_symbol = 8

-- Display: Symbol Order Executed Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_order_executed_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Order Executed Symbol: No Value"
  end

  return "Symbol Order Executed Symbol: "..value
end

-- Dissect: Symbol Order Executed Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_executed_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_executed_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_order_executed_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_executed_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Executed Message
memx_options_memoirdepth_sbe_v1_3_size_of.order_executed_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_executed_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_capacity

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.trade_conditions

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.trade_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.quantity_uint_32

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_14

  return index
end

-- Display: Order Executed Message
memx_options_memoirdepth_sbe_v1_3_display.order_executed_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Executed Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_executed_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Order Executed Symbol: 8 Byte Ascii String
  index, symbol_order_executed_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_executed_symbol(buffer, index, packet, parent)

  -- Order Capacity: 1 Byte Ascii String Enum with 2 values
  index, order_capacity = memx_options_memoirdepth_sbe_v1_3_dissect.order_capacity(buffer, index, packet, parent)

  -- Trade Conditions: Struct of 2 fields
  index, trade_conditions = memx_options_memoirdepth_sbe_v1_3_dissect.trade_conditions(buffer, index, packet, parent)

  -- Order Id: 8 Byte Unsigned Fixed Width Integer
  index, order_id = memx_options_memoirdepth_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Trade Id: 8 Byte Unsigned Fixed Width Integer
  index, trade_id = memx_options_memoirdepth_sbe_v1_3_dissect.trade_id(buffer, index, packet, parent)

  -- Quantity uint 32: 4 Byte Unsigned Fixed Width Integer
  index, quantity_uint_32 = memx_options_memoirdepth_sbe_v1_3_dissect.quantity_uint_32(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer
  index, price_price_type = memx_options_memoirdepth_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Executed Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_executed_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_executed_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.order_executed_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.order_executed_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.order_executed_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.order_executed_message_fields(buffer, offset, packet, parent)
end

-- Size: Quantity Reduced
memx_options_memoirdepth_sbe_v1_3_size_of.quantity_reduced = 4

-- Display: Quantity Reduced
memx_options_memoirdepth_sbe_v1_3_display.quantity_reduced = function(value)
  return "Quantity Reduced: "..value
end

-- Dissect: Quantity Reduced
memx_options_memoirdepth_sbe_v1_3_dissect.quantity_reduced = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.quantity_reduced
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.quantity_reduced(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.quantity_reduced, range, value, display)

  return offset + length, value
end

-- Size: Side
memx_options_memoirdepth_sbe_v1_3_size_of.side = 1

-- Display: Side
memx_options_memoirdepth_sbe_v1_3_display.side = function(value)
  if value == "B" then
    return "Side: Buy (B)"
  end
  if value == "S" then
    return "Side: Sell (S)"
  end

  return "Side: Unknown("..value..")"
end

-- Dissect: Side
memx_options_memoirdepth_sbe_v1_3_dissect.side = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.side
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memoirdepth_sbe_v1_3_display.side(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.side, range, value, display)

  return offset + length, value
end

-- Size: Symbol Order Reduced Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_reduced_symbol = 8

-- Display: Symbol Order Reduced Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_order_reduced_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Order Reduced Symbol: No Value"
  end

  return "Symbol Order Reduced Symbol: "..value
end

-- Dissect: Symbol Order Reduced Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_reduced_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_reduced_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_order_reduced_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_reduced_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Reduced Message
memx_options_memoirdepth_sbe_v1_3_size_of.order_reduced_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_reduced_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_capacity

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.side

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.quantity_uint_32

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.quantity_reduced

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_14

  return index
end

-- Display: Order Reduced Message
memx_options_memoirdepth_sbe_v1_3_display.order_reduced_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Reduced Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_reduced_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Order Reduced Symbol: 8 Byte Ascii String
  index, symbol_order_reduced_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_reduced_symbol(buffer, index, packet, parent)

  -- Order Capacity: 1 Byte Ascii String Enum with 2 values
  index, order_capacity = memx_options_memoirdepth_sbe_v1_3_dissect.order_capacity(buffer, index, packet, parent)

  -- Order Id: 8 Byte Unsigned Fixed Width Integer
  index, order_id = memx_options_memoirdepth_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index, side = memx_options_memoirdepth_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Quantity uint 32: 4 Byte Unsigned Fixed Width Integer
  index, quantity_uint_32 = memx_options_memoirdepth_sbe_v1_3_dissect.quantity_uint_32(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer
  index, price_price_type = memx_options_memoirdepth_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Quantity Reduced: 4 Byte Unsigned Fixed Width Integer
  index, quantity_reduced = memx_options_memoirdepth_sbe_v1_3_dissect.quantity_reduced(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Reduced Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_reduced_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_reduced_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.order_reduced_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.order_reduced_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.order_reduced_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.order_reduced_message_fields(buffer, offset, packet, parent)
end

-- Size: Symbol Order Deleted Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_deleted_symbol = 8

-- Display: Symbol Order Deleted Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_order_deleted_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Order Deleted Symbol: No Value"
  end

  return "Symbol Order Deleted Symbol: "..value
end

-- Dissect: Symbol Order Deleted Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_deleted_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_deleted_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_order_deleted_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_deleted_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Deleted Message
memx_options_memoirdepth_sbe_v1_3_size_of.order_deleted_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_deleted_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_capacity

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Order Deleted Message
memx_options_memoirdepth_sbe_v1_3_display.order_deleted_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Deleted Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_deleted_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Order Deleted Symbol: 8 Byte Ascii String
  index, symbol_order_deleted_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_deleted_symbol(buffer, index, packet, parent)

  -- Order Capacity: 1 Byte Ascii String Enum with 2 values
  index, order_capacity = memx_options_memoirdepth_sbe_v1_3_dissect.order_capacity(buffer, index, packet, parent)

  -- Order Id: 8 Byte Unsigned Fixed Width Integer
  index, order_id = memx_options_memoirdepth_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Deleted Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_deleted_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_deleted_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.order_deleted_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.order_deleted_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.order_deleted_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.order_deleted_message_fields(buffer, offset, packet, parent)
end

-- Size: Symbol Order Added Extended Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_added_extended_symbol = 8

-- Display: Symbol Order Added Extended Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_order_added_extended_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Order Added Extended Symbol: No Value"
  end

  return "Symbol Order Added Extended Symbol: "..value
end

-- Dissect: Symbol Order Added Extended Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_added_extended_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_added_extended_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_order_added_extended_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_added_extended_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Added Extended Message
memx_options_memoirdepth_sbe_v1_3_size_of.order_added_extended_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_added_extended_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_capacity

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.side

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.quantity_uint_32

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_14

  return index
end

-- Display: Order Added Extended Message
memx_options_memoirdepth_sbe_v1_3_display.order_added_extended_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Added Extended Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_added_extended_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Order Added Extended Symbol: 8 Byte Ascii String
  index, symbol_order_added_extended_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_added_extended_symbol(buffer, index, packet, parent)

  -- Order Capacity: 1 Byte Ascii String Enum with 2 values
  index, order_capacity = memx_options_memoirdepth_sbe_v1_3_dissect.order_capacity(buffer, index, packet, parent)

  -- Order Id: 8 Byte Unsigned Fixed Width Integer
  index, order_id = memx_options_memoirdepth_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index, side = memx_options_memoirdepth_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Quantity uint 32: 4 Byte Unsigned Fixed Width Integer
  index, quantity_uint_32 = memx_options_memoirdepth_sbe_v1_3_dissect.quantity_uint_32(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer
  index, price_price_type = memx_options_memoirdepth_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Added Extended Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_added_extended_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_added_extended_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.order_added_extended_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.order_added_extended_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.order_added_extended_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.order_added_extended_message_fields(buffer, offset, packet, parent)
end

-- Size: Symbol Order Added Long Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_added_long_symbol = 8

-- Display: Symbol Order Added Long Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_order_added_long_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Order Added Long Symbol: No Value"
  end

  return "Symbol Order Added Long Symbol: "..value
end

-- Dissect: Symbol Order Added Long Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_added_long_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_added_long_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_order_added_long_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_added_long_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Added Long Message
memx_options_memoirdepth_sbe_v1_3_size_of.order_added_long_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_added_long_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.side

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.quantity_uint_32

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.price_price_type

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_14

  return index
end

-- Display: Order Added Long Message
memx_options_memoirdepth_sbe_v1_3_display.order_added_long_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Added Long Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_added_long_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Order Added Long Symbol: 8 Byte Ascii String
  index, symbol_order_added_long_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_added_long_symbol(buffer, index, packet, parent)

  -- Order Id: 8 Byte Unsigned Fixed Width Integer
  index, order_id = memx_options_memoirdepth_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index, side = memx_options_memoirdepth_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Quantity uint 32: 4 Byte Unsigned Fixed Width Integer
  index, quantity_uint_32 = memx_options_memoirdepth_sbe_v1_3_dissect.quantity_uint_32(buffer, index, packet, parent)

  -- Price Price Type: 1 Byte Signed Fixed Width Integer
  index, price_price_type = memx_options_memoirdepth_sbe_v1_3_dissect.price_price_type(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Added Long Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_added_long_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_added_long_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.order_added_long_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.order_added_long_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.order_added_long_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.order_added_long_message_fields(buffer, offset, packet, parent)
end

-- Size: Price Short Price Type
memx_options_memoirdepth_sbe_v1_3_size_of.price_short_price_type = 1

-- Display: Price Short Price Type
memx_options_memoirdepth_sbe_v1_3_display.price_short_price_type = function(value)
  return "Price Short Price Type: "..value
end

-- Dissect: Price Short Price Type
memx_options_memoirdepth_sbe_v1_3_dissect.price_short_price_type = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.price_short_price_type
  local range = buffer(offset, length)
  local value = range:int()
  local display = memx_options_memoirdepth_sbe_v1_3_display.price_short_price_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.price_short_price_type, range, value, display)

  return offset + length, value
end

-- Size: Quantity uint 16
memx_options_memoirdepth_sbe_v1_3_size_of.quantity_uint_16 = 2

-- Display: Quantity uint 16
memx_options_memoirdepth_sbe_v1_3_display.quantity_uint_16 = function(value)
  return "Quantity uint 16: "..value
end

-- Dissect: Quantity uint 16
memx_options_memoirdepth_sbe_v1_3_dissect.quantity_uint_16 = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.quantity_uint_16
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.quantity_uint_16(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.quantity_uint_16, range, value, display)

  return offset + length, value
end

-- Size: Symbol Order Added Short Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_added_short_symbol = 8

-- Display: Symbol Order Added Short Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_order_added_short_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Order Added Short Symbol: No Value"
  end

  return "Symbol Order Added Short Symbol: "..value
end

-- Dissect: Symbol Order Added Short Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_added_short_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_added_short_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_order_added_short_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_order_added_short_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Added Short Message
memx_options_memoirdepth_sbe_v1_3_size_of.order_added_short_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_order_added_short_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.order_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.side

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.quantity_uint_16

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.price_short_price_type

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_8

  return index
end

-- Display: Order Added Short Message
memx_options_memoirdepth_sbe_v1_3_display.order_added_short_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Added Short Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_added_short_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Order Added Short Symbol: 8 Byte Ascii String
  index, symbol_order_added_short_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_order_added_short_symbol(buffer, index, packet, parent)

  -- Order Id: 8 Byte Unsigned Fixed Width Integer
  index, order_id = memx_options_memoirdepth_sbe_v1_3_dissect.order_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index, side = memx_options_memoirdepth_sbe_v1_3_dissect.side(buffer, index, packet, parent)

  -- Quantity uint 16: 2 Byte Unsigned Fixed Width Integer
  index, quantity_uint_16 = memx_options_memoirdepth_sbe_v1_3_dissect.quantity_uint_16(buffer, index, packet, parent)

  -- Price Short Price Type: 1 Byte Signed Fixed Width Integer
  index, price_short_price_type = memx_options_memoirdepth_sbe_v1_3_dissect.price_short_price_type(buffer, index, packet, parent)

  -- Padding 8
  index, padding_8 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_8(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Added Short Message
memx_options_memoirdepth_sbe_v1_3_dissect.order_added_short_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_added_short_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.order_added_short_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.order_added_short_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.order_added_short_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.order_added_short_message_fields(buffer, offset, packet, parent)
end

-- Size: As Of Sequence Number
memx_options_memoirdepth_sbe_v1_3_size_of.as_of_sequence_number = 8

-- Display: As Of Sequence Number
memx_options_memoirdepth_sbe_v1_3_display.as_of_sequence_number = function(value)
  return "As Of Sequence Number: "..value
end

-- Dissect: As Of Sequence Number
memx_options_memoirdepth_sbe_v1_3_dissect.as_of_sequence_number = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.as_of_sequence_number
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memoirdepth_sbe_v1_3_display.as_of_sequence_number(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.as_of_sequence_number, range, value, display)

  return offset + length, value
end

-- Calculate size of: Snapshot Complete Message
memx_options_memoirdepth_sbe_v1_3_size_of.snapshot_complete_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.as_of_sequence_number

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Snapshot Complete Message
memx_options_memoirdepth_sbe_v1_3_display.snapshot_complete_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Snapshot Complete Message
memx_options_memoirdepth_sbe_v1_3_dissect.snapshot_complete_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- As Of Sequence Number: 8 Byte Unsigned Fixed Width Integer
  index, as_of_sequence_number = memx_options_memoirdepth_sbe_v1_3_dissect.as_of_sequence_number(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Snapshot Complete Message
memx_options_memoirdepth_sbe_v1_3_dissect.snapshot_complete_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.snapshot_complete_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.snapshot_complete_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.snapshot_complete_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.snapshot_complete_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.snapshot_complete_message_fields(buffer, offset, packet, parent)
end

-- Size: Corrected Price
memx_options_memoirdepth_sbe_v1_3_size_of.corrected_price = 1

-- Display: Corrected Price
memx_options_memoirdepth_sbe_v1_3_display.corrected_price = function(value)
  return "Corrected Price: "..value
end

-- Dissect: Corrected Price
memx_options_memoirdepth_sbe_v1_3_dissect.corrected_price = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.corrected_price
  local range = buffer(offset, length)
  local value = range:int()
  local display = memx_options_memoirdepth_sbe_v1_3_display.corrected_price(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.corrected_price, range, value, display)

  return offset + length, value
end

-- Size: Corrected Quantity
memx_options_memoirdepth_sbe_v1_3_size_of.corrected_quantity = 4

-- Display: Corrected Quantity
memx_options_memoirdepth_sbe_v1_3_display.corrected_quantity = function(value)
  return "Corrected Quantity: "..value
end

-- Dissect: Corrected Quantity
memx_options_memoirdepth_sbe_v1_3_dissect.corrected_quantity = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.corrected_quantity
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.corrected_quantity(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.corrected_quantity, range, value, display)

  return offset + length, value
end

-- Size: Original Price
memx_options_memoirdepth_sbe_v1_3_size_of.original_price = 1

-- Display: Original Price
memx_options_memoirdepth_sbe_v1_3_display.original_price = function(value)
  return "Original Price: "..value
end

-- Dissect: Original Price
memx_options_memoirdepth_sbe_v1_3_dissect.original_price = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.original_price
  local range = buffer(offset, length)
  local value = range:int()
  local display = memx_options_memoirdepth_sbe_v1_3_display.original_price(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.original_price, range, value, display)

  return offset + length, value
end

-- Size: Original Quantity
memx_options_memoirdepth_sbe_v1_3_size_of.original_quantity = 4

-- Display: Original Quantity
memx_options_memoirdepth_sbe_v1_3_display.original_quantity = function(value)
  return "Original Quantity: "..value
end

-- Dissect: Original Quantity
memx_options_memoirdepth_sbe_v1_3_dissect.original_quantity = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.original_quantity
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.original_quantity(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.original_quantity, range, value, display)

  return offset + length, value
end

-- Size: Symbol Corrected Trade Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_corrected_trade_symbol = 8

-- Display: Symbol Corrected Trade Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_corrected_trade_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Corrected Trade Symbol: No Value"
  end

  return "Symbol Corrected Trade Symbol: "..value
end

-- Dissect: Symbol Corrected Trade Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_corrected_trade_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_corrected_trade_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_corrected_trade_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_corrected_trade_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Corrected Trade Message
memx_options_memoirdepth_sbe_v1_3_size_of.corrected_trade_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_corrected_trade_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.trade_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.original_quantity

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.original_price

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.corrected_quantity

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.corrected_price

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_21

  return index
end

-- Display: Corrected Trade Message
memx_options_memoirdepth_sbe_v1_3_display.corrected_trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Corrected Trade Message
memx_options_memoirdepth_sbe_v1_3_dissect.corrected_trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Corrected Trade Symbol: 8 Byte Ascii String
  index, symbol_corrected_trade_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_corrected_trade_symbol(buffer, index, packet, parent)

  -- Trade Id: 8 Byte Unsigned Fixed Width Integer
  index, trade_id = memx_options_memoirdepth_sbe_v1_3_dissect.trade_id(buffer, index, packet, parent)

  -- Original Quantity: 4 Byte Unsigned Fixed Width Integer
  index, original_quantity = memx_options_memoirdepth_sbe_v1_3_dissect.original_quantity(buffer, index, packet, parent)

  -- Original Price: 1 Byte Signed Fixed Width Integer
  index, original_price = memx_options_memoirdepth_sbe_v1_3_dissect.original_price(buffer, index, packet, parent)

  -- Corrected Quantity: 4 Byte Unsigned Fixed Width Integer
  index, corrected_quantity = memx_options_memoirdepth_sbe_v1_3_dissect.corrected_quantity(buffer, index, packet, parent)

  -- Corrected Price: 1 Byte Signed Fixed Width Integer
  index, corrected_price = memx_options_memoirdepth_sbe_v1_3_dissect.corrected_price(buffer, index, packet, parent)

  -- Padding 21
  index, padding_21 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_21(buffer, index, packet, parent)

  return index
end

-- Dissect: Corrected Trade Message
memx_options_memoirdepth_sbe_v1_3_dissect.corrected_trade_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.corrected_trade_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.corrected_trade_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.corrected_trade_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.corrected_trade_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.corrected_trade_message_fields(buffer, offset, packet, parent)
end

-- Size: Symbol Broken Trade Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_broken_trade_symbol = 8

-- Display: Symbol Broken Trade Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_broken_trade_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Broken Trade Symbol: No Value"
  end

  return "Symbol Broken Trade Symbol: "..value
end

-- Dissect: Symbol Broken Trade Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_broken_trade_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_broken_trade_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_broken_trade_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_broken_trade_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Broken Trade Message
memx_options_memoirdepth_sbe_v1_3_size_of.broken_trade_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_broken_trade_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.trade_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.original_quantity

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.original_price

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_14

  return index
end

-- Display: Broken Trade Message
memx_options_memoirdepth_sbe_v1_3_display.broken_trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Broken Trade Message
memx_options_memoirdepth_sbe_v1_3_dissect.broken_trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Broken Trade Symbol: 8 Byte Ascii String
  index, symbol_broken_trade_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_broken_trade_symbol(buffer, index, packet, parent)

  -- Trade Id: 8 Byte Unsigned Fixed Width Integer
  index, trade_id = memx_options_memoirdepth_sbe_v1_3_dissect.trade_id(buffer, index, packet, parent)

  -- Original Quantity: 4 Byte Unsigned Fixed Width Integer
  index, original_quantity = memx_options_memoirdepth_sbe_v1_3_dissect.original_quantity(buffer, index, packet, parent)

  -- Original Price: 1 Byte Signed Fixed Width Integer
  index, original_price = memx_options_memoirdepth_sbe_v1_3_dissect.original_price(buffer, index, packet, parent)

  -- Padding 14
  index, padding_14 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_14(buffer, index, packet, parent)

  return index
end

-- Dissect: Broken Trade Message
memx_options_memoirdepth_sbe_v1_3_dissect.broken_trade_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.broken_trade_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.broken_trade_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.broken_trade_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.broken_trade_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.broken_trade_message_fields(buffer, offset, packet, parent)
end

-- Size: Trading Session
memx_options_memoirdepth_sbe_v1_3_size_of.trading_session = 1

-- Display: Trading Session
memx_options_memoirdepth_sbe_v1_3_display.trading_session = function(value)
  if value == "1" then
    return "Trading Session: Trading (1)"
  end
  if value == "2" then
    return "Trading Session: Closed (2)"
  end

  return "Trading Session: Unknown("..value..")"
end

-- Dissect: Trading Session
memx_options_memoirdepth_sbe_v1_3_dissect.trading_session = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.trading_session
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memoirdepth_sbe_v1_3_display.trading_session(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.trading_session, range, value, display)

  return offset + length, value
end

-- Calculate size of: Trading Session Status Message
memx_options_memoirdepth_sbe_v1_3_size_of.trading_session_status_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.trading_session

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Trading Session Status Message
memx_options_memoirdepth_sbe_v1_3_display.trading_session_status_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Trading Session Status Message
memx_options_memoirdepth_sbe_v1_3_dissect.trading_session_status_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Trading Session: 1 Byte Ascii String Enum with 2 values
  index, trading_session = memx_options_memoirdepth_sbe_v1_3_dissect.trading_session(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Trading Session Status Message
memx_options_memoirdepth_sbe_v1_3_dissect.trading_session_status_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.trading_session_status_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.trading_session_status_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.trading_session_status_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.trading_session_status_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.trading_session_status_message_fields(buffer, offset, packet, parent)
end

-- Size: Instrument Trading Status Reason
memx_options_memoirdepth_sbe_v1_3_size_of.instrument_trading_status_reason = 1

-- Display: Instrument Trading Status Reason
memx_options_memoirdepth_sbe_v1_3_display.instrument_trading_status_reason = function(value)
  if value == "X" then
    return "Instrument Trading Status Reason: None (X)"
  end
  if value == "A" then
    return "Instrument Trading Status Reason: Administrative (A)"
  end

  return "Instrument Trading Status Reason: Unknown("..value..")"
end

-- Dissect: Instrument Trading Status Reason
memx_options_memoirdepth_sbe_v1_3_dissect.instrument_trading_status_reason = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.instrument_trading_status_reason
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memoirdepth_sbe_v1_3_display.instrument_trading_status_reason(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.instrument_trading_status_reason, range, value, display)

  return offset + length, value
end

-- Size: Instrument Trading Status
memx_options_memoirdepth_sbe_v1_3_size_of.instrument_trading_status = 1

-- Display: Instrument Trading Status
memx_options_memoirdepth_sbe_v1_3_display.instrument_trading_status = function(value)
  if value == "H" then
    return "Instrument Trading Status: Halted (H)"
  end
  if value == "T" then
    return "Instrument Trading Status: Trading (T)"
  end

  return "Instrument Trading Status: Unknown("..value..")"
end

-- Dissect: Instrument Trading Status
memx_options_memoirdepth_sbe_v1_3_dissect.instrument_trading_status = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.instrument_trading_status
  local range = buffer(offset, length)

  -- parse as byte
  local value = range:uint()

  -- check if value is non zero
  if value == 0 then
    value = ''
  else
    value = range:string()
  end

  local display = memx_options_memoirdepth_sbe_v1_3_display.instrument_trading_status(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.instrument_trading_status, range, value, display)

  return offset + length, value
end

-- Size: Symbol Instrument Trading Status Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_instrument_trading_status_symbol = 8

-- Display: Symbol Instrument Trading Status Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_instrument_trading_status_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Instrument Trading Status Symbol: No Value"
  end

  return "Symbol Instrument Trading Status Symbol: "..value
end

-- Dissect: Symbol Instrument Trading Status Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_instrument_trading_status_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_instrument_trading_status_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_instrument_trading_status_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_instrument_trading_status_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Instrument Trading Status Message
memx_options_memoirdepth_sbe_v1_3_size_of.instrument_trading_status_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_instrument_trading_status_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.instrument_trading_status

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.instrument_trading_status_reason

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_7

  return index
end

-- Display: Instrument Trading Status Message
memx_options_memoirdepth_sbe_v1_3_display.instrument_trading_status_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Instrument Trading Status Message
memx_options_memoirdepth_sbe_v1_3_dissect.instrument_trading_status_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Instrument Trading Status Symbol: 8 Byte Ascii String
  index, symbol_instrument_trading_status_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_instrument_trading_status_symbol(buffer, index, packet, parent)

  -- Instrument Trading Status: 1 Byte Ascii String Enum with 2 values
  index, instrument_trading_status = memx_options_memoirdepth_sbe_v1_3_dissect.instrument_trading_status(buffer, index, packet, parent)

  -- Instrument Trading Status Reason: 1 Byte Ascii String Enum with 2 values
  index, instrument_trading_status_reason = memx_options_memoirdepth_sbe_v1_3_dissect.instrument_trading_status_reason(buffer, index, packet, parent)

  -- Padding 7
  index, padding_7 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_7(buffer, index, packet, parent)

  return index
end

-- Dissect: Instrument Trading Status Message
memx_options_memoirdepth_sbe_v1_3_dissect.instrument_trading_status_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.instrument_trading_status_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.instrument_trading_status_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.instrument_trading_status_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.instrument_trading_status_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.instrument_trading_status_message_fields(buffer, offset, packet, parent)
end

-- Size: Is Test Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.is_test_symbol = 1

-- Display: Is Test Symbol
memx_options_memoirdepth_sbe_v1_3_display.is_test_symbol = function(value)
  if value == 0 then
    return "Is Test Symbol: False (0)"
  end
  if value == 1 then
    return "Is Test Symbol: True (1)"
  end

  return "Is Test Symbol: Unknown("..value..")"
end

-- Dissect: Is Test Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.is_test_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.is_test_symbol
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.is_test_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.is_test_symbol, range, value, display)

  return offset + length, value
end

-- Size: Closing Time
memx_options_memoirdepth_sbe_v1_3_size_of.closing_time = 1

-- Display: Closing Time
memx_options_memoirdepth_sbe_v1_3_display.closing_time = function(value)
  return "Closing Time: "..value
end

-- Dissect: Closing Time
memx_options_memoirdepth_sbe_v1_3_dissect.closing_time = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.closing_time
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.closing_time(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.closing_time, range, value, display)

  return offset + length, value
end

-- Size: Closing Only
memx_options_memoirdepth_sbe_v1_3_size_of.closing_only = 1

-- Display: Closing Only
memx_options_memoirdepth_sbe_v1_3_display.closing_only = function(value)
  if value == 0 then
    return "Closing Only: False (0)"
  end
  if value == 1 then
    return "Closing Only: True (1)"
  end

  return "Closing Only: Unknown("..value..")"
end

-- Dissect: Closing Only
memx_options_memoirdepth_sbe_v1_3_dissect.closing_only = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.closing_only
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.closing_only(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.closing_only, range, value, display)

  return offset + length, value
end

-- Size: Strike Price
memx_options_memoirdepth_sbe_v1_3_size_of.strike_price = 1

-- Display: Strike Price
memx_options_memoirdepth_sbe_v1_3_display.strike_price = function(value)
  return "Strike Price: "..value
end

-- Dissect: Strike Price
memx_options_memoirdepth_sbe_v1_3_dissect.strike_price = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.strike_price
  local range = buffer(offset, length)
  local value = range:int()
  local display = memx_options_memoirdepth_sbe_v1_3_display.strike_price(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.strike_price, range, value, display)

  return offset + length, value
end

-- Size: Strike Put Or Call
memx_options_memoirdepth_sbe_v1_3_size_of.strike_put_or_call = 1

-- Display: Strike Put Or Call
memx_options_memoirdepth_sbe_v1_3_display.strike_put_or_call = function(value)
  if value == 0 then
    return "Strike Put Or Call: Put (0)"
  end
  if value == 1 then
    return "Strike Put Or Call: Call (1)"
  end

  return "Strike Put Or Call: Unknown("..value..")"
end

-- Dissect: Strike Put Or Call
memx_options_memoirdepth_sbe_v1_3_dissect.strike_put_or_call = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.strike_put_or_call
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.strike_put_or_call(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.strike_put_or_call, range, value, display)

  return offset + length, value
end

-- Size: Maturity Date
memx_options_memoirdepth_sbe_v1_3_size_of.maturity_date = 8

-- Display: Maturity Date
memx_options_memoirdepth_sbe_v1_3_display.maturity_date = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Maturity Date: No Value"
  end

  return "Maturity Date: "..value
end

-- Dissect: Maturity Date
memx_options_memoirdepth_sbe_v1_3_dissect.maturity_date = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.maturity_date
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.maturity_date(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.maturity_date, range, value, display)

  return offset + length, value
end

-- Size: Osi Root
memx_options_memoirdepth_sbe_v1_3_size_of.osi_root = 6

-- Display: Osi Root
memx_options_memoirdepth_sbe_v1_3_display.osi_root = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Osi Root: No Value"
  end

  return "Osi Root: "..value
end

-- Dissect: Osi Root
memx_options_memoirdepth_sbe_v1_3_dissect.osi_root = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.osi_root
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.osi_root(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.osi_root, range, value, display)

  return offset + length, value
end

-- Size: Underlier
memx_options_memoirdepth_sbe_v1_3_size_of.underlier = 6

-- Display: Underlier
memx_options_memoirdepth_sbe_v1_3_display.underlier = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Underlier: No Value"
  end

  return "Underlier: "..value
end

-- Dissect: Underlier
memx_options_memoirdepth_sbe_v1_3_dissect.underlier = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.underlier
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.underlier(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.underlier, range, value, display)

  return offset + length, value
end

-- Size: Options Product Type
memx_options_memoirdepth_sbe_v1_3_size_of.options_product_type = 1

-- Display: Options Product Type
memx_options_memoirdepth_sbe_v1_3_display.options_product_type = function(value)
  if value == 0 then
    return "Options Product Type: Equity Underlying (0)"
  end
  if value == 1 then
    return "Options Product Type: Index Underlying (1)"
  end

  return "Options Product Type: Unknown("..value..")"
end

-- Dissect: Options Product Type
memx_options_memoirdepth_sbe_v1_3_dissect.options_product_type = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.options_product_type
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.options_product_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.options_product_type, range, value, display)

  return offset + length, value
end

-- Size: Symbol Instrument Directory Symbol
memx_options_memoirdepth_sbe_v1_3_size_of.symbol_instrument_directory_symbol = 8

-- Display: Symbol Instrument Directory Symbol
memx_options_memoirdepth_sbe_v1_3_display.symbol_instrument_directory_symbol = function(value)
  -- Check if field has value
  if value == nil or value == '' then
    return "Symbol Instrument Directory Symbol: No Value"
  end

  return "Symbol Instrument Directory Symbol: "..value
end

-- Dissect: Symbol Instrument Directory Symbol
memx_options_memoirdepth_sbe_v1_3_dissect.symbol_instrument_directory_symbol = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.symbol_instrument_directory_symbol
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

  local display = memx_options_memoirdepth_sbe_v1_3_display.symbol_instrument_directory_symbol(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.symbol_instrument_directory_symbol, range, value, display)

  return offset + length, value
end

-- Calculate size of: Instrument Directory Message
memx_options_memoirdepth_sbe_v1_3_size_of.instrument_directory_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.timestamp

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.symbol_instrument_directory_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.options_product_type

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.underlier

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.osi_root

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.maturity_date

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.strike_put_or_call

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.strike_price

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.closing_only

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.closing_time

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.is_test_symbol

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.padding_21

  return index
end

-- Display: Instrument Directory Message
memx_options_memoirdepth_sbe_v1_3_display.instrument_directory_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Instrument Directory Message
memx_options_memoirdepth_sbe_v1_3_dissect.instrument_directory_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 1 Byte Unsigned Fixed Width Integer
  index, timestamp = memx_options_memoirdepth_sbe_v1_3_dissect.timestamp(buffer, index, packet, parent)

  -- Symbol Instrument Directory Symbol: 8 Byte Ascii String
  index, symbol_instrument_directory_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.symbol_instrument_directory_symbol(buffer, index, packet, parent)

  -- Options Product Type: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, options_product_type = memx_options_memoirdepth_sbe_v1_3_dissect.options_product_type(buffer, index, packet, parent)

  -- Underlier: 6 Byte Ascii String
  index, underlier = memx_options_memoirdepth_sbe_v1_3_dissect.underlier(buffer, index, packet, parent)

  -- Osi Root: 6 Byte Ascii String
  index, osi_root = memx_options_memoirdepth_sbe_v1_3_dissect.osi_root(buffer, index, packet, parent)

  -- Maturity Date: 8 Byte Ascii String
  index, maturity_date = memx_options_memoirdepth_sbe_v1_3_dissect.maturity_date(buffer, index, packet, parent)

  -- Strike Put Or Call: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, strike_put_or_call = memx_options_memoirdepth_sbe_v1_3_dissect.strike_put_or_call(buffer, index, packet, parent)

  -- Strike Price: 1 Byte Signed Fixed Width Integer
  index, strike_price = memx_options_memoirdepth_sbe_v1_3_dissect.strike_price(buffer, index, packet, parent)

  -- Closing Only: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, closing_only = memx_options_memoirdepth_sbe_v1_3_dissect.closing_only(buffer, index, packet, parent)

  -- Closing Time: 1 Byte Unsigned Fixed Width Integer
  index, closing_time = memx_options_memoirdepth_sbe_v1_3_dissect.closing_time(buffer, index, packet, parent)

  -- Is Test Symbol: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, is_test_symbol = memx_options_memoirdepth_sbe_v1_3_dissect.is_test_symbol(buffer, index, packet, parent)

  -- Padding 21
  index, padding_21 = memx_options_memoirdepth_sbe_v1_3_dissect.padding_21(buffer, index, packet, parent)

  return index
end

-- Dissect: Instrument Directory Message
memx_options_memoirdepth_sbe_v1_3_dissect.instrument_directory_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.instrument_directory_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.instrument_directory_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.instrument_directory_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.instrument_directory_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.instrument_directory_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Payload
memx_options_memoirdepth_sbe_v1_3_size_of.payload = function(buffer, offset, template_id)
  -- Size of Instrument Directory Message
  if template_id == 1 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.instrument_directory_message(buffer, offset)
  end
  -- Size of Instrument Trading Status Message
  if template_id == 2 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.instrument_trading_status_message(buffer, offset)
  end
  -- Size of Trading Session Status Message
  if template_id == 3 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.trading_session_status_message(buffer, offset)
  end
  -- Size of Broken Trade Message
  if template_id == 5 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.broken_trade_message(buffer, offset)
  end
  -- Size of Corrected Trade Message
  if template_id == 6 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.corrected_trade_message(buffer, offset)
  end
  -- Size of Snapshot Complete Message
  if template_id == 7 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.snapshot_complete_message(buffer, offset)
  end
  -- Size of Order Added Short Message
  if template_id == 10 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.order_added_short_message(buffer, offset)
  end
  -- Size of Order Added Long Message
  if template_id == 11 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.order_added_long_message(buffer, offset)
  end
  -- Size of Order Added Extended Message
  if template_id == 12 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.order_added_extended_message(buffer, offset)
  end
  -- Size of Order Deleted Message
  if template_id == 13 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.order_deleted_message(buffer, offset)
  end
  -- Size of Order Reduced Message
  if template_id == 14 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.order_reduced_message(buffer, offset)
  end
  -- Size of Order Executed Message
  if template_id == 15 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.order_executed_message(buffer, offset)
  end
  -- Size of Clear Book Message
  if template_id == 18 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.clear_book_message(buffer, offset)
  end

  return 0
end

-- Display: Payload
memx_options_memoirdepth_sbe_v1_3_display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Payload
memx_options_memoirdepth_sbe_v1_3_dissect.payload_branches = function(buffer, offset, packet, parent, template_id)
  -- Dissect Instrument Directory Message
  if template_id == 1 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.instrument_directory_message(buffer, offset, packet, parent)
  end
  -- Dissect Instrument Trading Status Message
  if template_id == 2 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.instrument_trading_status_message(buffer, offset, packet, parent)
  end
  -- Dissect Trading Session Status Message
  if template_id == 3 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.trading_session_status_message(buffer, offset, packet, parent)
  end
  -- Dissect Broken Trade Message
  if template_id == 5 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.broken_trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Corrected Trade Message
  if template_id == 6 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.corrected_trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Snapshot Complete Message
  if template_id == 7 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.snapshot_complete_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Added Short Message
  if template_id == 10 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.order_added_short_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Added Long Message
  if template_id == 11 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.order_added_long_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Added Extended Message
  if template_id == 12 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.order_added_extended_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Deleted Message
  if template_id == 13 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.order_deleted_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Reduced Message
  if template_id == 14 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.order_reduced_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Executed Message
  if template_id == 15 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.order_executed_message(buffer, offset, packet, parent)
  end
  -- Dissect Clear Book Message
  if template_id == 18 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.clear_book_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
memx_options_memoirdepth_sbe_v1_3_dissect.payload = function(buffer, offset, packet, parent, template_id)
  if not show.payload then
    return memx_options_memoirdepth_sbe_v1_3_dissect.payload_branches(buffer, offset, packet, parent, template_id)
  end

  -- Calculate size and check that branch is not empty
  local size = memx_options_memoirdepth_sbe_v1_3_size_of.payload(buffer, offset, template_id)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = memx_options_memoirdepth_sbe_v1_3_display.payload(buffer, packet, parent)
  local element = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.payload, range, display)

  return memx_options_memoirdepth_sbe_v1_3_dissect.payload_branches(buffer, offset, packet, parent, template_id)
end

-- Size: Version
memx_options_memoirdepth_sbe_v1_3_size_of.version = 2

-- Display: Version
memx_options_memoirdepth_sbe_v1_3_display.version = function(value)
  return "Version: "..value
end

-- Dissect: Version
memx_options_memoirdepth_sbe_v1_3_dissect.version = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.version
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.version(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.version, range, value, display)

  return offset + length, value
end

-- Size: Schema Id
memx_options_memoirdepth_sbe_v1_3_size_of.schema_id = 1

-- Display: Schema Id
memx_options_memoirdepth_sbe_v1_3_display.schema_id = function(value)
  return "Schema Id: "..value
end

-- Dissect: Schema Id
memx_options_memoirdepth_sbe_v1_3_dissect.schema_id = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.schema_id
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.schema_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.schema_id, range, value, display)

  return offset + length, value
end

-- Size: Template Id
memx_options_memoirdepth_sbe_v1_3_size_of.template_id = 1

-- Display: Template Id
memx_options_memoirdepth_sbe_v1_3_display.template_id = function(value)
  if value == 1 then
    return "Template Id: Instrument Directory Message (1)"
  end
  if value == 2 then
    return "Template Id: Instrument Trading Status Message (2)"
  end
  if value == 3 then
    return "Template Id: Trading Session Status Message (3)"
  end
  if value == 5 then
    return "Template Id: Broken Trade Message (5)"
  end
  if value == 6 then
    return "Template Id: Corrected Trade Message (6)"
  end
  if value == 7 then
    return "Template Id: Snapshot Complete Message (7)"
  end
  if value == 10 then
    return "Template Id: Order Added Short Message (10)"
  end
  if value == 11 then
    return "Template Id: Order Added Long Message (11)"
  end
  if value == 12 then
    return "Template Id: Order Added Extended Message (12)"
  end
  if value == 13 then
    return "Template Id: Order Deleted Message (13)"
  end
  if value == 14 then
    return "Template Id: Order Reduced Message (14)"
  end
  if value == 15 then
    return "Template Id: Order Executed Message (15)"
  end
  if value == 18 then
    return "Template Id: Clear Book Message (18)"
  end

  return "Template Id: Unknown("..value..")"
end

-- Dissect: Template Id
memx_options_memoirdepth_sbe_v1_3_dissect.template_id = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.template_id
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.template_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.template_id, range, value, display)

  return offset + length, value
end

-- Size: Block Length
memx_options_memoirdepth_sbe_v1_3_size_of.block_length = 2

-- Display: Block Length
memx_options_memoirdepth_sbe_v1_3_display.block_length = function(value)
  return "Block Length: "..value
end

-- Dissect: Block Length
memx_options_memoirdepth_sbe_v1_3_dissect.block_length = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.block_length
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.block_length(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.block_length, range, value, display)

  return offset + length, value
end

-- Calculate size of: Sbe Header
memx_options_memoirdepth_sbe_v1_3_size_of.sbe_header = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.block_length

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.template_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.schema_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.version

  return index
end

-- Display: Sbe Header
memx_options_memoirdepth_sbe_v1_3_display.sbe_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Sbe Header
memx_options_memoirdepth_sbe_v1_3_dissect.sbe_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Block Length: 2 Byte Unsigned Fixed Width Integer
  index, block_length = memx_options_memoirdepth_sbe_v1_3_dissect.block_length(buffer, index, packet, parent)

  -- Template Id: 1 Byte Unsigned Fixed Width Integer Enum with 13 values
  index, template_id = memx_options_memoirdepth_sbe_v1_3_dissect.template_id(buffer, index, packet, parent)

  -- Schema Id: 1 Byte Unsigned Fixed Width Integer Static
  index, schema_id = memx_options_memoirdepth_sbe_v1_3_dissect.schema_id(buffer, index, packet, parent)

  -- Version: 2 Byte Unsigned Fixed Width Integer Static
  index, version = memx_options_memoirdepth_sbe_v1_3_dissect.version(buffer, index, packet, parent)

  return index
end

-- Dissect: Sbe Header
memx_options_memoirdepth_sbe_v1_3_dissect.sbe_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.sbe_header then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.sbe_header(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.sbe_header(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.sbe_header, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.sbe_header_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Sbe Message
memx_options_memoirdepth_sbe_v1_3_size_of.sbe_message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.sbe_header(buffer, offset + index)

  -- Calculate runtime size of Payload field
  local payload_offset = offset + index
  local payload_type = buffer(payload_offset - 4, 1):uint()
  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.payload(buffer, payload_offset, payload_type)

  return index
end

-- Display: Sbe Message
memx_options_memoirdepth_sbe_v1_3_display.sbe_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Sbe Message
memx_options_memoirdepth_sbe_v1_3_dissect.sbe_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sbe Header: Struct of 4 fields
  index, sbe_header = memx_options_memoirdepth_sbe_v1_3_dissect.sbe_header(buffer, index, packet, parent)

  -- Dependency element: Template Id
  local template_id = buffer(index - 4, 1):uint()

  -- Payload: Runtime Type with 13 branches
  index = memx_options_memoirdepth_sbe_v1_3_dissect.payload(buffer, index, packet, parent, template_id)

  return index
end

-- Dissect: Sbe Message
memx_options_memoirdepth_sbe_v1_3_dissect.sbe_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.sbe_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.sbe_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.sbe_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.sbe_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.sbe_message_fields(buffer, offset, packet, parent)
end

-- Size: Message Length
memx_options_memoirdepth_sbe_v1_3_size_of.message_length = 2

-- Display: Message Length
memx_options_memoirdepth_sbe_v1_3_display.message_length = function(value)
  return "Message Length: "..value
end

-- Dissect: Message Length
memx_options_memoirdepth_sbe_v1_3_dissect.message_length = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.message_length
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.message_length(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.message_length, range, value, display)

  return offset + length, value
end

-- Calculate size of: Message
memx_options_memoirdepth_sbe_v1_3_size_of.message = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.message_length

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.sbe_message(buffer, offset + index)

  return index
end

-- Display: Message
memx_options_memoirdepth_sbe_v1_3_display.message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message
memx_options_memoirdepth_sbe_v1_3_dissect.message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Length: 2 Byte Unsigned Fixed Width Integer
  index, message_length = memx_options_memoirdepth_sbe_v1_3_dissect.message_length(buffer, index, packet, parent)

  -- Sbe Message: Struct of 2 fields
  index, sbe_message = memx_options_memoirdepth_sbe_v1_3_dissect.sbe_message(buffer, index, packet, parent)

  return index
end

-- Dissect: Message
memx_options_memoirdepth_sbe_v1_3_dissect.message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.message_fields(buffer, offset, packet, parent)
end

-- Size: Message Count
memx_options_memoirdepth_sbe_v1_3_size_of.message_count = 2

-- Display: Message Count
memx_options_memoirdepth_sbe_v1_3_display.message_count = function(value)
  return "Message Count: "..value
end

-- Dissect: Message Count
memx_options_memoirdepth_sbe_v1_3_dissect.message_count = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.message_count
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.message_count(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.message_count, range, value, display)

  return offset + length, value
end

-- Size Of: Sequenced Message
memx_options_memoirdepth_sbe_v1_3_size_of.sequenced_message = function(buffer, offset)
  local index = 0

  return buffer:len() - (offset + index)
end

-- Display: Sequenced Message
memx_options_memoirdepth_sbe_v1_3_display.sequenced_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Sequenced Message
memx_options_memoirdepth_sbe_v1_3_dissect.sequenced_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Count: 2 Byte Unsigned Fixed Width Integer
  index, message_count = memx_options_memoirdepth_sbe_v1_3_dissect.message_count(buffer, index, packet, parent)

  -- Dependency for Message
  local end_of_payload = buffer:len()

  -- Message: Struct of 2 fields
  while index < end_of_payload do
    index = memx_options_memoirdepth_sbe_v1_3_dissect.message(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Sequenced Message
memx_options_memoirdepth_sbe_v1_3_dissect.sequenced_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.sequenced_message then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.sequenced_message(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.sequenced_message(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.sequenced_message, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.sequenced_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Sequenced Messages
memx_options_memoirdepth_sbe_v1_3_size_of.sequenced_messages = function(buffer, offset, message_type)
  -- Size of Sequenced Message
  if message_type == 2 then
    return memx_options_memoirdepth_sbe_v1_3_size_of.sequenced_message(buffer, offset)
  end

  return 0
end

-- Display: Sequenced Messages
memx_options_memoirdepth_sbe_v1_3_display.sequenced_messages = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Sequenced Messages
memx_options_memoirdepth_sbe_v1_3_dissect.sequenced_messages_branches = function(buffer, offset, packet, parent, message_type)
  -- Dissect Sequenced Message
  if message_type == 2 then
    return memx_options_memoirdepth_sbe_v1_3_dissect.sequenced_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Sequenced Messages
memx_options_memoirdepth_sbe_v1_3_dissect.sequenced_messages = function(buffer, offset, packet, parent, message_type)
  if not show.sequenced_messages then
    return memx_options_memoirdepth_sbe_v1_3_dissect.sequenced_messages_branches(buffer, offset, packet, parent, message_type)
  end

  -- Calculate size and check that branch is not empty
  local size = memx_options_memoirdepth_sbe_v1_3_size_of.sequenced_messages(buffer, offset, message_type)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = memx_options_memoirdepth_sbe_v1_3_display.sequenced_messages(buffer, packet, parent)
  local element = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.sequenced_messages, range, display)

  return memx_options_memoirdepth_sbe_v1_3_dissect.sequenced_messages_branches(buffer, offset, packet, parent, message_type)
end

-- Size: Sequence Number
memx_options_memoirdepth_sbe_v1_3_size_of.sequence_number = 8

-- Display: Sequence Number
memx_options_memoirdepth_sbe_v1_3_display.sequence_number = function(value)
  return "Sequence Number: "..value
end

-- Dissect: Sequence Number
memx_options_memoirdepth_sbe_v1_3_dissect.sequence_number = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.sequence_number
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memoirdepth_sbe_v1_3_display.sequence_number(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.sequence_number, range, value, display)

  return offset + length, value
end

-- Size: Session Id
memx_options_memoirdepth_sbe_v1_3_size_of.session_id = 8

-- Display: Session Id
memx_options_memoirdepth_sbe_v1_3_display.session_id = function(value)
  return "Session Id: "..value
end

-- Dissect: Session Id
memx_options_memoirdepth_sbe_v1_3_dissect.session_id = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.session_id
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = memx_options_memoirdepth_sbe_v1_3_display.session_id(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.session_id, range, value, display)

  return offset + length, value
end

-- Size: Header Length
memx_options_memoirdepth_sbe_v1_3_size_of.header_length = 1

-- Display: Header Length
memx_options_memoirdepth_sbe_v1_3_display.header_length = function(value)
  return "Header Length: "..value
end

-- Dissect: Header Length
memx_options_memoirdepth_sbe_v1_3_dissect.header_length = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.header_length
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.header_length(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.header_length, range, value, display)

  return offset + length, value
end

-- Size: Message Type
memx_options_memoirdepth_sbe_v1_3_size_of.message_type = 1

-- Display: Message Type
memx_options_memoirdepth_sbe_v1_3_display.message_type = function(value)
  if value == 0 then
    return "Message Type: Heartbeat Message (0)"
  end
  if value == 1 then
    return "Message Type: Session Shutdown Message (1)"
  end
  if value == 2 then
    return "Message Type: Sequenced Message (2)"
  end

  return "Message Type: Unknown("..value..")"
end

-- Dissect: Message Type
memx_options_memoirdepth_sbe_v1_3_dissect.message_type = function(buffer, offset, packet, parent)
  local length = memx_options_memoirdepth_sbe_v1_3_size_of.message_type
  local range = buffer(offset, length)
  local value = range:uint()
  local display = memx_options_memoirdepth_sbe_v1_3_display.message_type(value, buffer, offset, packet, parent)

  parent:add(memx_options_memoirdepth_sbe_v1_3.fields.message_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: Common Header
memx_options_memoirdepth_sbe_v1_3_size_of.common_header = function(buffer, offset)
  local index = 0

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.message_type

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.header_length

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.session_id

  index = index + memx_options_memoirdepth_sbe_v1_3_size_of.sequence_number

  return index
end

-- Display: Common Header
memx_options_memoirdepth_sbe_v1_3_display.common_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Common Header
memx_options_memoirdepth_sbe_v1_3_dissect.common_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Type: 1 Byte Unsigned Fixed Width Integer Enum with 3 values
  index, message_type = memx_options_memoirdepth_sbe_v1_3_dissect.message_type(buffer, index, packet, parent)

  -- Header Length: 1 Byte Unsigned Fixed Width Integer
  index, header_length = memx_options_memoirdepth_sbe_v1_3_dissect.header_length(buffer, index, packet, parent)

  -- Session Id: 8 Byte Unsigned Fixed Width Integer
  index, session_id = memx_options_memoirdepth_sbe_v1_3_dissect.session_id(buffer, index, packet, parent)

  -- Sequence Number: 8 Byte Unsigned Fixed Width Integer
  index, sequence_number = memx_options_memoirdepth_sbe_v1_3_dissect.sequence_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Common Header
memx_options_memoirdepth_sbe_v1_3_dissect.common_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.common_header then
    local length = memx_options_memoirdepth_sbe_v1_3_size_of.common_header(buffer, offset)
    local range = buffer(offset, length)
    local display = memx_options_memoirdepth_sbe_v1_3_display.common_header(buffer, packet, parent)
    parent = parent:add(memx_options_memoirdepth_sbe_v1_3.fields.common_header, range, display)
  end

  return memx_options_memoirdepth_sbe_v1_3_dissect.common_header_fields(buffer, offset, packet, parent)
end

-- Dissect Packet
memx_options_memoirdepth_sbe_v1_3_dissect.packet = function(buffer, packet, parent)
  local index = 0

  -- Common Header: Struct of 4 fields
  index, common_header = memx_options_memoirdepth_sbe_v1_3_dissect.common_header(buffer, index, packet, parent)

  -- Dependency element: Message Type
  local message_type = buffer(index - 18, 1):uint()

  -- Sequenced Messages: Runtime Type with 1 branches
  index = memx_options_memoirdepth_sbe_v1_3_dissect.sequenced_messages(buffer, index, packet, parent, message_type)

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function memx_options_memoirdepth_sbe_v1_3.init()
end

-- Dissector for Memx Options MemoirDepth Sbe 1.3
function memx_options_memoirdepth_sbe_v1_3.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = memx_options_memoirdepth_sbe_v1_3.name

  -- Dissect protocol
  local protocol = parent:add(memx_options_memoirdepth_sbe_v1_3, buffer(), memx_options_memoirdepth_sbe_v1_3.description, "("..buffer:len().." Bytes)")
  return memx_options_memoirdepth_sbe_v1_3_dissect.packet(buffer, packet, protocol)
end

-- Register With Udp Table
local udp_table = DissectorTable.get("udp.port")
udp_table:add(65333, memx_options_memoirdepth_sbe_v1_3)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.memx_options_memoirdepth_sbe_v1_3_packet_size = function(buffer)

  return true
end

-- Verify Schema Id Field
verify.schema_id = function(buffer)
  -- Attempt to read field
  local value = buffer(25, 1):uint()

  if value == 10 then
    return true
  end

  return false
end

-- Verify Version Field
verify.version = function(buffer)
  -- Attempt to read field
  local value = buffer(26, 2):uint()

  if value == 259 then
    return true
  end

  return false
end

-- Dissector Heuristic for Memx Options MemoirDepth Sbe 1.3
local function memx_options_memoirdepth_sbe_v1_3_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.memx_options_memoirdepth_sbe_v1_3_packet_size(buffer) then return false end

  -- Verify Schema Id
  if not verify.schema_id(buffer) then return false end

  -- Verify Version
  if not verify.version(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = memx_options_memoirdepth_sbe_v1_3
  memx_options_memoirdepth_sbe_v1_3.dissector(buffer, packet, parent)

  return true
end

-- Register Heuristic for Memx Options MemoirDepth Sbe 1.3
memx_options_memoirdepth_sbe_v1_3:register_heuristic("udp", memx_options_memoirdepth_sbe_v1_3_heuristic)

-----------------------------------------------------------------------
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- 
-- Protocol:
--   Organization: Members Exchange
--   Version: 1.3
--   Date: Thursday, June 29, 2023
--   Specification: MEMOIR Depth for US Options-v1_3.pdf
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
