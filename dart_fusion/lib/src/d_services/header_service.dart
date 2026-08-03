part of '../../dart_fusion.dart';

/// Abstract class representing headers used in CORS policies.
abstract class Header extends DModel {
  /// Default constructor for headers.
  const Header();

  @override
  DModel copyWith({DModel? model}) {
    return model ?? this;
  }

  @override
  String toString() {
    final type = toJSON.of<String>('model_type');
    return type.split(RegExp('(?=[A-Z])')).join('-');
  }

  factory Header.fromJSON(JSON value) {
    switch (value.of<String>('model_type').replaceAll('-', '').toLowerCase()) {
      case 'accept':
        return const Accept();
      case 'acceptlanguage':
        return const AcceptLanguage();
      case 'contentlanguage':
        return const ContentLanguage();
      case 'contenttype':
        return const ContentType();
      case 'authorization':
        return const Authorization();
      case 'origin':
        return const Origin();
      case 'xrequestedwith':
        return const XRequestedWith();
      case 'accesscontrolrequestmethod':
        return const AccessControlRequestMethod();
      case 'accesscontrolrequestheaders':
        return const AccessControlRequestHeaders();
      case 'acceptcharset':
        return const AcceptCharset();
      case 'acceptencoding':
        return const AcceptEncoding();
      case 'acceptranges':
        return const AcceptRanges();
      case 'accesscontrolallowcredentials':
        return const AccessControlAllowCredentials();
      case 'accesscontrolallowheaders':
        return const AccessControlAllowHeaders();
      case 'accesscontrolallowmethods':
        return const AccessControlAllowMethods();
      case 'accesscontrolexposeheaders':
        return const AccessControlExposeHeaders();
      case 'accesscontrolmaxage':
        return const AccessControlMaxAge();
      case 'age':
        return const Age();
      case 'allow':
        return const Allow();
      case 'contentdisposition':
        return const ContentDisposition();
      case 'contentencoding':
        return const ContentEncoding();
      case 'contentlocation':
        return const ContentLocation();
      case 'contentrange':
        return const ContentRange();
      case 'contentsecuritypolicy':
        return const ContentSecurityPolicy();
      case 'contentsecuritypolicyreportonly':
        return const ContentSecurityPolicyReportOnly();
      case 'date':
        return const Date();
      case 'etag':
        return const ETag();
      case 'expires':
        return const Expires();
      case 'lastmodified':
        return const LastModified();
      case 'tk':
        return const Tk();
      case 'trailer':
        return const Trailer();
      case 'transferencoding':
        return const TransferEncoding();
      case 'vary':
        return const Vary();
      case 'via':
        return const Via();
      case 'warning':
        return const Warning();
      case 'wwwauthenticate':
        return const WWWAuthenticate();
      case 'xframeoptions':
        return const XFrameOptions();
      case 'xpoweredby':
        return const XPoweredBy();
      case 'xuacompatible':
        return const XUACompatible();
      case 'xcontenttypeoptions':
        return const XContentTypeOptions();
      case 'xdnsprefetchcontrol':
        return const XDNSPrefetchControl();
      case 'xdownloadoptions':
        return const XDownloadOptions();
      case 'xpermittedcrossdomainpolicies':
        return const XPermittedCrossDomainPolicies();
      case 'xredirectby':
        return const XRedirectBy();
      case 'xrobotstag':
        return const XRobotsTag();
      case 'xxssprotection':
        return const XXSSProtection();
      case 'refresh':
        return const Refresh();
      case 'reportto':
        return const ReportTo();
      case 'secfetchsite':
        return const SecFetchSite();
      case 'secfetchmode':
        return const SecFetchMode();
      case 'secfetchdest':
        return const SecFetchDest();
      case 'secfetchuser':
        return const SecFetchUser();
      case 'secfetchcredentials':
        return const SecFetchCredentials();
      case 'secfetchcache':
        return const SecFetchCache();
      case 'secfetchpriority':
        return const SecFetchPriority();
      case 'secfetchframe':
        return const SecFetchFrame();
      case 'secfetchversion':
        return const SecFetchVersion();
      case 'secwebsocketkey':
        return const SecWebSocketKey();
      case 'secwebsocketextensions':
        return const SecWebSocketExtensions();
      case 'secwebsocketaccept':
        return const SecWebSocketAccept();
      case 'secwebsocketprotocol':
        return const SecWebSocketProtocol();
      case 'secwebsocketversion':
        return const SecWebSocketVersion();
      case 'secwebsocketversionkey':
        return const SecWebSocketVersionKey();
      case 'secwebsocketversionorigin':
        return const SecWebSocketVersionOrigin();
      case 'secwebsocketversionlocation':
        return const SecWebSocketVersionLocation();
      case 'secwebsocketversionid':
        return const SecWebSocketVersionId();
      case 'secwebsocketversionparentid':
        return const SecWebSocketVersionParentId();
      case 'secwebsocketversionnonce':
        return const SecWebSocketVersionNonce();
      case 'xcustomheader':
        return const XCustomHeader();
      case 'xwebkitcsp':
        return const XWebKitCSP();
      case 'xpermittedcrossdomainpolicy':
        return const XPermittedCrossDomainPolicy();
      case 'xsourcemap':
        return const XSourceMap();
      case 'xforwardedproto':
        return const XForwardedProto();
      case 'xforwardedfor':
        return const XForwardedFor();
      case 'xforwardedhost':
        return const XForwardedHost();
      case 'xforwardedserver':
        return const XForwardedServer();
      case 'xrealip':
        return const XRealIP();
      case 'xframeoptionstype':
        return const XFrameOptionsType();
      case 'xframeoptionsallowfrom':
        return const XFrameOptionsAllowFrom();
      case 'xframeoptionsdeny':
        return const XFrameOptionsDeny();
      case 'xcontentduration':
        return const XContentDuration();
      case 'xcontentsecuritypolicy':
        return const XContentSecurityPolicy();
      case 'xcontentsecuritypolicyreportonly':
        return const XContentSecurityPolicyReportOnly();
      case 'xcorrelationid':
        return const XCorrelationID();
      case 'xdeviceuseragent':
        return const XDeviceUserAgent();
      case 'xforwardedscheme':
        return const XForwardedScheme();
      case 'xforwardedssl':
        return const XForwardedSSL();
      case 'xforwardedsslclientcert':
        return const XForwardedSslClientCert();
      case 'xforwardedsslclientcertinfo':
        return const XForwardedSslClientCertInfo();
      case 'xhttpmethod':
        return const XHTTPMethod();
      case 'xrequestid':
        return const XRequestID();
      case 'xresponsetime':
        return const XResponseTime();
      case 'xuidh':
        return const XUIDH();
      case 'xwapprofile':
        return const XWapProfile();
      case 'xwebkitcspreportonly':
        return const XWebKitCSPReportOnly();
      case 'xxsrftoken':
        return const XXSRFToken();
      case 'xzonedebug':
        return const XZoneDebug();
      default:
        return const ContentType();
    }
  }

  /// Represents the 'Accept' header.
  static const Accept accept = Accept();

  /// Represents the 'Accept-Language' header.
  static const AcceptLanguage acceptLanguage = AcceptLanguage();

  /// Represents the 'Content-Language' header.
  static const ContentLanguage contentLanguage = ContentLanguage();

  /// Represents the 'Content-Type' header.
  static const ContentType contentType = ContentType();

  /// Represents the 'Authorization' header.
  static const Authorization authorization = Authorization();

  /// Represents the 'Origin' header.
  static const Origin origin = Origin();

  /// Represents the 'X-Requested-With' header.
  static const XRequestedWith xRequestedWith = XRequestedWith();

  /// Represents the 'Access-Control-Request-Method' header.
  static const AccessControlRequestMethod accessControlRequestMethod =
      AccessControlRequestMethod();

  /// Represents the 'Access-Control-Request-Headers' header.
  static const AccessControlRequestHeaders accessControlRequestHeaders =
      AccessControlRequestHeaders();

  /// Represents the 'Accept-Charset' header.
  static const AcceptCharset acceptCharset = AcceptCharset();

  /// Represents the 'Accept-Encoding' header.
  static const AcceptEncoding acceptEncoding = AcceptEncoding();

  /// Represents the 'Accept-Ranges' header.
  static const AcceptRanges acceptRanges = AcceptRanges();

  /// Represents the 'Access-Control-Allow-Credentials' header.
  static const AccessControlAllowCredentials accessControlAllowCredentials =
      AccessControlAllowCredentials();

  /// Represents the 'Access-Control-Allow-Headers' header.
  static const AccessControlAllowHeaders accessControlAllowHeaders =
      AccessControlAllowHeaders();

  /// Represents the 'Access-Control-Allow-Methods' header.
  static const AccessControlAllowMethods accessControlAllowMethods =
      AccessControlAllowMethods();

  /// Represents the 'Access-Control-Expose-Headers' header.
  static const AccessControlExposeHeaders accessControlExposeHeaders =
      AccessControlExposeHeaders();

  /// Represents the 'Access-Control-Max-Age' header.
  static const AccessControlMaxAge accessControlMaxAge = AccessControlMaxAge();

  /// Represents the 'Age' header.
  static const Age age = Age();

  /// Represents the 'Allow' header.
  static const Allow allow = Allow();

  /// Represents the 'Content-Disposition' header.
  static const ContentDisposition contentDisposition = ContentDisposition();

  /// Represents the 'Content-Encoding' header.
  static const ContentEncoding contentEncoding = ContentEncoding();

  /// Represents the 'Content-Location' header.
  static const ContentLocation contentLocation = ContentLocation();

  /// Represents the 'Content-Range' header.
  static const ContentRange contentRange = ContentRange();

  /// Represents the 'Content-Security-Policy' header.
  static const ContentSecurityPolicy contentSecurityPolicy =
      ContentSecurityPolicy();

  /// Represents the 'Content-Security-Policy-Report-Only' header.
  static const ContentSecurityPolicyReportOnly contentSecurityPolicyReportOnly =
      ContentSecurityPolicyReportOnly();

  /// Represents the 'Date' header.
  static const Date date = Date();

  /// Represents the 'ETag' header.
  static const ETag eTag = ETag();

  /// Represents the 'Expires' header.
  static const Expires expires = Expires();

  /// Represents the 'Last-Modified' header.
  static const LastModified lastModified = LastModified();

  /// Represents the 'Tk' header.
  static const Tk tk = Tk();

  /// Represents the 'Trailer' header.
  static const Trailer trailer = Trailer();

  /// Represents the 'Transfer-Encoding' header.
  static const TransferEncoding transferEncoding = TransferEncoding();

  /// Represents the 'Vary' header.
  static const Vary vary = Vary();

  /// Represents the 'Via' header.
  static const Via via = Via();

  /// Represents the 'Warning' header.
  static const Warning warning = Warning();

  /// Represents the 'WWW-Authenticate' header.
  static const WWWAuthenticate wwwAuthenticate = WWWAuthenticate();

  /// Represents the 'X-Frame-Options' header.
  static const XFrameOptions xFrameOptions = XFrameOptions();

  /// Represents the 'X-Powered-By' header.
  static const XPoweredBy xPoweredBy = XPoweredBy();

  /// Represents the 'X-UA-Compatible' header.
  static const XUACompatible xUACompatible = XUACompatible();

  /// Represents the 'X-Content-Type-Options' header.
  static const XContentTypeOptions xContentTypeOptions = XContentTypeOptions();

  /// Represents the 'X-DNS-Prefetch-Control' header.
  static const XDNSPrefetchControl xDNSPrefetchControl = XDNSPrefetchControl();

  /// Represents the 'X-Download-Options' header.
  static const XDownloadOptions xDownloadOptions = XDownloadOptions();

  /// Represents the 'X-Permitted-Cross-Domain-Policies' header.
  static const XPermittedCrossDomainPolicies xPermittedCrossDomainPolicies =
      XPermittedCrossDomainPolicies();

  /// Represents the 'X-Redirect-By' header.
  static const XRedirectBy xRedirectBy = XRedirectBy();

  /// Represents the 'X-Robots-Tag' header.
  static const XRobotsTag xRobotsTag = XRobotsTag();

  /// Represents the 'X-XSS-Protection' header.
  static const XXSSProtection xXSSProtection = XXSSProtection();

  /// Represents the 'Refresh' header.
  static const Refresh refresh = Refresh();

  /// Represents the 'Report-To' header.
  static const ReportTo reportTo = ReportTo();

  /// Represents the 'Sec-Fetch-Site' header.
  static const SecFetchSite secFetchSite = SecFetchSite();

  /// Represents the 'Sec-Fetch-Mode' header.
  static const SecFetchMode secFetchMode = SecFetchMode();

  /// Represents the 'Sec-Fetch-Dest' header.
  static const SecFetchDest secFetchDest = SecFetchDest();

  /// Represents the 'Sec-Fetch-User' header.
  static const SecFetchUser secFetchUser = SecFetchUser();

  /// Represents the 'Sec-Fetch-Credentials' header.
  static const SecFetchCredentials secFetchCredentials = SecFetchCredentials();

  /// Represents the 'Sec-Fetch-Cache' header.
  static const SecFetchCache secFetchCache = SecFetchCache();

  /// Represents the 'Sec-Fetch-Priority' header.
  static const SecFetchPriority secFetchPriority = SecFetchPriority();

  /// Represents the 'Sec-Fetch-Frame' header.
  static const SecFetchFrame secFetchFrame = SecFetchFrame();

  /// Represents the 'Sec-Fetch-Version' header.
  static const SecFetchVersion secFetchVersion = SecFetchVersion();

  /// Represents the 'Sec-WebSocket-Key' header.
  static const SecWebSocketKey secWebSocketKey = SecWebSocketKey();

  /// Represents the 'Sec-WebSocket-Extensions' header.
  static const SecWebSocketExtensions secWebSocketExtensions =
      SecWebSocketExtensions();

  /// Represents the 'Sec-WebSocket-Accept' header.
  static const SecWebSocketAccept secWebSocketAccept = SecWebSocketAccept();

  /// Represents the 'Sec-WebSocket-Protocol' header.
  static const SecWebSocketProtocol secWebSocketProtocol =
      SecWebSocketProtocol();

  /// Represents the 'Sec-WebSocket-Version' header.
  static const SecWebSocketVersion secWebSocketVersion = SecWebSocketVersion();

  /// Represents the 'Sec-WebSocket-Version-Key' header.
  static const SecWebSocketVersionKey secWebSocketVersionKey =
      SecWebSocketVersionKey();

  /// Represents the 'Sec-WebSocket-Version-Origin' header.
  static const SecWebSocketVersionOrigin secWebSocketVersionOrigin =
      SecWebSocketVersionOrigin();

  /// Represents the 'Sec-WebSocket-Version-Location' header.
  static const SecWebSocketVersionLocation secWebSocketVersionLocation =
      SecWebSocketVersionLocation();

  /// Represents the 'Sec-WebSocket-Version-Id' header.
  static const SecWebSocketVersionId secWebSocketVersionId =
      SecWebSocketVersionId();

  /// Represents the 'Sec-WebSocket-Version-Parent-Id' header.
  static const SecWebSocketVersionParentId secWebSocketVersionParentId =
      SecWebSocketVersionParentId();

  /// Represents the 'Sec-WebSocket-Version-Nonce' header.
  static const SecWebSocketVersionNonce secWebSocketVersionNonce =
      SecWebSocketVersionNonce();

  /// Represents the 'X-Custom-Header' header.
  static const XCustomHeader xCustomHeader = XCustomHeader();

  /// Represents the 'X-WebKit-CSP' header.
  static const XWebKitCSP xWebKitCSP = XWebKitCSP();

  /// Represents the 'X-Permitted-Cross-Domain-Policy' header.
  static const XPermittedCrossDomainPolicy xPermittedCrossDomainPolicy =
      XPermittedCrossDomainPolicy();

  /// Represents the 'X-Source-Map' header.
  static const XSourceMap xSourceMap = XSourceMap();

  /// Represents the 'X-Forwarded-Proto' header.
  static const XForwardedProto xForwardedProto = XForwardedProto();

  /// Represents the 'X-Forwarded-For' header.
  static const XForwardedFor xForwardedFor = XForwardedFor();

  /// Represents the 'X-Forwarded-Host' header.
  static const XForwardedHost xForwardedHost = XForwardedHost();

  /// Represents the 'X-Forwarded-Server' header.
  static const XForwardedServer xForwardedServer = XForwardedServer();

  /// Represents the 'X-Real-IP' header.
  static const XRealIP xRealIP = XRealIP();

  /// Represents the 'X-Frame-Options-Type' header.
  static const XFrameOptionsType xFrameOptionsType = XFrameOptionsType();

  /// Represents the 'X-Frame-Options-Allow-From' header.
  static const XFrameOptionsAllowFrom xFrameOptionsAllowFrom =
      XFrameOptionsAllowFrom();

  /// Represents the 'X-Frame-Options-Deny' header.
  static const XFrameOptionsDeny xFrameOptionsDeny = XFrameOptionsDeny();

  /// Represents the 'X-Content-Duration' header.
  static const XContentDuration xContentDuration = XContentDuration();

  /// Represents the 'X-Content-Security-Policy' header.
  static const XContentSecurityPolicy xContentSecurityPolicy =
      XContentSecurityPolicy();

  /// Represents the 'X-Content-Security-Policy-Report-Only' header.
  static const XContentSecurityPolicyReportOnly
      xContentSecurityPolicyReportOnly = XContentSecurityPolicyReportOnly();

  /// Represents the 'X-Correlation-ID' header.
  static const XCorrelationID xCorrelationID = XCorrelationID();

  /// Represents the 'X-Device-User-Agent' header.
  static const XDeviceUserAgent xDeviceUserAgent = XDeviceUserAgent();

  /// Represents the 'X-Forwarded-Scheme' header.
  static const XForwardedScheme xForwardedScheme = XForwardedScheme();

  /// Represents the 'X-Forwarded-SSL' header.
  static const XForwardedSSL xForwardedSSL = XForwardedSSL();

  /// Represents the 'X-Forwarded-SSL-Client-Cert' header.
  static const XForwardedSslClientCert xForwardedSslClientCert =
      XForwardedSslClientCert();

  /// Represents the 'X-Forwarded-SSL-Client-Cert-Info' header.
  static const XForwardedSslClientCertInfo xForwardedSslClientCertInfo =
      XForwardedSslClientCertInfo();

  /// Represents the 'X-HTTP-Method' header.
  static const XHTTPMethod xHTTPMethod = XHTTPMethod();

  /// Represents the 'X-Request-ID' header.
  static const XRequestID xRequestID = XRequestID();

  /// Represents the 'X-Response-Time' header.
  static const XResponseTime xResponseTime = XResponseTime();

  /// Represents the 'X-UIDH' header.
  static const XUIDH xUIDH = XUIDH();

  /// Represents the 'X-Wap-Profile' header.
  static const XWapProfile xWapProfile = XWapProfile();

  /// Represents the 'X-WebKit-CSP-Report-Only' header.
  static const XWebKitCSPReportOnly xWebKitCSPReportOnly =
      XWebKitCSPReportOnly();

  /// Represents the 'X-XSRF-Token' header.
  static const XXSRFToken xXSRFToken = XXSRFToken();

  /// Represents the 'X-Zone-Debug' header.
  static const XZoneDebug xZoneDebug = XZoneDebug();
}

/// Represents the 'Accept' header.
///
/// The `Accept` header specifies the content types that the client can
/// understand. It indicates the MIME types that are acceptable in the
/// response from the server.
class Accept extends Header {
  /// Default constructor of [Accept] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Accept();
}

/// Represents the 'Accept-Language' header.
///
/// The `Accept-Language` header specifies the preferred languages for the
/// response. It defines the language(s) the client is able to understand.
class AcceptLanguage extends Header {
  /// Default constructor of [AcceptLanguage] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AcceptLanguage();
}

/// Represents the 'Content-Language' header.
///
/// The `Content-Language` header describes the natural language(s) of the
/// intended audience for the response content.
class ContentLanguage extends Header {
  /// Default constructor of [ContentLanguage] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ContentLanguage();
}

/// Represents the 'Content-Type' header.
///
/// This header specifies the media type of the resource being sent or requested.
/// It communicates the type of data being sent, such as JSON, HTML, or others.
class ContentType extends Header {
  /// Default constructor of [ContentType] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ContentType();
}

/// Represents the 'Authorization' header.
///
/// This header provides authentication information for the request, typically
/// containing credentials, tokens, or other authorization data.
class Authorization extends Header {
  /// Default constructor of [Authorization] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Authorization();
}

/// Represents the 'Origin' header.
///
/// The `Origin` header indicates the origin of the request, specifying the
/// domain from which the request is issued.
class Origin extends Header {
  /// Default constructor of [Origin] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Origin();
}

/// Represents the 'X-Requested-With' header.
///
/// Commonly used with AJAX requests, this header provides information about
/// the requesting client, such as indicating whether the request is
/// XMLHttpRequest or Fetch API based.
class XRequestedWith extends Header {
  /// Default constructor of [XRequestedWith] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XRequestedWith();
}

/// Represents the 'Access-Control-Request-Method' header.
///
/// Used in a preflight request, this header informs the server about the HTTP
/// method that will be used in the actual request.
class AccessControlRequestMethod extends Header {
  /// Default constructor of [AccessControlRequestMethod] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AccessControlRequestMethod();
}

/// Represents the 'Access-Control-Request-Headers' header.
///
/// Within a preflight request, this header indicates the headers that will be
/// used in the actual request to the server.
class AccessControlRequestHeaders extends Header {
  /// Default constructor of [AccessControlRequestHeaders] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AccessControlRequestHeaders();
}

/// Represents the 'Accept-Charset' header.
///
/// The `Accept-Charset` header specifies the character sets that are acceptable
/// for the response. It communicates the character encodings that the client can
/// process and understand.
class AcceptCharset extends Header {
  /// Default constructor of [AcceptCharset] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AcceptCharset();
}

/// Represents the 'Accept-Encoding' header.
///
/// The `Accept-Encoding` header specifies the encoding algorithms that the client
/// can understand. It communicates the compression methods acceptable for the response,
/// such as gzip or deflate.
class AcceptEncoding extends Header {
  /// Default constructor of [AcceptEncoding] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AcceptEncoding();
}

/// Represents the 'Accept-Ranges' header.
///
/// The `Accept-Ranges` header indicates the range units that the server supports
/// for a particular resource. It specifies whether the server allows the resource
/// to be requested in parts.
class AcceptRanges extends Header {
  /// Default constructor of [AcceptRanges] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AcceptRanges();
}

/// Represents the 'Access-Control-Allow-Credentials' header.
///
/// The `Access-Control-Allow-Credentials` header indicates whether the response
/// to the request can be exposed when the credentials flag is true in the request.
class AccessControlAllowCredentials extends Header {
  /// Default constructor of [AccessControlAllowCredentials] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AccessControlAllowCredentials();
}

/// Represents the 'Access-Control-Allow-Headers' header.
///
/// The `Access-Control-Allow-Headers` header specifies the allowed headers in a
/// preflight response to an OPTIONS request.
class AccessControlAllowHeaders extends Header {
  /// Default constructor of [AccessControlAllowHeaders] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AccessControlAllowHeaders();
}

/// Represents the 'Access-Control-Allow-Methods' header.
///
/// The `Access-Control-Allow-Methods` header specifies the methods allowed when
/// accessing the resource in response to a preflight request.
class AccessControlAllowMethods extends Header {
  /// Default constructor of [AccessControlAllowMethods] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AccessControlAllowMethods();
}

/// Represents the 'Access-Control-Expose-Headers' header.
///
/// The `Access-Control-Expose-Headers` header indicates which headers can be
/// exposed as part of the response by listing their names.
class AccessControlExposeHeaders extends Header {
  /// Default constructor of [AccessControlExposeHeaders] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AccessControlExposeHeaders();
}

/// Represents the 'Access-Control-Max-Age' header.
///
/// The `Access-Control-Max-Age` header indicates how long the results of a
/// preflight request (OPTIONS) can be cached.
class AccessControlMaxAge extends Header {
  /// Default constructor of [AccessControlMaxAge] to be used
  /// in [Cors] allowed header and expose header parameter.
  const AccessControlMaxAge();
}

/// Represents the 'Age' header.
///
/// The `Age` header conveys the time duration since the response was generated
/// by the origin server. It represents the time in seconds that a response
/// has been held in a cache.
class Age extends Header {
  /// Default constructor of [Age] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Age();
}

/// Represents the 'Allow' header.
///
/// The `Allow` header lists the set of HTTP methods supported by a resource.
class Allow extends Header {
  /// Default constructor of [Allow] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Allow();
}

/// Represents the 'Content-Disposition' header.
///
/// The `Content-Disposition` header indicates if the content should be displayed
/// inline or if it should be treated as an attachment and downloaded.
class ContentDisposition extends Header {
  /// Default constructor of [ContentDisposition] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ContentDisposition();
}

/// Represents the 'Content-Encoding' header.
///
/// The `Content-Encoding` header specifies the encoding applied to the resource,
/// usually for compression purposes.
class ContentEncoding extends Header {
  /// Default constructor of [ContentEncoding] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ContentEncoding();
}

/// Represents the 'Content-Location' header.
///
/// The `Content-Location` header indicates the specific location of the resource
/// within a wider context.
class ContentLocation extends Header {
  /// Default constructor of [ContentLocation] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ContentLocation();
}

/// Represents the 'Content-Range' header.
///
/// The `Content-Range` header specifies the byte range that a partial message
/// (such as a response to a partial GET request) represents within a full entity.
class ContentRange extends Header {
  /// Default constructor of [ContentRange] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ContentRange();
}

/// Represents the 'Content-Security-Policy' header.
///
/// The `Content-Security-Policy` header helps prevent various types of attacks
/// by defining content policies for the web page.
class ContentSecurityPolicy extends Header {
  /// Default constructor of [ContentSecurityPolicy] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ContentSecurityPolicy();
}

/// Represents the 'Content-Security-Policy-Report-Only' header.
///
/// The `Content-Security-Policy-Report-Only` header delivers a policy for the browser
/// to report violations to without blocking anything.
class ContentSecurityPolicyReportOnly extends Header {
  /// Default constructor of [ContentSecurityPolicyReportOnly] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ContentSecurityPolicyReportOnly();
}

/// Represents the 'Date' header.
///
/// The `Date` header indicates the date and time at which the message was originated.
class Date extends Header {
  /// Default constructor of [Date] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Date();
}

/// Represents the 'ETag' header.
///
/// The `ETag` header provides a unique identifier for the current version of the resource.
class ETag extends Header {
  /// Default constructor of [ETag] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ETag();

  @override
  String toString() => 'ETag';
}

/// Represents the 'Expires' header.
///
/// The `Expires` header indicates the date and time after which the response is
/// considered stale and should no longer be cached.
class Expires extends Header {
  /// Default constructor of [Expires] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Expires();
}

/// Represents the 'Last-Modified' header.
///
/// The `Last-Modified` header indicates the last modified date of the resource,
/// helping in cache validation.
class LastModified extends Header {
  /// Default constructor of [LastModified] to be used
  /// in [Cors] allowed header and expose header parameter.
  const LastModified();
}

/// Represents the 'Tk' header.
///
/// The `Tk` header indicates tracking status codes for the request.
class Tk extends Header {
  /// Default constructor of [Tk] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Tk();
}

/// Represents the 'Trailer' header.
///
/// The `Trailer` header specifies the headers included in the trailer of
/// chunked transfer encoding.
class Trailer extends Header {
  /// Default constructor of [Trailer] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Trailer();
}

/// Represents the 'Transfer-Encoding' header.
///
/// The `Transfer-Encoding` header specifies the form of encoding used to
/// safely transfer the payload to the user.
class TransferEncoding extends Header {
  /// Default constructor of [TransferEncoding] to be used
  /// in [Cors] allowed header and expose header parameter.
  const TransferEncoding();
}

/// Represents the 'Vary' header.
///
/// The `Vary` header indicates the set of request headers that were used
/// to determine the response representation's suitability.
class Vary extends Header {
  /// Default constructor of [Vary] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Vary();
}

/// Represents the 'Via' header.
///
/// The `Via` header indicates the intermediate protocols and recipients
/// between the client making the request and the server receiving it.
class Via extends Header {
  /// Default constructor of [Via] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Via();
}

/// Represents the 'Warning' header.
///
/// The `Warning` header provides additional information about the status
/// or transformation of a message that might not be reflected in the message.
class Warning extends Header {
  /// Default constructor of [Warning] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Warning();
}

/// Represents the 'WWW-Authenticate' header.
///
/// The `WWW-Authenticate` header indicates the authentication method
/// to be used to gain access to a resource.
class WWWAuthenticate extends Header {
  /// Default constructor of [WWWAuthenticate] to be used
  /// in [Cors] allowed header and expose header parameter.
  const WWWAuthenticate();

  @override
  String toString() {
    return 'WWW-Authenticate';
  }
}

/// Represents the 'X-Frame-Options' header.
///
/// The `X-Frame-Options` header helps to prevent clickjacking attacks by
/// indicating whether a browser should be allowed to render a page in a frame.
class XFrameOptions extends Header {
  /// Default constructor of [XFrameOptions] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XFrameOptions();
}

/// Represents the 'X-Powered-By' header.
///
/// The `X-Powered-By` header indicates the technology supporting the web application.
class XPoweredBy extends Header {
  /// Default constructor of [XPoweredBy] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XPoweredBy();
}

/// Represents the 'X-UA-Compatible' header.
///
/// The `X-UA-Compatible` header specifies the compatibility mode for rendering
/// web pages in the browser.
class XUACompatible extends Header {
  /// Default constructor of [XUACompatible] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XUACompatible();

  @override
  String toString() {
    return 'X-UA-Compatible';
  }
}

/// Represents the 'X-Content-Type-Options' header.
///
/// The `X-Content-Type-Options` header is used to prevent browsers from MIME-sniffing
/// a response away from the declared content-type.
class XContentTypeOptions extends Header {
  /// Default constructor of [XContentTypeOptions] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XContentTypeOptions();
}

/// Represents the 'X-DNS-Prefetch-Control' header.
///
/// The `X-DNS-Prefetch-Control` header controls DNS prefetching, allowing
/// or denying browser DNS prefetching.
class XDNSPrefetchControl extends Header {
  /// Default constructor of [XDNSPrefetchControl] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XDNSPrefetchControl();

  @override
  String toString() {
    return 'X-DNS-Prefetch-Control';
  }
}

/// Represents the 'X-Download-Options' header.
///
/// The `X-Download-Options` header instructs browsers on whether they should be
/// allowed to open a file download dialog for a given resource.
class XDownloadOptions extends Header {
  /// Default constructor of [XDownloadOptions] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XDownloadOptions();
}

/// Represents the 'X-Permitted-Cross-Domain-Policies' header.
///
/// The `X-Permitted-Cross-Domain-Policies` header determines whether a resource
/// should be accessible to other domains or not.
class XPermittedCrossDomainPolicies extends Header {
  /// Default constructor of [XPermittedCrossDomainPolicies] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XPermittedCrossDomainPolicies();
}

/// Represents the 'X-Redirect-By' header.
///
/// The `X-Redirect-By` header specifies the mechanism by which the server
/// has processed the request.
class XRedirectBy extends Header {
  /// Default constructor of [XRedirectBy] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XRedirectBy();
}

/// Represents the 'X-Robots-Tag' header.
///
/// The `X-Robots-Tag` header provides instructions to search engine crawlers
/// on how to index or treat a web page.
class XRobotsTag extends Header {
  /// Default constructor of [XRobotsTag] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XRobotsTag();
}

/// Represents the 'X-XSS-Protection' header.
///
/// The `X-XSS-Protection` header enables or disables the browser's built-in
/// Cross-Site Scripting (XSS) protection.
class XXSSProtection extends Header {
  /// Default constructor of [XXSSProtection] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XXSSProtection();

  @override
  String toString() {
    return 'X-XSS-Protection';
  }
}

/// Represents the 'Refresh' header.
///
/// The `Refresh` header instructs the browser to refresh the current web page
/// after a specified time interval.
class Refresh extends Header {
  /// Default constructor of [Refresh] to be used
  /// in [Cors] allowed header and expose header parameter.
  const Refresh();
}

/// Represents the 'Report-To' header.
///
/// The `Report-To` header instructs the browser to send reports of violations
/// of content security policy.
class ReportTo extends Header {
  /// Default constructor of [ReportTo] to be used
  /// in [Cors] allowed header and expose header parameter.
  const ReportTo();
}

/// Represents the 'Sec-Fetch-Site' header.
///
/// The `Sec-Fetch-Site` header provides information about the context
/// in which the request is being made.
class SecFetchSite extends Header {
  /// Default constructor of [SecFetchSite] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecFetchSite();
}

/// Represents the 'Sec-Fetch-Mode' header.
///
/// The `Sec-Fetch-Mode` header provides the fetch mode of the request
/// (e.g., `cors`, `navigate`, etc.).
class SecFetchMode extends Header {
  /// Default constructor of [SecFetchMode] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecFetchMode();
}

/// Represents the 'Sec-Fetch-Dest' header.
///
/// The `Sec-Fetch-Dest` header indicates the destination or purpose
/// of the request (e.g., `image`, `script`, etc.).
class SecFetchDest extends Header {
  /// Default constructor of [SecFetchDest] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecFetchDest();
}

/// Represents the 'Sec-Fetch-User' header.
///
/// The `Sec-Fetch-User` header provides information about the user
/// context of the request.
class SecFetchUser extends Header {
  /// Default constructor of [SecFetchUser] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecFetchUser();
}

/// Represents the 'Sec-Fetch-Credentials' header.
///
/// The `Sec-Fetch-Credentials` header indicates whether the request
/// should include credentials (such as cookies or authorization headers).
class SecFetchCredentials extends Header {
  /// Default constructor of [SecFetchCredentials] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecFetchCredentials();
}

/// Represents the 'Sec-Fetch-Cache' header.
///
/// The `Sec-Fetch-Cache` header provides details about how the request
/// should be handled regarding caching.
class SecFetchCache extends Header {
  /// Default constructor of [SecFetchCache] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecFetchCache();
}

/// Represents the 'Sec-Fetch-Priority' header.
///
/// The `Sec-Fetch-Priority` header specifies the priority of the request.
class SecFetchPriority extends Header {
  /// Default constructor of [SecFetchPriority] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecFetchPriority();
}

/// Represents the 'Sec-Fetch-Frame' header.
///
/// The `Sec-Fetch-Frame` header indicates whether the request is intended
/// to be a frame navigation (similar to the `X-Frame-Options` header).
class SecFetchFrame extends Header {
  /// Default constructor of [SecFetchFrame] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecFetchFrame();
}

/// Represents the 'Sec-Fetch-Version' header.
///
/// The `Sec-Fetch-Version` header provides information about the version
/// of the request.
class SecFetchVersion extends Header {
  /// Default constructor of [SecFetchVersion] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecFetchVersion();
}

/// Represents the 'Sec-WebSocket-Key' header.
///
/// The `Sec-WebSocket-Key` header is used in the WebSocket handshake
/// to provide a base64-encoded value as part of the security handshake.
class SecWebSocketKey extends Header {
  /// Default constructor of [SecWebSocketKey] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketKey();

  @override
  String toString() {
    return 'Sec-WebSocket-Key';
  }
}

/// Represents the 'Sec-WebSocket-Extensions' header.
///
/// The `Sec-WebSocket-Extensions` header specifies the WebSocket extensions
/// that the client wishes to use or are in use for the connection.
class SecWebSocketExtensions extends Header {
  /// Default constructor of [SecWebSocketExtensions] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketExtensions();
}

/// Represents the 'Sec-WebSocket-Accept' header.
///
/// The `Sec-WebSocket-Accept` header is part of the WebSocket handshake
/// and is used in response to the client's handshake request to confirm
/// the establishment of the WebSocket connection.
class SecWebSocketAccept extends Header {
  /// Default constructor of [SecWebSocketAccept] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketAccept();
}

/// Represents the 'Sec-WebSocket-Protocol' header.
///
/// The `Sec-WebSocket-Protocol` header specifies the subprotocol that
/// the server selected and is being used for the WebSocket connection.
class SecWebSocketProtocol extends Header {
  /// Default constructor of [SecWebSocketProtocol] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketProtocol();
}

/// Represents the 'Sec-WebSocket-Version' header.
///
/// The `Sec-WebSocket-Version` header specifies the version(s) of the WebSocket
/// protocol being used for the connection.
class SecWebSocketVersion extends Header {
  /// Default constructor of [SecWebSocketVersion] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketVersion();
}

/// Represents the 'Sec-WebSocket-Version-Key' header.
///
/// The `Sec-WebSocket-Version-Key` header is used in the WebSocket handshake
/// to provide a base64-encoded value for security purposes.
class SecWebSocketVersionKey extends Header {
  /// Default constructor of [SecWebSocketVersionKey] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketVersionKey();
}

/// Represents the 'Sec-WebSocket-Version-Origin' header.
///
/// The `Sec-WebSocket-Version-Origin` header provides information about
/// the origin of the WebSocket version being used in the handshake.
class SecWebSocketVersionOrigin extends Header {
  /// Default constructor of [SecWebSocketVersionOrigin] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketVersionOrigin();
}

/// Represents the 'Sec-WebSocket-Version-Location' header.
///
/// The `Sec-WebSocket-Version-Location` header provides the location of the
/// WebSocket version being used in the handshake.
class SecWebSocketVersionLocation extends Header {
  /// Default constructor of [SecWebSocketVersionLocation] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketVersionLocation();
}

/// Represents the 'Sec-WebSocket-Version-Id' header.
///
/// The `Sec-WebSocket-Version-Id` header provides an identifier for the WebSocket
/// version being used in the handshake.
class SecWebSocketVersionId extends Header {
  /// Default constructor of [SecWebSocketVersionId] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketVersionId();
}

/// Represents the 'Sec-WebSocket-Version-Parent-Id' header.
///
/// The `Sec-WebSocket-Version-Parent-Id` header provides the identifier of
/// the parent WebSocket version being used in the handshake.
class SecWebSocketVersionParentId extends Header {
  /// Default constructor of [SecWebSocketVersionParentId] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketVersionParentId();
}

/// Represents the 'Sec-WebSocket-Version-Nonce' header.
///
/// The `Sec-WebSocket-Version-Nonce` header provides a nonce value used
/// for security in the WebSocket handshake.
class SecWebSocketVersionNonce extends Header {
  /// Default constructor of [SecWebSocketVersionNonce] to be used
  /// in [Cors] allowed header and expose header parameter.
  const SecWebSocketVersionNonce();
}

/// Represents the 'X-Custom-Header' header.
///
/// The `X-Custom-Header` header provides custom information for communication.
class XCustomHeader extends Header {
  /// Default constructor for [XCustomHeader].
  ///
  /// This header allows for custom data to be transmitted in requests or responses.
  const XCustomHeader();
}

/// Represents the 'X-WebKit-CSP' header.
///
/// The `X-WebKit-CSP` header is a deprecated alias for the `Content-Security-Policy`
/// header used by older versions of WebKit-based browsers.
class XWebKitCSP extends Header {
  /// Default constructor of [XWebKitCSP] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XWebKitCSP();

  @override
  String toString() {
    return 'X-WebKit-CSP';
  }
}

/// Represents the 'X-Permitted-Cross-Domain-Policy' header.
///
/// The `X-Permitted-Cross-Domain-Policy` header specifies the policy for
/// cross-domain requests that are permitted by Adobe Flash Player.
class XPermittedCrossDomainPolicy extends Header {
  /// Default constructor of [XPermittedCrossDomainPolicy] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XPermittedCrossDomainPolicy();
}

/// Represents the 'X-SourceMap' header.
///
/// The `X-SourceMap` header provides the path to the source map associated
/// with the requested resource, allowing for debugging and error tracking.
class XSourceMap extends Header {
  /// Default constructor of [XSourceMap] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XSourceMap();
}

/// Represents the 'X-Forwarded-Proto' header.
///
/// The `X-Forwarded-Proto` header specifies the protocol (HTTP or HTTPS) that
/// a client used to connect to a proxy or load balancer.
class XForwardedProto extends Header {
  /// Default constructor of [XForwardedProto] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XForwardedProto();
}

/// Represents the 'X-Forwarded-For' header.
///
/// The `X-Forwarded-For` header contains the client's original IP address when
/// the request is made through a proxy or a load balancer.
class XForwardedFor extends Header {
  /// Default constructor of [XForwardedFor] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XForwardedFor();
}

/// Represents the 'X-Forwarded-Host' header.
///
/// The `X-Forwarded-Host` header specifies the original host requested by
/// the client in scenarios where the request passes through proxies or load balancers.
class XForwardedHost extends Header {
  /// Default constructor of [XForwardedHost] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XForwardedHost();
}

/// Represents the 'X-Forwarded-Server' header.
///
/// The `X-Forwarded-Server` header specifies the original server that handled
/// the request when passing through proxies or load balancers.
class XForwardedServer extends Header {
  /// Default constructor of [XForwardedServer] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XForwardedServer();
}

/// Represents the 'X-Real-IP' header.
///
/// The `X-Real-IP` header specifies the real IP address of a client in situations
/// where the request passes through proxies or load balancers.
class XRealIP extends Header {
  /// Default constructor of [XRealIP] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XRealIP();

  @override
  String toString() {
    return 'X-Real-IP';
  }
}

/// Represents the 'X-Frame-Options-Type' header.
///
/// The `X-Frame-Options-Type` header specifies the type of policy regarding
/// whether a browser should be allowed to render a page in a frame.
class XFrameOptionsType extends Header {
  /// Default constructor of [XFrameOptionsType] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XFrameOptionsType();
}

/// Represents the 'X-Frame-Options-Allow-From' header.
///
/// The `X-Frame-Options-Allow-From` header specifies the domain that is allowed
/// to embed a web page in a frame.
class XFrameOptionsAllowFrom extends Header {
  /// Default constructor of [XFrameOptionsAllowFrom] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XFrameOptionsAllowFrom();
}

/// Represents the 'X-Frame-Options-Deny' header.
///
/// The `X-Frame-Options-Deny` header instructs the browser to deny rendering
/// the web page within a frame.
class XFrameOptionsDeny extends Header {
  /// Default constructor of [XFrameOptionsDeny] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XFrameOptionsDeny();
}

/// Represents the 'X-Content-Duration' header.
///
/// The `X-Content-Duration` header specifies the duration of a media resource,
/// providing a hint for how long it takes to play the resource.
class XContentDuration extends Header {
  /// Default constructor of [XContentDuration] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XContentDuration();
}

/// Represents the 'X-Content-Security-Policy' header.
///
/// The `X-Content-Security-Policy` header helps prevent various types of attacks
/// by defining content policies for the web page.
class XContentSecurityPolicy extends Header {
  /// Default constructor of [XContentSecurityPolicy] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XContentSecurityPolicy();
}

/// Represents the 'X-Content-Security-Policy-Report-Only' header.
///
/// The `X-Content-Security-Policy-Report-Only` header delivers a policy for the browser
/// to report violations to without blocking anything.
class XContentSecurityPolicyReportOnly extends Header {
  /// Default constructor of [XContentSecurityPolicyReportOnly] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XContentSecurityPolicyReportOnly();
}

/// Represents the 'X-Correlation-ID' header.
///
/// The `X-Correlation-ID` header provides a unique identifier to trace a request
/// across different services for debugging and monitoring purposes.
class XCorrelationID extends Header {
  /// Default constructor of [XCorrelationID] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XCorrelationID();

  @override
  String toString() {
    return 'X-Correlation-ID';
  }
}

/// Represents the 'X-Device-User-Agent' header.
///
/// The `X-Device-User-Agent` header contains information about the user agent
/// of the device making the request.
class XDeviceUserAgent extends Header {
  /// Default constructor of [XDeviceUserAgent] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XDeviceUserAgent();
}

/// Represents the 'X-Forwarded-Scheme' header.
///
/// The `X-Forwarded-Scheme` header specifies the protocol scheme (HTTP/HTTPS)
/// that a client used to connect to a proxy or load balancer.
class XForwardedScheme extends Header {
  /// Default constructor of [XForwardedScheme] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XForwardedScheme();
}

/// Represents the 'X-Forwarded-SSL' header.
///
/// The `X-Forwarded-SSL` header indicates whether SSL is being used, typically
/// when a request passes through a proxy or a load balancer.
class XForwardedSSL extends Header {
  /// Default constructor of [XForwardedSSL] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XForwardedSSL();

  @override
  String toString() {
    return 'X-Forwarded-SSL';
  }
}

/// Represents the 'X-Forwarded-SSL-Client-Cert' header.
///
/// The `X-Forwarded-SSL-Client-Cert` header contains SSL client certificate
/// information when a request passes through a proxy or a load balancer.
class XForwardedSslClientCert extends Header {
  /// Default constructor of [XForwardedSslClientCert] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XForwardedSslClientCert();

  @override
  String toString() {
    return 'X-Forwarded-SSL-Client-Cert';
  }
}

/// Represents the 'X-Forwarded-SSL-Client-Cert-Info' header.
///
/// The `X-Forwarded-SSL-Client-Cert-Info` header provides detailed information
/// about the SSL client certificate when a request passes through a proxy or a load balancer.
class XForwardedSslClientCertInfo extends Header {
  /// Default constructor of [XForwardedSslClientCertInfo] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XForwardedSslClientCertInfo();

  @override
  String toString() {
    return 'X-Forwarded-SSL-Client-Cert-Info';
  }
}

/// Represents the 'X-HTTP-Method' header.
///
/// The `X-HTTP-Method` header specifies the original HTTP method used for a request
/// when overridden by a middleware or gateway.
class XHTTPMethod extends Header {
  /// Default constructor of [XHTTPMethod] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XHTTPMethod();

  @override
  String toString() {
    return 'X-HTTP-Method';
  }
}

/// Represents the 'X-Request-ID' header.
///
/// The `X-Request-ID` header contains a unique identifier for a specific request
/// to aid in tracing and debugging across various systems.
class XRequestID extends Header {
  /// Default constructor of [XRequestID] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XRequestID();

  @override
  String toString() {
    return 'X-Request-ID';
  }
}

/// Represents the 'X-Response-Time' header.
///
/// The `X-Response-Time` header provides information about the time taken
/// to process and generate a response for a request.
class XResponseTime extends Header {
  /// Default constructor of [XResponseTime] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XResponseTime();
}

/// Represents the 'X-UIDH' header.
///
/// The `X-UIDH` header is used by some carriers for identifying mobile users
/// for various purposes like advertising or tracking.
class XUIDH extends Header {
  /// Default constructor of [XUIDH] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XUIDH();

  @override
  String toString() => 'X-UIDH';
}

/// Represents the 'X-Wap-Profile' header.
///
/// The `X-Wap-Profile` header contains a URL that points to a WAP profile,
/// describing capabilities of mobile devices.
class XWapProfile extends Header {
  /// Default constructor of [XWapProfile] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XWapProfile();
}

/// Represents the 'X-WebKit-CSP-Report-Only' header.
///
/// The `X-WebKit-CSP-Report-Only` header delivers a policy for the browser
/// to report content security policy violations without blocking anything.
class XWebKitCSPReportOnly extends Header {
  /// Default constructor of [XWebKitCSPReportOnly] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XWebKitCSPReportOnly();

  @override
  String toString() {
    return 'X-WebKit-CSP-Report-Only';
  }
}

/// Represents the 'X-XSRF-Token' header.
///
/// The `X-XSRF-Token` header contains a token used to prevent cross-site
/// request forgery (XSRF/CSRF) attacks.
class XXSRFToken extends Header {
  /// Default constructor of [XXSRFToken] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XXSRFToken();

  @override
  String toString() {
    return 'X-XSRF-Token';
  }
}

/// Represents the 'X-Zone-Debug' header.
///
/// The `X-Zone-Debug` header provides debugging information related to
/// the zone or region of the request.
class XZoneDebug extends Header {
  /// Default constructor of [XZoneDebug] to be used
  /// in [Cors] allowed header and expose header parameter.
  const XZoneDebug();
}
