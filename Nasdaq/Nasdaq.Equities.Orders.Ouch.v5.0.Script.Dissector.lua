-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Nasdaq Equities Orders Ouch 5.0 Protocol
local nasdaq_equities_orders_ouch_v5_0 = Proto("Nasdaq.Equities.Orders.Ouch.v5.0.Lua", "Nasdaq Equities Orders Ouch 5.0")

-- Component Tables
local show = {}
local format = {}
local nasdaq_equities_orders_ouch_v5_0_display = {}
local nasdaq_equities_orders_ouch_v5_0_dissect = {}
local nasdaq_equities_orders_ouch_v5_0_size_of = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Nasdaq Equities Orders Ouch 5.0 Fields
nasdaq_equities_orders_ouch_v5_0.fields.debug_packet = ProtoField.new("Debug Packet", "nasdaq.equities.orders.ouch.v5.0.debugpacket", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.login_accepted_packet = ProtoField.new("Login Accepted Packet", "nasdaq.equities.orders.ouch.v5.0.loginacceptedpacket", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.login_rejected_packet = ProtoField.new("Login Rejected Packet", "nasdaq.equities.orders.ouch.v5.0.loginrejectedpacket", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.login_request_packet = ProtoField.new("Login Request Packet", "nasdaq.equities.orders.ouch.v5.0.loginrequestpacket", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.packet = ProtoField.new("Packet", "nasdaq.equities.orders.ouch.v5.0.packet", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.packet_header = ProtoField.new("Packet Header", "nasdaq.equities.orders.ouch.v5.0.packetheader", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.packet_length = ProtoField.new("Packet Length", "nasdaq.equities.orders.ouch.v5.0.packetlength", ftypes.UINT16)
nasdaq_equities_orders_ouch_v5_0.fields.packet_type = ProtoField.new("Packet Type", "nasdaq.equities.orders.ouch.v5.0.packettype", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.password = ProtoField.new("Password", "nasdaq.equities.orders.ouch.v5.0.password", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.payload = ProtoField.new("Payload", "nasdaq.equities.orders.ouch.v5.0.payload", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.reject_reason_code = ProtoField.new("Reject Reason Code", "nasdaq.equities.orders.ouch.v5.0.rejectreasoncode", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.requested_sequence_number = ProtoField.new("Requested Sequence Number", "nasdaq.equities.orders.ouch.v5.0.requestedsequencenumber", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.requested_session = ProtoField.new("Requested Session", "nasdaq.equities.orders.ouch.v5.0.requestedsession", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.sequence_number = ProtoField.new("Sequence Number", "nasdaq.equities.orders.ouch.v5.0.sequencenumber", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.sequenced_data_packet = ProtoField.new("Sequenced Data Packet", "nasdaq.equities.orders.ouch.v5.0.sequenceddatapacket", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.sequenced_message_type = ProtoField.new("Sequenced Message Type", "nasdaq.equities.orders.ouch.v5.0.sequencedmessagetype", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.session = ProtoField.new("Session", "nasdaq.equities.orders.ouch.v5.0.session", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.soup_bin_tcp_packet = ProtoField.new("Soup Bin Tcp Packet", "nasdaq.equities.orders.ouch.v5.0.soupbintcppacket", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.text = ProtoField.new("Text", "nasdaq.equities.orders.ouch.v5.0.text", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.unsequenced_data_packet = ProtoField.new("Unsequenced Data Packet", "nasdaq.equities.orders.ouch.v5.0.unsequenceddatapacket", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.unsequenced_message_type = ProtoField.new("Unsequenced Message Type", "nasdaq.equities.orders.ouch.v5.0.unsequencedmessagetype", ftypes.STRING)
nasdaq_equities_orders_ouch_v5_0.fields.username = ProtoField.new("Username", "nasdaq.equities.orders.ouch.v5.0.username", ftypes.STRING)

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Nasdaq Equities Orders Ouch 5.0 Element Dissection Options
show.debug_packet = true
show.login_accepted_packet = true
show.login_rejected_packet = true
show.login_request_packet = true
show.packet = true
show.packet_header = true
show.sequenced_data_packet = true
show.soup_bin_tcp_packet = true
show.unsequenced_data_packet = true
show.payload = false

-- Register Nasdaq Equities Orders Ouch 5.0 Show Options
nasdaq_equities_orders_ouch_v5_0.prefs.show_debug_packet = Pref.bool("Show Debug Packet", show.debug_packet, "Parse and add Debug Packet to protocol tree")
nasdaq_equities_orders_ouch_v5_0.prefs.show_login_accepted_packet = Pref.bool("Show Login Accepted Packet", show.login_accepted_packet, "Parse and add Login Accepted Packet to protocol tree")
nasdaq_equities_orders_ouch_v5_0.prefs.show_login_rejected_packet = Pref.bool("Show Login Rejected Packet", show.login_rejected_packet, "Parse and add Login Rejected Packet to protocol tree")
nasdaq_equities_orders_ouch_v5_0.prefs.show_login_request_packet = Pref.bool("Show Login Request Packet", show.login_request_packet, "Parse and add Login Request Packet to protocol tree")
nasdaq_equities_orders_ouch_v5_0.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
nasdaq_equities_orders_ouch_v5_0.prefs.show_packet_header = Pref.bool("Show Packet Header", show.packet_header, "Parse and add Packet Header to protocol tree")
nasdaq_equities_orders_ouch_v5_0.prefs.show_sequenced_data_packet = Pref.bool("Show Sequenced Data Packet", show.sequenced_data_packet, "Parse and add Sequenced Data Packet to protocol tree")
nasdaq_equities_orders_ouch_v5_0.prefs.show_soup_bin_tcp_packet = Pref.bool("Show Soup Bin Tcp Packet", show.soup_bin_tcp_packet, "Parse and add Soup Bin Tcp Packet to protocol tree")
nasdaq_equities_orders_ouch_v5_0.prefs.show_unsequenced_data_packet = Pref.bool("Show Unsequenced Data Packet", show.unsequenced_data_packet, "Parse and add Unsequenced Data Packet to protocol tree")
nasdaq_equities_orders_ouch_v5_0.prefs.show_payload = Pref.bool("Show Payload", show.payload, "Parse and add Payload to protocol tree")

-- Handle changed preferences
function nasdaq_equities_orders_ouch_v5_0.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.debug_packet ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_debug_packet then
    show.debug_packet = nasdaq_equities_orders_ouch_v5_0.prefs.show_debug_packet
    changed = true
  end
  if show.login_accepted_packet ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_login_accepted_packet then
    show.login_accepted_packet = nasdaq_equities_orders_ouch_v5_0.prefs.show_login_accepted_packet
    changed = true
  end
  if show.login_rejected_packet ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_login_rejected_packet then
    show.login_rejected_packet = nasdaq_equities_orders_ouch_v5_0.prefs.show_login_rejected_packet
    changed = true
  end
  if show.login_request_packet ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_login_request_packet then
    show.login_request_packet = nasdaq_equities_orders_ouch_v5_0.prefs.show_login_request_packet
    changed = true
  end
  if show.packet ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_packet then
    show.packet = nasdaq_equities_orders_ouch_v5_0.prefs.show_packet
    changed = true
  end
  if show.packet_header ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_packet_header then
    show.packet_header = nasdaq_equities_orders_ouch_v5_0.prefs.show_packet_header
    changed = true
  end
  if show.sequenced_data_packet ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_sequenced_data_packet then
    show.sequenced_data_packet = nasdaq_equities_orders_ouch_v5_0.prefs.show_sequenced_data_packet
    changed = true
  end
  if show.soup_bin_tcp_packet ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_soup_bin_tcp_packet then
    show.soup_bin_tcp_packet = nasdaq_equities_orders_ouch_v5_0.prefs.show_soup_bin_tcp_packet
    changed = true
  end
  if show.unsequenced_data_packet ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_unsequenced_data_packet then
    show.unsequenced_data_packet = nasdaq_equities_orders_ouch_v5_0.prefs.show_unsequenced_data_packet
    changed = true
  end
  if show.payload ~= nasdaq_equities_orders_ouch_v5_0.prefs.show_payload then
    show.payload = nasdaq_equities_orders_ouch_v5_0.prefs.show_payload
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Nasdaq Equities Orders Ouch 5.0
-----------------------------------------------------------------------

-- Size: Unsequenced Message Type
nasdaq_equities_orders_ouch_v5_0_size_of.unsequenced_message_type = 1

-- Display: Unsequenced Message Type
nasdaq_equities_orders_ouch_v5_0_display.unsequenced_message_type = function(value)
  return "Unsequenced Message Type: "..value
end

-- Dissect: Unsequenced Message Type
nasdaq_equities_orders_ouch_v5_0_dissect.unsequenced_message_type = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.unsequenced_message_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.unsequenced_message_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.unsequenced_message_type, range, value, display)

  return offset + length, value
end

-- Display: Unsequenced Data Packet
nasdaq_equities_orders_ouch_v5_0_display.unsequenced_data_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Unsequenced Data Packet
nasdaq_equities_orders_ouch_v5_0_dissect.unsequenced_data_packet_fields = function(buffer, offset, packet, parent, size_of_unsequenced_data_packet)
  local index = offset

  -- Unsequenced Message Type: 1 Byte Ascii String
  index, unsequenced_message_type = nasdaq_equities_orders_ouch_v5_0_dissect.unsequenced_message_type(buffer, index, packet, parent)

  -- Dependency element: Packet Length
  local packet_length = buffer(offset - 3, 2):uint()

  -- Runtime Size Of: Unsequenced Message
  local size_of_unsequenced_message = packet_length - 2

  -- Unsequenced Message
  index = nasdaq_equities_orders_ouch_v5_0_dissect.unsequenced_message(buffer, index, packet, parent, size_of_unsequenced_message)

  return index
end

-- Dissect: Unsequenced Data Packet
nasdaq_equities_orders_ouch_v5_0_dissect.unsequenced_data_packet = function(buffer, offset, packet, parent)
  local index = offset

  -- Dependency element: Packet Length
  local packet_length = buffer(offset - 3, 2):uint()

  -- Parse runtime struct size
  local size_of_unsequenced_data_packet = packet_length - 1

  -- Optionally add struct element to protocol tree
  if show.unsequenced_data_packet then
    local range = buffer(offset, size_of_unsequenced_data_packet)
    local display = nasdaq_equities_orders_ouch_v5_0_display.unsequenced_data_packet(buffer, packet, parent)
    parent = parent:add(nasdaq_equities_orders_ouch_v5_0.fields.unsequenced_data_packet, range, display)
  end

  nasdaq_equities_orders_ouch_v5_0_dissect.unsequenced_data_packet_fields(buffer, offset, packet, parent, size_of_unsequenced_data_packet)

  return offset + size_of_unsequenced_data_packet
end

-- Size: Requested Sequence Number
nasdaq_equities_orders_ouch_v5_0_size_of.requested_sequence_number = 20

-- Display: Requested Sequence Number
nasdaq_equities_orders_ouch_v5_0_display.requested_sequence_number = function(value)
  return "Requested Sequence Number: "..value
end

-- Dissect: Requested Sequence Number
nasdaq_equities_orders_ouch_v5_0_dissect.requested_sequence_number = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.requested_sequence_number
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.requested_sequence_number(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.requested_sequence_number, range, value, display)

  return offset + length, value
end

-- Size: Requested Session
nasdaq_equities_orders_ouch_v5_0_size_of.requested_session = 10

-- Display: Requested Session
nasdaq_equities_orders_ouch_v5_0_display.requested_session = function(value)
  return "Requested Session: "..value
end

-- Dissect: Requested Session
nasdaq_equities_orders_ouch_v5_0_dissect.requested_session = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.requested_session
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.requested_session(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.requested_session, range, value, display)

  return offset + length, value
end

-- Size: Password
nasdaq_equities_orders_ouch_v5_0_size_of.password = 10

-- Display: Password
nasdaq_equities_orders_ouch_v5_0_display.password = function(value)
  return "Password: "..value
end

-- Dissect: Password
nasdaq_equities_orders_ouch_v5_0_dissect.password = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.password
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.password(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.password, range, value, display)

  return offset + length, value
end

-- Size: Username
nasdaq_equities_orders_ouch_v5_0_size_of.username = 6

-- Display: Username
nasdaq_equities_orders_ouch_v5_0_display.username = function(value)
  return "Username: "..value
end

-- Dissect: Username
nasdaq_equities_orders_ouch_v5_0_dissect.username = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.username
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.username(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.username, range, value, display)

  return offset + length, value
end

-- Calculate size of: Login Request Packet
nasdaq_equities_orders_ouch_v5_0_size_of.login_request_packet = function(buffer, offset)
  local index = 0

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.username

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.password

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.requested_session

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.requested_sequence_number

  return index
end

-- Display: Login Request Packet
nasdaq_equities_orders_ouch_v5_0_display.login_request_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Login Request Packet
nasdaq_equities_orders_ouch_v5_0_dissect.login_request_packet_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Username: 6 Byte Ascii String
  index, username = nasdaq_equities_orders_ouch_v5_0_dissect.username(buffer, index, packet, parent)

  -- Password: 10 Byte Ascii String
  index, password = nasdaq_equities_orders_ouch_v5_0_dissect.password(buffer, index, packet, parent)

  -- Requested Session: 10 Byte Ascii String
  index, requested_session = nasdaq_equities_orders_ouch_v5_0_dissect.requested_session(buffer, index, packet, parent)

  -- Requested Sequence Number: 20 Byte Ascii String
  index, requested_sequence_number = nasdaq_equities_orders_ouch_v5_0_dissect.requested_sequence_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Login Request Packet
nasdaq_equities_orders_ouch_v5_0_dissect.login_request_packet = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.login_request_packet then
    local length = nasdaq_equities_orders_ouch_v5_0_size_of.login_request_packet(buffer, offset)
    local range = buffer(offset, length)
    local display = nasdaq_equities_orders_ouch_v5_0_display.login_request_packet(buffer, packet, parent)
    parent = parent:add(nasdaq_equities_orders_ouch_v5_0.fields.login_request_packet, range, display)
  end

  return nasdaq_equities_orders_ouch_v5_0_dissect.login_request_packet_fields(buffer, offset, packet, parent)
end

-- Size: Sequenced Message Type
nasdaq_equities_orders_ouch_v5_0_size_of.sequenced_message_type = 1

-- Display: Sequenced Message Type
nasdaq_equities_orders_ouch_v5_0_display.sequenced_message_type = function(value)
  return "Sequenced Message Type: "..value
end

-- Dissect: Sequenced Message Type
nasdaq_equities_orders_ouch_v5_0_dissect.sequenced_message_type = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.sequenced_message_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.sequenced_message_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.sequenced_message_type, range, value, display)

  return offset + length, value
end

-- Display: Sequenced Data Packet
nasdaq_equities_orders_ouch_v5_0_display.sequenced_data_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Sequenced Data Packet
nasdaq_equities_orders_ouch_v5_0_dissect.sequenced_data_packet_fields = function(buffer, offset, packet, parent, size_of_sequenced_data_packet)
  local index = offset

  -- Sequenced Message Type: 1 Byte Ascii String
  index, sequenced_message_type = nasdaq_equities_orders_ouch_v5_0_dissect.sequenced_message_type(buffer, index, packet, parent)

  -- Dependency element: Packet Length
  local packet_length = buffer(offset - 3, 2):uint()

  -- Runtime Size Of: Sequenced Message
  local size_of_sequenced_message = packet_length - 2

  -- Sequenced Message
  index = nasdaq_equities_orders_ouch_v5_0_dissect.sequenced_message(buffer, index, packet, parent, size_of_sequenced_message)

  return index
end

-- Dissect: Sequenced Data Packet
nasdaq_equities_orders_ouch_v5_0_dissect.sequenced_data_packet = function(buffer, offset, packet, parent)
  local index = offset

  -- Dependency element: Packet Length
  local packet_length = buffer(offset - 3, 2):uint()

  -- Parse runtime struct size
  local size_of_sequenced_data_packet = packet_length - 1

  -- Optionally add struct element to protocol tree
  if show.sequenced_data_packet then
    local range = buffer(offset, size_of_sequenced_data_packet)
    local display = nasdaq_equities_orders_ouch_v5_0_display.sequenced_data_packet(buffer, packet, parent)
    parent = parent:add(nasdaq_equities_orders_ouch_v5_0.fields.sequenced_data_packet, range, display)
  end

  nasdaq_equities_orders_ouch_v5_0_dissect.sequenced_data_packet_fields(buffer, offset, packet, parent, size_of_sequenced_data_packet)

  return offset + size_of_sequenced_data_packet
end

-- Size: Reject Reason Code
nasdaq_equities_orders_ouch_v5_0_size_of.reject_reason_code = 1

-- Display: Reject Reason Code
nasdaq_equities_orders_ouch_v5_0_display.reject_reason_code = function(value)
  return "Reject Reason Code: "..value
end

-- Dissect: Reject Reason Code
nasdaq_equities_orders_ouch_v5_0_dissect.reject_reason_code = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.reject_reason_code
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.reject_reason_code(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.reject_reason_code, range, value, display)

  return offset + length, value
end

-- Calculate size of: Login Rejected Packet
nasdaq_equities_orders_ouch_v5_0_size_of.login_rejected_packet = function(buffer, offset)
  local index = 0

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.reject_reason_code

  return index
end

-- Display: Login Rejected Packet
nasdaq_equities_orders_ouch_v5_0_display.login_rejected_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Login Rejected Packet
nasdaq_equities_orders_ouch_v5_0_dissect.login_rejected_packet_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Reject Reason Code: 1 Byte Ascii String
  index, reject_reason_code = nasdaq_equities_orders_ouch_v5_0_dissect.reject_reason_code(buffer, index, packet, parent)

  return index
end

-- Dissect: Login Rejected Packet
nasdaq_equities_orders_ouch_v5_0_dissect.login_rejected_packet = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.login_rejected_packet then
    local length = nasdaq_equities_orders_ouch_v5_0_size_of.login_rejected_packet(buffer, offset)
    local range = buffer(offset, length)
    local display = nasdaq_equities_orders_ouch_v5_0_display.login_rejected_packet(buffer, packet, parent)
    parent = parent:add(nasdaq_equities_orders_ouch_v5_0.fields.login_rejected_packet, range, display)
  end

  return nasdaq_equities_orders_ouch_v5_0_dissect.login_rejected_packet_fields(buffer, offset, packet, parent)
end

-- Size: Sequence Number
nasdaq_equities_orders_ouch_v5_0_size_of.sequence_number = 20

-- Display: Sequence Number
nasdaq_equities_orders_ouch_v5_0_display.sequence_number = function(value)
  return "Sequence Number: "..value
end

-- Dissect: Sequence Number
nasdaq_equities_orders_ouch_v5_0_dissect.sequence_number = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.sequence_number
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.sequence_number(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.sequence_number, range, value, display)

  return offset + length, value
end

-- Size: Session
nasdaq_equities_orders_ouch_v5_0_size_of.session = 10

-- Display: Session
nasdaq_equities_orders_ouch_v5_0_display.session = function(value)
  return "Session: "..value
end

-- Dissect: Session
nasdaq_equities_orders_ouch_v5_0_dissect.session = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.session
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.session(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.session, range, value, display)

  return offset + length, value
end

-- Calculate size of: Login Accepted Packet
nasdaq_equities_orders_ouch_v5_0_size_of.login_accepted_packet = function(buffer, offset)
  local index = 0

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.session

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.sequence_number

  return index
end

-- Display: Login Accepted Packet
nasdaq_equities_orders_ouch_v5_0_display.login_accepted_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Login Accepted Packet
nasdaq_equities_orders_ouch_v5_0_dissect.login_accepted_packet_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session: 10 Byte Ascii String
  index, session = nasdaq_equities_orders_ouch_v5_0_dissect.session(buffer, index, packet, parent)

  -- Sequence Number: 20 Byte Ascii String
  index, sequence_number = nasdaq_equities_orders_ouch_v5_0_dissect.sequence_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Login Accepted Packet
nasdaq_equities_orders_ouch_v5_0_dissect.login_accepted_packet = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.login_accepted_packet then
    local length = nasdaq_equities_orders_ouch_v5_0_size_of.login_accepted_packet(buffer, offset)
    local range = buffer(offset, length)
    local display = nasdaq_equities_orders_ouch_v5_0_display.login_accepted_packet(buffer, packet, parent)
    parent = parent:add(nasdaq_equities_orders_ouch_v5_0.fields.login_accepted_packet, range, display)
  end

  return nasdaq_equities_orders_ouch_v5_0_dissect.login_accepted_packet_fields(buffer, offset, packet, parent)
end

-- Size: Text
nasdaq_equities_orders_ouch_v5_0_size_of.text = 1

-- Display: Text
nasdaq_equities_orders_ouch_v5_0_display.text = function(value)
  return "Text: "..value
end

-- Dissect: Text
nasdaq_equities_orders_ouch_v5_0_dissect.text = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.text
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.text(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.text, range, value, display)

  return offset + length, value
end

-- Calculate size of: Debug Packet
nasdaq_equities_orders_ouch_v5_0_size_of.debug_packet = function(buffer, offset)
  local index = 0

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.text

  return index
end

-- Display: Debug Packet
nasdaq_equities_orders_ouch_v5_0_display.debug_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Debug Packet
nasdaq_equities_orders_ouch_v5_0_dissect.debug_packet_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Text: 1 Byte Ascii String
  index, text = nasdaq_equities_orders_ouch_v5_0_dissect.text(buffer, index, packet, parent)

  return index
end

-- Dissect: Debug Packet
nasdaq_equities_orders_ouch_v5_0_dissect.debug_packet = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.debug_packet then
    local length = nasdaq_equities_orders_ouch_v5_0_size_of.debug_packet(buffer, offset)
    local range = buffer(offset, length)
    local display = nasdaq_equities_orders_ouch_v5_0_display.debug_packet(buffer, packet, parent)
    parent = parent:add(nasdaq_equities_orders_ouch_v5_0.fields.debug_packet, range, display)
  end

  return nasdaq_equities_orders_ouch_v5_0_dissect.debug_packet_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Payload
nasdaq_equities_orders_ouch_v5_0_size_of.payload = function(buffer, offset, packet_type)
  -- Size of Debug Packet
  if packet_type == "+" then
    return nasdaq_equities_orders_ouch_v5_0_size_of.debug_packet(buffer, offset)
  end
  -- Size of Login Accepted Packet
  if packet_type == "A" then
    return nasdaq_equities_orders_ouch_v5_0_size_of.login_accepted_packet(buffer, offset)
  end
  -- Size of Login Rejected Packet
  if packet_type == "J" then
    return nasdaq_equities_orders_ouch_v5_0_size_of.login_rejected_packet(buffer, offset)
  end
  -- Size of Sequenced Data Packet
  if packet_type == "S" then
    return nasdaq_equities_orders_ouch_v5_0_size_of.sequenced_data_packet(buffer, offset)
  end
  -- Size of Login Request Packet
  if packet_type == "L" then
    return nasdaq_equities_orders_ouch_v5_0_size_of.login_request_packet(buffer, offset)
  end
  -- Size of Unsequenced Data Packet
  if packet_type == "U" then
    return nasdaq_equities_orders_ouch_v5_0_size_of.unsequenced_data_packet(buffer, offset)
  end

  return 0
end

-- Display: Payload
nasdaq_equities_orders_ouch_v5_0_display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Payload
nasdaq_equities_orders_ouch_v5_0_dissect.payload_branches = function(buffer, offset, packet, parent, packet_type)
  -- Dissect Debug Packet
  if packet_type == "+" then
    return nasdaq_equities_orders_ouch_v5_0_dissect.debug_packet(buffer, offset, packet, parent)
  end
  -- Dissect Login Accepted Packet
  if packet_type == "A" then
    return nasdaq_equities_orders_ouch_v5_0_dissect.login_accepted_packet(buffer, offset, packet, parent)
  end
  -- Dissect Login Rejected Packet
  if packet_type == "J" then
    return nasdaq_equities_orders_ouch_v5_0_dissect.login_rejected_packet(buffer, offset, packet, parent)
  end
  -- Dissect Sequenced Data Packet
  if packet_type == "S" then
    return nasdaq_equities_orders_ouch_v5_0_dissect.sequenced_data_packet(buffer, offset, packet, parent)
  end
  -- Dissect Login Request Packet
  if packet_type == "L" then
    return nasdaq_equities_orders_ouch_v5_0_dissect.login_request_packet(buffer, offset, packet, parent)
  end
  -- Dissect Unsequenced Data Packet
  if packet_type == "U" then
    return nasdaq_equities_orders_ouch_v5_0_dissect.unsequenced_data_packet(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
nasdaq_equities_orders_ouch_v5_0_dissect.payload = function(buffer, offset, packet, parent, packet_type)
  if not show.payload then
    return nasdaq_equities_orders_ouch_v5_0_dissect.payload_branches(buffer, offset, packet, parent, packet_type)
  end

  -- Calculate size and check that branch is not empty
  local size = nasdaq_equities_orders_ouch_v5_0_size_of.payload(buffer, offset, packet_type)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = nasdaq_equities_orders_ouch_v5_0_display.payload(buffer, packet, parent)
  local element = parent:add(nasdaq_equities_orders_ouch_v5_0.fields.payload, range, display)

  return nasdaq_equities_orders_ouch_v5_0_dissect.payload_branches(buffer, offset, packet, parent, packet_type)
end

-- Size: Packet Type
nasdaq_equities_orders_ouch_v5_0_size_of.packet_type = 1

-- Display: Packet Type
nasdaq_equities_orders_ouch_v5_0_display.packet_type = function(value)
  if value == "+" then
    return "Packet Type: Debug Packet (+)"
  end
  if value == "A" then
    return "Packet Type: Login Accepted Packet (A)"
  end
  if value == "J" then
    return "Packet Type: Login Rejected Packet (J)"
  end
  if value == "S" then
    return "Packet Type: Sequenced Data Packet (S)"
  end
  if value == "H" then
    return "Packet Type: Server Heartbeat Packet (H)"
  end
  if value == "Z" then
    return "Packet Type: End Of Session Packet (Z)"
  end
  if value == "L" then
    return "Packet Type: Login Request Packet (L)"
  end
  if value == "U" then
    return "Packet Type: Unsequenced Data Packet (U)"
  end
  if value == "R" then
    return "Packet Type: Client Heartbeat Packet (R)"
  end
  if value == "O" then
    return "Packet Type: Logout Request Packet (O)"
  end

  return "Packet Type: Unknown("..value..")"
end

-- Dissect: Packet Type
nasdaq_equities_orders_ouch_v5_0_dissect.packet_type = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.packet_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = nasdaq_equities_orders_ouch_v5_0_display.packet_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.packet_type, range, value, display)

  return offset + length, value
end

-- Size: Packet Length
nasdaq_equities_orders_ouch_v5_0_size_of.packet_length = 2

-- Display: Packet Length
nasdaq_equities_orders_ouch_v5_0_display.packet_length = function(value)
  return "Packet Length: "..value
end

-- Dissect: Packet Length
nasdaq_equities_orders_ouch_v5_0_dissect.packet_length = function(buffer, offset, packet, parent)
  local length = nasdaq_equities_orders_ouch_v5_0_size_of.packet_length
  local range = buffer(offset, length)
  local value = range:uint()
  local display = nasdaq_equities_orders_ouch_v5_0_display.packet_length(value, buffer, offset, packet, parent)

  parent:add(nasdaq_equities_orders_ouch_v5_0.fields.packet_length, range, value, display)

  return offset + length, value
end

-- Calculate size of: Packet Header
nasdaq_equities_orders_ouch_v5_0_size_of.packet_header = function(buffer, offset)
  local index = 0

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.packet_length

  index = index + nasdaq_equities_orders_ouch_v5_0_size_of.packet_type

  return index
end

-- Display: Packet Header
nasdaq_equities_orders_ouch_v5_0_display.packet_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Packet Header
nasdaq_equities_orders_ouch_v5_0_dissect.packet_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Packet Length: 2 Byte Unsigned Fixed Width Integer
  index, packet_length = nasdaq_equities_orders_ouch_v5_0_dissect.packet_length(buffer, index, packet, parent)

  -- Packet Type: 1 Byte Ascii String Enum with 10 values
  index, packet_type = nasdaq_equities_orders_ouch_v5_0_dissect.packet_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Packet Header
nasdaq_equities_orders_ouch_v5_0_dissect.packet_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.packet_header then
    local length = nasdaq_equities_orders_ouch_v5_0_size_of.packet_header(buffer, offset)
    local range = buffer(offset, length)
    local display = nasdaq_equities_orders_ouch_v5_0_display.packet_header(buffer, packet, parent)
    parent = parent:add(nasdaq_equities_orders_ouch_v5_0.fields.packet_header, range, display)
  end

  return nasdaq_equities_orders_ouch_v5_0_dissect.packet_header_fields(buffer, offset, packet, parent)
end

-- Display: Soup Bin Tcp Packet
nasdaq_equities_orders_ouch_v5_0_display.soup_bin_tcp_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Soup Bin Tcp Packet
nasdaq_equities_orders_ouch_v5_0_dissect.soup_bin_tcp_packet_fields = function(buffer, offset, packet, parent, size_of_soup_bin_tcp_packet)
  local index = offset

  -- Packet Header: Struct of 2 fields
  index, packet_header = nasdaq_equities_orders_ouch_v5_0_dissect.packet_header(buffer, index, packet, parent)

  -- Dependency element: Packet Type
  local packet_type = buffer(index - 1, 1):string()

  -- Payload: Runtime Type with 6 branches
  index = nasdaq_equities_orders_ouch_v5_0_dissect.payload(buffer, index, packet, parent, packet_type)

  return index
end

-- Dissect: Soup Bin Tcp Packet
nasdaq_equities_orders_ouch_v5_0_dissect.soup_bin_tcp_packet = function(buffer, offset, packet, parent, size_of_soup_bin_tcp_packet)
  -- Optionally add struct element to protocol tree
  if show.soup_bin_tcp_packet then
    local range = buffer(offset, size_of_soup_bin_tcp_packet)
    local display = nasdaq_equities_orders_ouch_v5_0_display.soup_bin_tcp_packet(buffer, packet, parent)
    parent = parent:add(nasdaq_equities_orders_ouch_v5_0.fields.soup_bin_tcp_packet, range, display)
  end

  nasdaq_equities_orders_ouch_v5_0_dissect.soup_bin_tcp_packet_fields(buffer, offset, packet, parent, size_of_soup_bin_tcp_packet)

  return offset + size_of_soup_bin_tcp_packet
end

-- Remaining Bytes For: Soup Bin Tcp Packet
local soup_bin_tcp_packet_bytes_remaining = function(buffer, index, available)
  -- Calculate the number of bytes remaining
  local remaining = available - index

  -- Check if packet size can be read
  if remaining < nasdaq_equities_orders_ouch_v5_0_size_of.packet_header(buffer, index) then
    return -DESEGMENT_ONE_MORE_SEGMENT
  end

  -- Parse runtime size
  local current = buffer(index, 2):uint() + 2

  -- Check if enough bytes remain
  if remaining < current then
    return -(current - remaining)
  end

  return remaining, current
end

-- Dissect Packet
nasdaq_equities_orders_ouch_v5_0_dissect.packet = function(buffer, packet, parent)
  local index = 0

  -- Dependency for Soup Bin Tcp Packet
  local end_of_payload = buffer:len()

  -- Soup Bin Tcp Packet: Struct of 2 fields
  while index < end_of_payload do

    -- Are minimum number of bytes are available?
    local available, size_of_soup_bin_tcp_packet = soup_bin_tcp_packet_bytes_remaining(buffer, index, end_of_payload)

    if available > 0 then
      index = nasdaq_equities_orders_ouch_v5_0_dissect.soup_bin_tcp_packet(buffer, index, packet, parent, size_of_soup_bin_tcp_packet)
    else
      -- More bytes needed, so set packet information
      packet.desegment_offset = index
      packet.desegment_len = -(available)

      break
    end
  end

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function nasdaq_equities_orders_ouch_v5_0.init()
end

-- Dissector for Nasdaq Equities Orders Ouch 5.0
function nasdaq_equities_orders_ouch_v5_0.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = nasdaq_equities_orders_ouch_v5_0.name

  -- Dissect protocol
  local protocol = parent:add(nasdaq_equities_orders_ouch_v5_0, buffer(), nasdaq_equities_orders_ouch_v5_0.description, "("..buffer:len().." Bytes)")
  return nasdaq_equities_orders_ouch_v5_0_dissect.packet(buffer, packet, protocol)
end

-- Register With Tcp Table
local tcp_table = DissectorTable.get("tcp.port")
tcp_table:add(65333, nasdaq_equities_orders_ouch_v5_0)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.nasdaq_equities_orders_ouch_v5_0_packet_size = function(buffer)

  return true
end

-- Dissector Heuristic for Nasdaq Equities Orders Ouch 5.0
local function nasdaq_equities_orders_ouch_v5_0_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.nasdaq_equities_orders_ouch_v5_0_packet_size(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = nasdaq_equities_orders_ouch_v5_0
  nasdaq_equities_orders_ouch_v5_0.dissector(buffer, packet, parent)

  return true
end

-- Register Heuristic for Nasdaq Equities Orders Ouch 5.0
nasdaq_equities_orders_ouch_v5_0:register_heuristic("tcp", nasdaq_equities_orders_ouch_v5_0_heuristic)

-----------------------------------------------------------------------
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- 
-- Protocol:
--   Organization: National Association of Securities Dealers Automated Quotations
--   Version: 5.0
--   Date: Thursday, July 1, 2021
--   Specification: OUCH5.0.pdf
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
