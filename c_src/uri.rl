# Generated by abnfc at Fri Jan 12 11:10:43 2018
# Output file: uri.rl
# Sources:
# 	core
# 	uri.abnf
%%{
	# write your name
	machine uri;

	# generated rules, define required actions
	ALPHA = 0x41..0x5a | 0x61..0x7a;
	BIT = "0" | "1";
	CHAR = 0x01..0x7f;
	CR = "\r";
	LF = "\n";
	CRLF = CR LF;
	CTL = 0x00..0x1f | 0x7f;
	DIGIT = 0x30..0x39;
	DQUOTE = "\"";
	HEXDIG = DIGIT | "A"i | "B"i | "C"i | "D"i | "E"i | "F"i;
	HTAB = "\t";
	SP = " ";
	WSP = SP | HTAB;
	LWSP = ( WSP | ( CRLF WSP ) )*;
	OCTET = 0x00..0xff;
	VCHAR = 0x21..0x7e;
	unreserved = ALPHA | DIGIT | "-" | "." | "_" | "~";
	pct_encoded = "%" HEXDIG HEXDIG;
	nodeallow = "!" | "$" | "(" | ")" | "*" | "+" | "," | ";" | "=";
	nodeid = ( unreserved | pct_encoded | nodeallow )*;
	h16 = HEXDIG{1,4};
	dec_octet = DIGIT | ( 0x31..0x39 DIGIT ) | ( "1" DIGIT{2} ) | ( "2" 0x30..0x34 DIGIT ) | ( "25" 0x30..0x35 );
	IPv4address = dec_octet "." dec_octet "." dec_octet "." dec_octet;
	ls32 = ( h16 ":" h16 ) | IPv4address;
	IPv6address = ( ( h16 ":" ){6} ls32 ) | ( "::" ( h16 ":" ){5} ls32 ) | ( h16? "::" ( h16 ":" ){4} ls32 ) | ( ( ( h16 ":" )? h16 )? "::" ( h16 ":" ){3} ls32 ) | ( ( ( h16 ":" ){,2} h16 )? "::" ( h16 ":" ){2} ls32 ) | ( ( ( h16 ":" ){,3} h16 )? "::" h16 ":" ls32 ) | ( ( ( h16 ":" ){,4} h16 )? "::" ls32 ) | ( ( ( h16 ":" ){,5} h16 )? "::" h16 ) | ( ( ( h16 ":" ){,6} h16 )? "::" );
	sub_delims = "!" | "$" | "&" | "'" | "(" | ")" | "*" | "+" | "," | ";" | "=";
	IPvFuture = "v"i HEXDIG+ "." ( unreserved | sub_delims | ":" )+;
	IP_literal = "[" ( IPv6address | IPvFuture ) "]";
	reg_name = ( unreserved | pct_encoded | sub_delims )+;
	host = IP_literal | IPv4address | reg_name;
	authxmpp = nodeid "@" host;
	resallow = "!" | "$" | "&" | "'" | "(" | ")" | "*" | "+" | "," | ":" | ";" | "=";
	resid = ( unreserved | pct_encoded | resallow )*;
	pathxmpp = ( nodeid "@" )? host ( "/" resid )?;
	authpath = "//" authxmpp ( "/" pathxmpp )?;
	hierxmpp = authpath | pathxmpp;
	querytype = ( unreserved | pct_encoded )*;
	key = ( unreserved | pct_encoded )*;
	value = ( unreserved | pct_encoded )*;
	pair = ";" key "=" value;
	querycomp = querytype pair*?;
	pchar = unreserved | pct_encoded | sub_delims | ":" | "@";
	fragment = ( pchar | "/" | "?" )*;
	xmppuri = "xmpp"i ":" hierxmpp ( "?" querycomp )? ( "#" fragment )?;
	query = ( pchar | "/" | "?" )*;
}%%
