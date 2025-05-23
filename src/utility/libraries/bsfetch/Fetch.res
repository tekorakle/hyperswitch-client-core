type body
type bodyInit
type headers
type headersInit
type response
type request
type requestInit
type abortController
type signal

/* external */
type arrayBuffer /* TypedArray */
type bufferSource /* Web IDL, either an arrayBuffer or arrayBufferView */
type formData /* XMLHttpRequest */
type readableStream /* Streams */
type urlSearchParams /* URL */

type blob
type file

module AbortController = {
  type t = abortController

  @get external signal: t => signal = "signal"
  @send external abort: t => unit = "abort"
  @new external make: unit => t = "AbortController"
}

type requestMethod =
  | Get
  | Head
  | Post
  | Put
  | Delete
  | Connect
  | Options
  | Trace
  | Patch
  | Other(string)
let encodeRequestMethod = x =>
  /* internal */

  switch x {
  | Get => "GET"
  | Head => "HEAD"
  | Post => "POST"
  | Put => "PUT"
  | Delete => "DELETE"
  | Connect => "CONNECT"
  | Options => "OPTIONS"
  | Trace => "TRACE"
  | Patch => "PATCH"
  | Other(method_) => method_
  }
let decodeRequestMethod = x =>
  /* internal */

  switch x {
  | "GET" => Get
  | "HEAD" => Head
  | "POST" => Post
  | "PUT" => Put
  | "DELETE" => Delete
  | "CONNECT" => Connect
  | "OPTIONS" => Options
  | "TRACE" => Trace
  | "PATCH" => Patch
  | method_ => Other(method_)
  }

type referrerPolicy =
  | None
  | NoReferrer
  | NoReferrerWhenDowngrade
  | SameOrigin
  | Origin
  | StrictOrigin
  | OriginWhenCrossOrigin
  | StrictOriginWhenCrossOrigin
  | UnsafeUrl
let encodeReferrerPolicy = x =>
  /* internal */

  switch x {
  | NoReferrer => "no-referrer"
  | None => ""
  | NoReferrerWhenDowngrade => "no-referrer-when-downgrade"
  | SameOrigin => "same-origin"
  | Origin => "origin"
  | StrictOrigin => "strict-origin"
  | OriginWhenCrossOrigin => "origin-when-cross-origin"
  | StrictOriginWhenCrossOrigin => "strict-origin-when-cross-origin"
  | UnsafeUrl => "unsafe-url"
  }
let decodeReferrerPolicy = x =>
  /* internal */

  switch x {
  | "no-referrer" => NoReferrer
  | "" => None
  | "no-referrer-when-downgrade" => NoReferrerWhenDowngrade
  | "same-origin" => SameOrigin
  | "origin" => Origin
  | "strict-origin" => StrictOrigin
  | "origin-when-cross-origin" => OriginWhenCrossOrigin
  | "strict-origin-when-cross-origin" => StrictOriginWhenCrossOrigin
  | "unsafe-url" => UnsafeUrl
  | e => raise(Failure("Unknown referrerPolicy: " ++ e))
  }

type requestType =
  | None /* default? unknown? just empty string in spec */
  | Audio
  | Font
  | Image
  | Script
  | Style
  | Track
  | Video
let decodeRequestType = x =>
  /* internal */

  switch x {
  | "audio" => Audio
  | "" => None
  | "font" => Font
  | "image" => Image
  | "script" => Script
  | "style" => Style
  | "track" => Track
  | "video" => Video
  | e => raise(Failure("Unknown requestType: " ++ e))
  }

type requestDestination =
  | None /* default? unknown? just empty string in spec */
  | Document
  | Embed
  | Font
  | Image
  | Manifest
  | Media
  | Object
  | Report
  | Script
  | ServiceWorker
  | SharedWorker
  | Style
  | Worker
  | Xslt
let decodeRequestDestination = x =>
  /* internal */

  switch x {
  | "document" => Document
  | "" => None
  | "embed" => Embed
  | "font" => Font
  | "image" => Image
  | "manifest" => Manifest
  | "media" => Media
  | "object" => Object
  | "report" => Report
  | "script" => Script
  | "serviceworker" => ServiceWorker
  | "sharedworder" => SharedWorker
  | "style" => Style
  | "worker" => Worker
  | "xslt" => Xslt
  | e => raise(Failure("Unknown requestDestination: " ++ e))
  }

type requestMode =
  | Navigate
  | SameOrigin
  | NoCORS
  | CORS
let encodeRequestMode = x =>
  /* internal */

  switch x {
  | Navigate => "navigate"
  | SameOrigin => "same-origin"
  | NoCORS => "no-cors"
  | CORS => "cors"
  }
let decodeRequestMode = x =>
  /* internal */

  switch x {
  | "navigate" => Navigate
  | "same-origin" => SameOrigin
  | "no-cors" => NoCORS
  | "cors" => CORS
  | e => raise(Failure("Unknown requestMode: " ++ e))
  }

type requestCredentials =
  | Omit
  | SameOrigin
  | Include
let encodeRequestCredentials = x =>
  /* internal */

  switch x {
  | Omit => "omit"
  | SameOrigin => "same-origin"
  | Include => "include"
  }
let decodeRequestCredentials = x =>
  /* internal */

  switch x {
  | "omit" => Omit
  | "same-origin" => SameOrigin
  | "include" => Include
  | e => raise(Failure("Unknown requestCredentials: " ++ e))
  }

type requestCache =
  | Default
  | NoStore
  | Reload
  | NoCache
  | ForceCache
  | OnlyIfCached
let encodeRequestCache = x =>
  /* internal */

  switch x {
  | Default => "default"
  | NoStore => "no-store"
  | Reload => "reload"
  | NoCache => "no-cache"
  | ForceCache => "force-cache"
  | OnlyIfCached => "only-if-cached"
  }
let decodeRequestCache = x =>
  /* internal */

  switch x {
  | "default" => Default
  | "no-store" => NoStore
  | "reload" => Reload
  | "no-cache" => NoCache
  | "force-cache" => ForceCache
  | "only-if-cached" => OnlyIfCached
  | e => raise(Failure("Unknown requestCache: " ++ e))
  }

type requestRedirect =
  | Follow
  | Error
  | Manual
let encodeRequestRedirect = x =>
  /* internal */

  switch x {
  | Follow => "follow"
  | Error => "error"
  | Manual => "manual"
  }
let decodeRequestRedirect = x =>
  /* internal */

  switch x {
  | "follow" => Follow
  | "error" => Error
  | "manual" => Manual
  | e => raise(Failure("Unknown requestRedirect: " ++ e))
  }

module HeadersInit = {
  type t = headersInit

  let make: {..} => t = Utils.getJsonObjectFromRecord
  let makeWithDict: Js.Dict.t<string> => t = Utils.getJsonObjectFromRecord
  let makeWithArray: array<(string, string)> => t = Utils.getJsonObjectFromRecord
}

module Headers = {
  type t = headers

  @new external make: t = "Headers"
  @new external makeWithInit: headersInit => t = "Headers"

  @send external append: (t, string, string) => unit = "append"
  @send
  external delete: (t, string) => unit = "delete" /* entries */ /* very experimental */
  @send @return({null_to_opt: null_to_opt})
  external get: (t, string) => option<string> = "get"
  @send external has: (t, string) => bool = "has" /* keys */ /* very experimental */
  @send
  external set: (t, string, string) => unit = "set" /* values */ /* very experimental */
}

module BodyInit = {
  type t = bodyInit

  let make: string => t = Utils.getJsonObjectFromRecord
  let makeWithBlob: blob => t = Utils.getJsonObjectFromRecord
  let makeWithBufferSource: bufferSource => t = Utils.getJsonObjectFromRecord
  let makeWithFormData: formData => t = Utils.getJsonObjectFromRecord
  let makeWithUrlSearchParams: urlSearchParams => t = Utils.getJsonObjectFromRecord
}

module Body = {
  module Impl = (
    T: {
      type t
    },
  ) => {
    @get external body: T.t => readableStream = "body"
    @get external bodyUsed: T.t => bool = "bodyUsed"

    @send
    external arrayBuffer: T.t => Js.Promise.t<arrayBuffer> = "arrayBuffer"
    @send external blob: T.t => Js.Promise.t<blob> = "blob"
    @send
    external formData: T.t => Js.Promise.t<formData> = "formData"
    @send external json: T.t => Js.Promise.t<Js.Json.t> = "json"
    @send external text: T.t => Js.Promise.t<string> = "text"
  }

  type t = body
  include Impl({
    type t = t
  })
}

module RequestInit = {
  type t = requestInit

  let map = (f, x) =>
    /* internal */
    switch x {
    | Some(v) => Some(f(v))
    | None => None
    }

  @obj
  external make: (
    ~method: string=?,
    ~headers: headersInit=?,
    ~body: bodyInit=?,
    ~referrer: string=?,
    ~referrerPolicy: string=?,
    ~mode: string=?,
    ~credentials: string=?,
    ~cache: string=?,
    ~redirect: string=?,
    ~integrity: string=?,
    ~keepalive: bool=?,
    ~signal: signal=?,
  ) => requestInit = ""
  let make = (
    ~method_: option<requestMethod>=?,
    ~headers: option<headersInit>=?,
    ~body: option<bodyInit>=?,
    ~referrer: option<string>=?,
    ~referrerPolicy: referrerPolicy=None,
    ~mode: option<requestMode>=?,
    ~credentials: option<requestCredentials>=?,
    ~cache: option<requestCache>=?,
    ~redirect: option<requestRedirect>=?,
    ~integrity: string="",
    ~keepalive: option<bool>=?,
    ~signal: option<signal>=?,
    (),
  ) =>
    make(
      ~method=?map(encodeRequestMethod, method_),
      ~headers?,
      ~body?,
      ~referrer?,
      ~referrerPolicy=encodeReferrerPolicy(referrerPolicy),
      ~mode=?map(encodeRequestMode, mode),
      ~credentials=?map(encodeRequestCredentials, credentials),
      ~cache=?map(encodeRequestCache, cache),
      ~redirect=?map(encodeRequestRedirect, redirect),
      ~integrity,
      ~keepalive?,
      ~signal?,
    )
}

module Request = {
  type t = request

  include Body.Impl({
    type t = t
  })

  @new external make: string => t = "Request"
  @new external makeWithInit: (string, requestInit) => t = "Request"
  @new external makeWithRequest: t => t = "Request"
  @new external makeWithRequestInit: (t, requestInit) => t = "Request"

  @get external method__: t => string = "method"
  let method_: t => requestMethod = self => decodeRequestMethod(method__(self))
  @get external url: t => string = "url"
  @get external headers: t => headers = "headers"
  @get external type_: t => string = "type"
  let type_: t => requestType = self => decodeRequestType(type_(self))
  @get external destination: t => string = "destination"
  let destination: t => requestDestination = self => decodeRequestDestination(destination(self))
  @get external referrer: t => string = "referrer"
  @get external referrerPolicy: t => string = "referrerPolicy"
  let referrerPolicy: t => referrerPolicy = self => decodeReferrerPolicy(referrerPolicy(self))
  @get external mode: t => string = "mode"
  let mode: t => requestMode = self => decodeRequestMode(mode(self))
  @get external credentials: t => string = "credentials"
  let credentials: t => requestCredentials = self => decodeRequestCredentials(credentials(self))
  @get external cache: t => string = "cache"
  let cache: t => requestCache = self => decodeRequestCache(cache(self))
  @get external redirect: t => string = "redirect"
  let redirect: t => requestRedirect = self => decodeRequestRedirect(redirect(self))
  @get external integrity: t => string = "integrity"
  @get external keepalive: t => bool = "keepalive"
  @get external signal: t => signal = "signal"
}

module Response = {
  type t = response

  include Body.Impl({
    type t = t
  })

  @val external error: unit => t = "error"
  @val external redirect: string => t = "redirect"
  @val
  external redirectWithStatus: (string, int /* enum-ish */) => t = "redirect"
  @get external headers: t => headers = "headers"
  @get external ok: t => bool = "ok"
  @get external redirected: t => bool = "redirected"
  @get external status: t => int = "status"
  @get external statusText: t => string = "statusText"
  @get external type_: t => string = "type"
  @get external url: t => string = "url"

  @send external clone: t => t = "clone"
}

module FormData = {
  module EntryValue = {
    type t

    let classify: t => [> #String(string) | #File(file)] = t =>
      if Js.typeof(t) == "string" {
        #String(Obj.magic(t))
      } else {
        #File(Obj.magic(t))
      }
  }

  module Iterator = Fetch__Iterator
  type t = formData

  @new external make: unit => t = "FormData"
  @send external append: (t, string, string) => unit = "append"
  @send external delete: (t, string) => unit = "delete"
  @send external get: (t, string) => option<EntryValue.t> = "get"
  @send
  external getAll: (t, string) => array<EntryValue.t> = "getAll"
  @send external set: (t, string, string) => unit = "set"
  @send external has: (t, string) => bool = "has"
  @send external keys: t => Iterator.t<string> = "keys"
  @send external values: t => Iterator.t<EntryValue.t> = "values"

  @send
  external appendObject: (t, string, {..}, ~filename: string=?) => unit = "append"

  @send
  external appendBlob: (t, string, blob, ~filename: string=?) => unit = "append"

  @send
  external appendFile: (t, string, file, ~filename: string=?) => unit = "append"

  @send
  external setObject: (t, string, {..}, ~filename: string=?) => unit = "set"

  @send
  external setBlob: (t, string, blob, ~filename: string=?) => unit = "set"

  @send
  external setFile: (t, string, file, ~filename: string=?) => unit = "set"

  @send
  external entries: t => Iterator.t<(string, EntryValue.t)> = "entries"
}

@val external fetch: string => Js.Promise.t<response> = "fetch"
@val
external fetchWithInit: (string, requestInit) => Js.Promise.t<response> = "fetch"
@val
external fetchWithRequest: request => Js.Promise.t<response> = "fetch"
@val
external fetchWithRequestInit: (request, requestInit) => Js.Promise.t<response> = "fetch"
