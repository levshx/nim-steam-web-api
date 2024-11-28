import asyncdispatch, httpclient, uri, strutils, options
## :Author: levshx
## :Generator: https://github.com/levshx/nim-steam/
## :Date: 2022-07-23T13:29:09Z
const
  WEBAPI_BASE_URL* =
    when defined(ssl): "https://api.steampowered.com/" ## Steam API URL (SSL).
    else:              "http://api.steampowered.com/"  ## Steam API URL (No SSL).
converter toOption*[T](x:T):Option[T] = some(x)
type
  Rawbinary* = string
  Message* = string
  Param = object
    name: string
    value: string
  SteamWebAPI* = object
    ## Sync steam WebAPI client
    IClientStats_1046930*:IClientStats_1046930
    IGCVersion_1046930*:IGCVersion_1046930
    IGCVersion_1269260*:IGCVersion_1269260
    IGCVersion_205790*:IGCVersion_205790
    IGCVersion_440*:IGCVersion_440
    IGCVersion_570*:IGCVersion_570
    IGCVersion_583950*:IGCVersion_583950
    IGCVersion_730*:IGCVersion_730
    IPortal2Leaderboards_620*:IPortal2Leaderboards_620
    ISteamApps*:ISteamApps
    ISteamBroadcast*:ISteamBroadcast
    ISteamDirectory*:ISteamDirectory
    ISteamNews*:ISteamNews
    ISteamRemoteStorage*:ISteamRemoteStorage
    ISteamUserAuth*:ISteamUserAuth
    ISteamUserOAuth*:ISteamUserOAuth
    ISteamUserStats*:ISteamUserStats
    ISteamWebAPIUtil*:ISteamWebAPIUtil
    ISteamWebUserPresenceOAuth*:ISteamWebUserPresenceOAuth
    ITFSystem_440*:ITFSystem_440
    IBroadcastService*:IBroadcastService
    IContentServerDirectoryService*:IContentServerDirectoryService
    IPublishedFileService*:IPublishedFileService
    IPlayerService*:IPlayerService
    IGameNotificationsService*:IGameNotificationsService
    IHelpRequestLogsService*:IHelpRequestLogsService
  AsyncSteamWebAPI* = object
    ## Async steam WebAPI client
    IClientStats_1046930*: AsyncIClientStats_1046930
    IGCVersion_1046930*: AsyncIGCVersion_1046930
    IGCVersion_1269260*: AsyncIGCVersion_1269260
    IGCVersion_205790*: AsyncIGCVersion_205790
    IGCVersion_440*: AsyncIGCVersion_440
    IGCVersion_570*: AsyncIGCVersion_570
    IGCVersion_583950*: AsyncIGCVersion_583950
    IGCVersion_730*: AsyncIGCVersion_730
    IPortal2Leaderboards_620*: AsyncIPortal2Leaderboards_620
    ISteamApps*: AsyncISteamApps
    ISteamBroadcast*: AsyncISteamBroadcast
    ISteamDirectory*: AsyncISteamDirectory
    ISteamNews*: AsyncISteamNews
    ISteamRemoteStorage*: AsyncISteamRemoteStorage
    ISteamUserAuth*: AsyncISteamUserAuth
    ISteamUserOAuth*: AsyncISteamUserOAuth
    ISteamUserStats*: AsyncISteamUserStats
    ISteamWebAPIUtil*: AsyncISteamWebAPIUtil
    ISteamWebUserPresenceOAuth*: AsyncISteamWebUserPresenceOAuth
    ITFSystem_440*: AsyncITFSystem_440
    IBroadcastService*: AsyncIBroadcastService
    IContentServerDirectoryService*: AsyncIContentServerDirectoryService
    IPublishedFileService*: AsyncIPublishedFileService
    IPlayerService*: AsyncIPlayerService
    IGameNotificationsService*: AsyncIGameNotificationsService
    IHelpRequestLogsService*: AsyncIHelpRequestLogsService
  IClientStats_1046930 = object 
    name*:string
    methods*: seq[string]
  AsyncIClientStats_1046930 =  object 
    name*:string
    methods*: seq[string]
  IGCVersion_1046930 = object 
    name*:string
    methods*: seq[string]
  AsyncIGCVersion_1046930 =  object 
    name*:string
    methods*: seq[string]
  IGCVersion_1269260 = object 
    name*:string
    methods*: seq[string]
  AsyncIGCVersion_1269260 =  object 
    name*:string
    methods*: seq[string]
  IGCVersion_205790 = object 
    name*:string
    methods*: seq[string]
  AsyncIGCVersion_205790 =  object 
    name*:string
    methods*: seq[string]
  IGCVersion_440 = object 
    name*:string
    methods*: seq[string]
  AsyncIGCVersion_440 =  object 
    name*:string
    methods*: seq[string]
  IGCVersion_570 = object 
    name*:string
    methods*: seq[string]
  AsyncIGCVersion_570 =  object 
    name*:string
    methods*: seq[string]
  IGCVersion_583950 = object 
    name*:string
    methods*: seq[string]
  AsyncIGCVersion_583950 =  object 
    name*:string
    methods*: seq[string]
  IGCVersion_730 = object 
    name*:string
    methods*: seq[string]
  AsyncIGCVersion_730 =  object 
    name*:string
    methods*: seq[string]
  IPortal2Leaderboards_620 = object 
    name*:string
    methods*: seq[string]
  AsyncIPortal2Leaderboards_620 =  object 
    name*:string
    methods*: seq[string]
  ISteamApps = object 
    name*:string
    methods*: seq[string]
  AsyncISteamApps =  object 
    name*:string
    methods*: seq[string]
  ISteamBroadcast = object 
    name*:string
    methods*: seq[string]
  AsyncISteamBroadcast =  object 
    name*:string
    methods*: seq[string]
  ISteamDirectory = object 
    name*:string
    methods*: seq[string]
  AsyncISteamDirectory =  object 
    name*:string
    methods*: seq[string]
  ISteamNews = object 
    name*:string
    methods*: seq[string]
  AsyncISteamNews =  object 
    name*:string
    methods*: seq[string]
  ISteamRemoteStorage = object 
    name*:string
    methods*: seq[string]
  AsyncISteamRemoteStorage =  object 
    name*:string
    methods*: seq[string]
  ISteamUserAuth = object 
    name*:string
    methods*: seq[string]
  AsyncISteamUserAuth =  object 
    name*:string
    methods*: seq[string]
  ISteamUserOAuth = object 
    name*:string
    methods*: seq[string]
  AsyncISteamUserOAuth =  object 
    name*:string
    methods*: seq[string]
  ISteamUserStats = object 
    name*:string
    methods*: seq[string]
  AsyncISteamUserStats =  object 
    name*:string
    methods*: seq[string]
  ISteamWebAPIUtil = object 
    name*:string
    methods*: seq[string]
  AsyncISteamWebAPIUtil =  object 
    name*:string
    methods*: seq[string]
  ISteamWebUserPresenceOAuth = object 
    name*:string
    methods*: seq[string]
  AsyncISteamWebUserPresenceOAuth =  object 
    name*:string
    methods*: seq[string]
  ITFSystem_440 = object 
    name*:string
    methods*: seq[string]
  AsyncITFSystem_440 =  object 
    name*:string
    methods*: seq[string]
  IBroadcastService = object 
    name*:string
    methods*: seq[string]
  AsyncIBroadcastService =  object 
    name*:string
    methods*: seq[string]
  IContentServerDirectoryService = object 
    name*:string
    methods*: seq[string]
  AsyncIContentServerDirectoryService =  object 
    name*:string
    methods*: seq[string]
  IPublishedFileService = object 
    name*:string
    methods*: seq[string]
  AsyncIPublishedFileService =  object 
    name*:string
    methods*: seq[string]
  IPlayerService = object 
    name*:string
    methods*: seq[string]
  AsyncIPlayerService =  object 
    name*:string
    methods*: seq[string]
  IGameNotificationsService = object 
    name*:string
    methods*: seq[string]
  AsyncIGameNotificationsService =  object 
    name*:string
    methods*: seq[string]
  IHelpRequestLogsService = object 
    name*:string
    methods*: seq[string]
  AsyncIHelpRequestLogsService =  object 
    name*:string
    methods*: seq[string]

proc newSteamWebAPI*():SteamWebAPI=
  result.IClientStats_1046930.name = "IClientStats_1046930"
  result.IClientStats_1046930.methods.add("ReportEvent:V1")
  result.IGCVersion_1046930.name = "IGCVersion_1046930"
  result.IGCVersion_1046930.methods.add("GetClientVersion:V1")
  result.IGCVersion_1046930.methods.add("GetServerVersion:V1")
  result.IGCVersion_1269260.name = "IGCVersion_1269260"
  result.IGCVersion_1269260.methods.add("GetClientVersion:V1")
  result.IGCVersion_1269260.methods.add("GetServerVersion:V1")
  result.IGCVersion_205790.name = "IGCVersion_205790"
  result.IGCVersion_205790.methods.add("GetClientVersion:V1")
  result.IGCVersion_205790.methods.add("GetServerVersion:V1")
  result.IGCVersion_440.name = "IGCVersion_440"
  result.IGCVersion_440.methods.add("GetClientVersion:V1")
  result.IGCVersion_440.methods.add("GetServerVersion:V1")
  result.IGCVersion_570.name = "IGCVersion_570"
  result.IGCVersion_570.methods.add("GetClientVersion:V1")
  result.IGCVersion_570.methods.add("GetServerVersion:V1")
  result.IGCVersion_583950.name = "IGCVersion_583950"
  result.IGCVersion_583950.methods.add("GetClientVersion:V1")
  result.IGCVersion_583950.methods.add("GetServerVersion:V1")
  result.IGCVersion_730.name = "IGCVersion_730"
  result.IGCVersion_730.methods.add("GetServerVersion:V1")
  result.IPortal2Leaderboards_620.name = "IPortal2Leaderboards_620"
  result.IPortal2Leaderboards_620.methods.add("GetBucketizedData:V1")
  result.ISteamApps.name = "ISteamApps"
  result.ISteamApps.methods.add("GetAppList:V1")
  result.ISteamApps.methods.add("GetAppList:V2")
  result.ISteamApps.methods.add("GetSDRConfig:V1")
  result.ISteamApps.methods.add("GetServersAtAddress:V1")
  result.ISteamApps.methods.add("UpToDateCheck:V1")
  result.ISteamBroadcast.name = "ISteamBroadcast"
  result.ISteamBroadcast.methods.add("ViewerHeartbeat:V1")
  result.ISteamDirectory.name = "ISteamDirectory"
  result.ISteamDirectory.methods.add("GetCMList:V1")
  result.ISteamDirectory.methods.add("GetCMListForConnect:V1")
  result.ISteamDirectory.methods.add("GetSteamPipeDomains:V1")
  result.ISteamNews.name = "ISteamNews"
  result.ISteamNews.methods.add("GetNewsForApp:V1")
  result.ISteamNews.methods.add("GetNewsForApp:V2")
  result.ISteamRemoteStorage.name = "ISteamRemoteStorage"
  result.ISteamRemoteStorage.methods.add("GetCollectionDetails:V1")
  result.ISteamRemoteStorage.methods.add("GetPublishedFileDetails:V1")
  result.ISteamUserAuth.name = "ISteamUserAuth"
  result.ISteamUserAuth.methods.add("AuthenticateUser:V1")
  result.ISteamUserOAuth.name = "ISteamUserOAuth"
  result.ISteamUserOAuth.methods.add("GetTokenDetails:V1")
  result.ISteamUserStats.name = "ISteamUserStats"
  result.ISteamUserStats.methods.add("GetGlobalAchievementPercentagesForApp:V1")
  result.ISteamUserStats.methods.add("GetGlobalAchievementPercentagesForApp:V2")
  result.ISteamUserStats.methods.add("GetGlobalStatsForGame:V1")
  result.ISteamUserStats.methods.add("GetNumberOfCurrentPlayers:V1")
  result.ISteamWebAPIUtil.name = "ISteamWebAPIUtil"
  result.ISteamWebAPIUtil.methods.add("GetServerInfo:V1")
  result.ISteamWebAPIUtil.methods.add("GetSupportedAPIList:V1")
  result.ISteamWebUserPresenceOAuth.name = "ISteamWebUserPresenceOAuth"
  result.ISteamWebUserPresenceOAuth.methods.add("PollStatus:V1")
  result.ITFSystem_440.name = "ITFSystem_440"
  result.ITFSystem_440.methods.add("GetWorldStatus:V1")
  result.IBroadcastService.name = "IBroadcastService"
  result.IBroadcastService.methods.add("PostGameDataFrameRTMP:V1")
  result.IContentServerDirectoryService.name = "IContentServerDirectoryService"
  result.IContentServerDirectoryService.methods.add("GetServersForSteamPipe:V1")
  result.IContentServerDirectoryService.methods.add("GetClientUpdateHosts:V1")
  result.IContentServerDirectoryService.methods.add("GetDepotPatchInfo:V1")
  result.IPublishedFileService.name = "IPublishedFileService"
  result.IPublishedFileService.methods.add("GetUserVoteSummary:V1")
  result.IPlayerService.name = "IPlayerService"
  result.IPlayerService.methods.add("RecordOfflinePlaytime:V1")
  result.IGameNotificationsService.name = "IGameNotificationsService"
  result.IGameNotificationsService.methods.add("UserCreateSession:V1")
  result.IGameNotificationsService.methods.add("UserUpdateSession:V1")
  result.IGameNotificationsService.methods.add("UserDeleteSession:V1")
  result.IHelpRequestLogsService.name = "IHelpRequestLogsService"
  result.IHelpRequestLogsService.methods.add("UploadUserApplicationLog:V1")
  result.IHelpRequestLogsService.methods.add("GetApplicationLogDemand:V1")
  return result


proc newAsyncSteamWebAPI*():AsyncSteamWebAPI=
  result.IClientStats_1046930.name = "IClientStats_1046930"
  result.IClientStats_1046930.methods.add("ReportEvent:V1")
  result.IGCVersion_1046930.name = "IGCVersion_1046930"
  result.IGCVersion_1046930.methods.add("GetClientVersion:V1")
  result.IGCVersion_1046930.methods.add("GetServerVersion:V1")
  result.IGCVersion_1269260.name = "IGCVersion_1269260"
  result.IGCVersion_1269260.methods.add("GetClientVersion:V1")
  result.IGCVersion_1269260.methods.add("GetServerVersion:V1")
  result.IGCVersion_205790.name = "IGCVersion_205790"
  result.IGCVersion_205790.methods.add("GetClientVersion:V1")
  result.IGCVersion_205790.methods.add("GetServerVersion:V1")
  result.IGCVersion_440.name = "IGCVersion_440"
  result.IGCVersion_440.methods.add("GetClientVersion:V1")
  result.IGCVersion_440.methods.add("GetServerVersion:V1")
  result.IGCVersion_570.name = "IGCVersion_570"
  result.IGCVersion_570.methods.add("GetClientVersion:V1")
  result.IGCVersion_570.methods.add("GetServerVersion:V1")
  result.IGCVersion_583950.name = "IGCVersion_583950"
  result.IGCVersion_583950.methods.add("GetClientVersion:V1")
  result.IGCVersion_583950.methods.add("GetServerVersion:V1")
  result.IGCVersion_730.name = "IGCVersion_730"
  result.IGCVersion_730.methods.add("GetServerVersion:V1")
  result.IPortal2Leaderboards_620.name = "IPortal2Leaderboards_620"
  result.IPortal2Leaderboards_620.methods.add("GetBucketizedData:V1")
  result.ISteamApps.name = "ISteamApps"
  result.ISteamApps.methods.add("GetAppList:V1")
  result.ISteamApps.methods.add("GetAppList:V2")
  result.ISteamApps.methods.add("GetSDRConfig:V1")
  result.ISteamApps.methods.add("GetServersAtAddress:V1")
  result.ISteamApps.methods.add("UpToDateCheck:V1")
  result.ISteamBroadcast.name = "ISteamBroadcast"
  result.ISteamBroadcast.methods.add("ViewerHeartbeat:V1")
  result.ISteamDirectory.name = "ISteamDirectory"
  result.ISteamDirectory.methods.add("GetCMList:V1")
  result.ISteamDirectory.methods.add("GetCMListForConnect:V1")
  result.ISteamDirectory.methods.add("GetSteamPipeDomains:V1")
  result.ISteamNews.name = "ISteamNews"
  result.ISteamNews.methods.add("GetNewsForApp:V1")
  result.ISteamNews.methods.add("GetNewsForApp:V2")
  result.ISteamRemoteStorage.name = "ISteamRemoteStorage"
  result.ISteamRemoteStorage.methods.add("GetCollectionDetails:V1")
  result.ISteamRemoteStorage.methods.add("GetPublishedFileDetails:V1")
  result.ISteamUserAuth.name = "ISteamUserAuth"
  result.ISteamUserAuth.methods.add("AuthenticateUser:V1")
  result.ISteamUserOAuth.name = "ISteamUserOAuth"
  result.ISteamUserOAuth.methods.add("GetTokenDetails:V1")
  result.ISteamUserStats.name = "ISteamUserStats"
  result.ISteamUserStats.methods.add("GetGlobalAchievementPercentagesForApp:V1")
  result.ISteamUserStats.methods.add("GetGlobalAchievementPercentagesForApp:V2")
  result.ISteamUserStats.methods.add("GetGlobalStatsForGame:V1")
  result.ISteamUserStats.methods.add("GetNumberOfCurrentPlayers:V1")
  result.ISteamWebAPIUtil.name = "ISteamWebAPIUtil"
  result.ISteamWebAPIUtil.methods.add("GetServerInfo:V1")
  result.ISteamWebAPIUtil.methods.add("GetSupportedAPIList:V1")
  result.ISteamWebUserPresenceOAuth.name = "ISteamWebUserPresenceOAuth"
  result.ISteamWebUserPresenceOAuth.methods.add("PollStatus:V1")
  result.ITFSystem_440.name = "ITFSystem_440"
  result.ITFSystem_440.methods.add("GetWorldStatus:V1")
  result.IBroadcastService.name = "IBroadcastService"
  result.IBroadcastService.methods.add("PostGameDataFrameRTMP:V1")
  result.IContentServerDirectoryService.name = "IContentServerDirectoryService"
  result.IContentServerDirectoryService.methods.add("GetServersForSteamPipe:V1")
  result.IContentServerDirectoryService.methods.add("GetClientUpdateHosts:V1")
  result.IContentServerDirectoryService.methods.add("GetDepotPatchInfo:V1")
  result.IPublishedFileService.name = "IPublishedFileService"
  result.IPublishedFileService.methods.add("GetUserVoteSummary:V1")
  result.IPlayerService.name = "IPlayerService"
  result.IPlayerService.methods.add("RecordOfflinePlaytime:V1")
  result.IGameNotificationsService.name = "IGameNotificationsService"
  result.IGameNotificationsService.methods.add("UserCreateSession:V1")
  result.IGameNotificationsService.methods.add("UserUpdateSession:V1")
  result.IGameNotificationsService.methods.add("UserDeleteSession:V1")
  result.IHelpRequestLogsService.name = "IHelpRequestLogsService"
  result.IHelpRequestLogsService.methods.add("UploadUserApplicationLog:V1")
  result.IHelpRequestLogsService.methods.add("GetApplicationLogDemand:V1")
  return result


proc newParam(name:string, value:string):Param=
  result.name=name
  result.value=value

proc prm2get(s:seq[Param]):string =
  if s.len>0:
    for i in countup(0,s.len-1):
      result.add((if i==0:"?"else:"&")&s[i].name&"="&encodeUrl(s[i].value))

proc prm2post(s:seq[Param]):string=
  if s.len>0:
    for i in countup(0,s.len-1):
      result.add((if i==0:""else:"&")&s[i].name&"="&encodeUrl(s[i].value)) 

proc `ReportEventV1`*(interfacename: IClientStats_1046930): string = 
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/ReportEvent/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url) 

proc `GetClientVersionV1`*(interfacename: IGCVersion_1046930): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: IGCVersion_1046930): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: IGCVersion_1269260): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: IGCVersion_1269260): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: IGCVersion_205790): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: IGCVersion_205790): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: IGCVersion_440): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: IGCVersion_440): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: IGCVersion_570): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: IGCVersion_570): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: IGCVersion_583950): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: IGCVersion_583950): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: IGCVersion_730): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetBucketizedDataV1`*(interfacename: IPortal2Leaderboards_620, `leaderboardName`=none(string)): string = 
  ## `leaderboardName` : string — (Required) The leaderboard name to fetch data for.
  var params: seq[Param]
  if `leaderboardName`.isSome(): 
    params.add(newParam("leaderboardName", $leaderboardName))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetBucketizedData/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetAppListV1`*(interfacename: ISteamApps): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetAppList/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetAppListV2`*(interfacename: ISteamApps): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetAppList/v2/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetSDRConfigV1`*(interfacename: ISteamApps, `appid`=none(uint32)): string = 
  ## `appid` : uint32 — (Required) AppID of game
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetSDRConfig/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetServersAtAddressV1`*(interfacename: ISteamApps, `addr`=none(string)): string = 
  ## `addr` : string — (Required) IP or IP:queryport to list
  var params: seq[Param]
  if `addr`.isSome(): 
    params.add(newParam("addr", $addr))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServersAtAddress/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `UpToDateCheckV1`*(interfacename: ISteamApps, `appid`=none(uint32), `version`=none(uint32)): string = 
  ## `appid` : uint32 — (Required) AppID of game
  ## `version` : uint32 — (Required) The installed version of the game
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `version`.isSome(): 
    params.add(newParam("version", $version))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/UpToDateCheck/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `ViewerHeartbeatV1`*(interfacename: ISteamBroadcast, `steamid`=none(uint64), `sessionid`=none(uint64), `token`=none(uint64), `stream`=none(int32)): string = 
  ## `steamid` : uint64 — (Required) Steam ID of the broadcaster
  ## `sessionid` : uint64 — (Required) Broadcast Session ID
  ## `token` : uint64 — (Required) Viewer token
  ## `stream` : int32 — (Optional) video stream representation watching
  var params: seq[Param]
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `sessionid`.isSome(): 
    params.add(newParam("sessionid", $sessionid))
  if `token`.isSome(): 
    params.add(newParam("token", $token))
  if `stream`.isSome(): 
    params.add(newParam("stream", $stream))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/ViewerHeartbeat/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetCMListV1`*(interfacename: ISteamDirectory, `cellid`=none(uint32), `maxcount`=none(uint32)): string = 
  ## `cellid` : uint32 — (Required) Client's Steam cell ID
  ## `maxcount` : uint32 — (Optional) Max number of servers to return
  var params: seq[Param]
  if `cellid`.isSome(): 
    params.add(newParam("cellid", $cellid))
  if `maxcount`.isSome(): 
    params.add(newParam("maxcount", $maxcount))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetCMList/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetCMListForConnectV1`*(interfacename: ISteamDirectory, `cellid`=none(uint32), `cmtype`=none(string), `realm`=none(string), `maxcount`=none(uint32)): string = 
  ## `cellid` : uint32 — (Optional) Client's Steam cell ID, uses IP location if blank
  ## `cmtype` : string — (Optional) Optional CM type filter
  ## `realm` : string — (Optional) Optional Steam Realm filter
  ## `maxcount` : uint32 — (Optional) Max number of servers to return
  var params: seq[Param]
  if `cellid`.isSome(): 
    params.add(newParam("cellid", $cellid))
  if `cmtype`.isSome(): 
    params.add(newParam("cmtype", $cmtype))
  if `realm`.isSome(): 
    params.add(newParam("realm", $realm))
  if `maxcount`.isSome(): 
    params.add(newParam("maxcount", $maxcount))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetCMListForConnect/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetSteamPipeDomainsV1`*(interfacename: ISteamDirectory): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetSteamPipeDomains/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetNewsForAppV1`*(interfacename: ISteamNews, `appid`=none(uint32), `maxlength`=none(uint32), `enddate`=none(uint32), `count`=none(uint32), `tags`=none(string)): string = 
  ## `appid` : uint32 — (Required) AppID to retrieve news for
  ## `maxlength` : uint32 — (Optional) Maximum length for the content to return, if this is 0 the full content is returned, if it's less then a blurb is generated to fit.
  ## `enddate` : uint32 — (Optional) Retrieve posts earlier than this date (unix epoch timestamp)
  ## `count` : uint32 — (Optional) # of posts to retrieve (default 20)
  ## `tags` : string — (Optional) Comma-separated list of tags to filter by (e.g. 'patchnodes')
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `maxlength`.isSome(): 
    params.add(newParam("maxlength", $maxlength))
  if `enddate`.isSome(): 
    params.add(newParam("enddate", $enddate))
  if `count`.isSome(): 
    params.add(newParam("count", $count))
  if `tags`.isSome(): 
    params.add(newParam("tags", $tags))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetNewsForApp/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetNewsForAppV2`*(interfacename: ISteamNews, `appid`=none(uint32), `maxlength`=none(uint32), `enddate`=none(uint32), `count`=none(uint32), `feeds`=none(string), `tags`=none(string)): string = 
  ## `appid` : uint32 — (Required) AppID to retrieve news for
  ## `maxlength` : uint32 — (Optional) Maximum length for the content to return, if this is 0 the full content is returned, if it's less then a blurb is generated to fit.
  ## `enddate` : uint32 — (Optional) Retrieve posts earlier than this date (unix epoch timestamp)
  ## `count` : uint32 — (Optional) # of posts to retrieve (default 20)
  ## `feeds` : string — (Optional) Comma-separated list of feed names to return news for
  ## `tags` : string — (Optional) Comma-separated list of tags to filter by (e.g. 'patchnodes')
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `maxlength`.isSome(): 
    params.add(newParam("maxlength", $maxlength))
  if `enddate`.isSome(): 
    params.add(newParam("enddate", $enddate))
  if `count`.isSome(): 
    params.add(newParam("count", $count))
  if `feeds`.isSome(): 
    params.add(newParam("feeds", $feeds))
  if `tags`.isSome(): 
    params.add(newParam("tags", $tags))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetNewsForApp/v2/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetCollectionDetailsV1`*(interfacename: ISteamRemoteStorage, `collectioncount`=none(uint32), `publishedfileids`=none(seq[uint64])): string = 
  ## `collectioncount` : uint32 — (Required) Number of collections being requested
  ## `publishedfileids` : seq[uint64] — (Required) collection ids to get the details for
  var params: seq[Param]
  if `collectioncount`.isSome(): 
    params.add(newParam("collectioncount", $collectioncount))
  if `publishedfileids`.isSome() and `publishedfileids`.get().len>0: 
    for key, value in `publishedfileids`.get():
      params.add(newParam("publishedfileids[" & $key & "]",$(`publishedfileids`.get()[key])))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetCollectionDetails/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `GetPublishedFileDetailsV1`*(interfacename: ISteamRemoteStorage, `itemcount`=none(uint32), `publishedfileids`=none(seq[uint64])): string = 
  ## `itemcount` : uint32 — (Required) Number of items being requested
  ## `publishedfileids` : seq[uint64] — (Required) published file id to look up
  var params: seq[Param]
  if `itemcount`.isSome(): 
    params.add(newParam("itemcount", $itemcount))
  if `publishedfileids`.isSome() and `publishedfileids`.get().len>0: 
    for key, value in `publishedfileids`.get():
      params.add(newParam("publishedfileids[" & $key & "]",$(`publishedfileids`.get()[key])))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetPublishedFileDetails/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `AuthenticateUserV1`*(interfacename: ISteamUserAuth, `steamid`=none(uint64), `sessionkey`=none(Rawbinary), `encrypted_loginkey`=none(Rawbinary)): string = 
  ## `steamid` : uint64 — (Required) Should be the users steamid, unencrypted.
  ## `sessionkey` : Rawbinary — (Required) Should be a 32 byte random blob of data, which is then encrypted with RSA using the Steam system's public key.  Randomness is important here for security.
  ## `encrypted_loginkey` : Rawbinary — (Required) Should be the users hashed loginkey, AES encrypted with the sessionkey.
  var params: seq[Param]
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `sessionkey`.isSome(): 
    params.add(newParam("sessionkey", $sessionkey))
  if `encrypted_loginkey`.isSome(): 
    params.add(newParam("encrypted_loginkey", $encrypted_loginkey))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/AuthenticateUser/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `GetTokenDetailsV1`*(interfacename: ISteamUserOAuth, `access_token`=none(string)): string = 
  ## `access_token` : string — (Required) OAuth2 token for which to return details
  var params: seq[Param]
  if `access_token`.isSome(): 
    params.add(newParam("access_token", $access_token))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetTokenDetails/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetGlobalAchievementPercentagesForAppV1`*(interfacename: ISteamUserStats, `gameid`=none(uint64)): string = 
  ## `gameid` : uint64 — (Required) GameID to retrieve the achievement percentages for
  var params: seq[Param]
  if `gameid`.isSome(): 
    params.add(newParam("gameid", $gameid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetGlobalAchievementPercentagesForApp/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetGlobalAchievementPercentagesForAppV2`*(interfacename: ISteamUserStats, `gameid`=none(uint64)): string = 
  ## `gameid` : uint64 — (Required) GameID to retrieve the achievement percentages for
  var params: seq[Param]
  if `gameid`.isSome(): 
    params.add(newParam("gameid", $gameid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetGlobalAchievementPercentagesForApp/v2/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetGlobalStatsForGameV1`*(interfacename: ISteamUserStats, `appid`=none(uint32), `count`=none(uint32), `name`=none(seq[string]), `startdate`=none(uint32), `enddate`=none(uint32)): string = 
  ## `appid` : uint32 — (Required) AppID that we're getting global stats for
  ## `count` : uint32 — (Required) Number of stats get data for
  ## `name` : seq[string] — (Required) Names of stat to get data for
  ## `startdate` : uint32 — (Optional) Start date for daily totals (unix epoch timestamp)
  ## `enddate` : uint32 — (Optional) End date for daily totals (unix epoch timestamp)
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `count`.isSome(): 
    params.add(newParam("count", $count))
  if `name`.isSome() and `name`.get().len>0: 
    for key, value in `name`.get():
      params.add(newParam("name[" & $key & "]",$(`name`.get()[key])))
  if `startdate`.isSome(): 
    params.add(newParam("startdate", $startdate))
  if `enddate`.isSome(): 
    params.add(newParam("enddate", $enddate))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetGlobalStatsForGame/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetNumberOfCurrentPlayersV1`*(interfacename: ISteamUserStats, `appid`=none(uint32)): string = 
  ## `appid` : uint32 — (Required) AppID that we're getting user count for
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetNumberOfCurrentPlayers/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetServerInfoV1`*(interfacename: ISteamWebAPIUtil): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerInfo/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetSupportedAPIListV1`*(interfacename: ISteamWebAPIUtil, `key`=none(string)): string = 
  ## `key` : string — (Optional) access key
  var params: seq[Param]
  if `key`.isSome(): 
    params.add(newParam("key", $key))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetSupportedAPIList/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `PollStatusV1`*(interfacename: ISteamWebUserPresenceOAuth, `steamid`=none(string), `umqid`=none(uint64), `message`=none(uint32), `pollid`=none(uint32), `sectimeout`=none(uint32), `secidletime`=none(uint32), `use_accountids`=none(uint32)): string = 
  ## `steamid` : string — (Required) Steam ID of the user
  ## `umqid` : uint64 — (Required) UMQ Session ID
  ## `message` : uint32 — (Required) Message that was last known to the user
  ## `pollid` : uint32 — (Optional) Caller-specific poll id
  ## `sectimeout` : uint32 — (Optional) Long-poll timeout in seconds
  ## `secidletime` : uint32 — (Optional) How many seconds is client considering itself idle, e.g. screen is off
  ## `use_accountids` : uint32 — (Optional) Boolean, 0 (default): return steamid_from in output, 1: return accountid_from
  var params: seq[Param]
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `umqid`.isSome(): 
    params.add(newParam("umqid", $umqid))
  if `message`.isSome(): 
    params.add(newParam("message", $message))
  if `pollid`.isSome(): 
    params.add(newParam("pollid", $pollid))
  if `sectimeout`.isSome(): 
    params.add(newParam("sectimeout", $sectimeout))
  if `secidletime`.isSome(): 
    params.add(newParam("secidletime", $secidletime))
  if `use_accountids`.isSome(): 
    params.add(newParam("use_accountids", $use_accountids))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/PollStatus/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `GetWorldStatusV1`*(interfacename: ITFSystem_440): string = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetWorldStatus/v1/"
  var client = newHttpClient()
  return client.getContent(url) 

proc `PostGameDataFrameRTMPV1`*(interfacename: IBroadcastService, `appid`=none(uint32), `steamid`=none(uint64), `rtmp_token`=none(string), `frame_data`=none(string)): string = 
  ## Add a game meta data frame to broadcast from a client. Uses RTMP token for validation
  ## `appid` : uint32 — (Required) AppID of the game being broadcasted
  ## `steamid` : uint64 — (Required) Broadcasters SteamID
  ## `rtmp_token` : string — (Required) Valid RTMP token for the Broadcaster
  ## `frame_data` : string — (Required) game data frame expressing current state of game (string, zipped, whatever)
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `rtmp_token`.isSome(): 
    params.add(newParam("rtmp_token", $rtmp_token))
  if `frame_data`.isSome(): 
    params.add(newParam("frame_data", $frame_data))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/PostGameDataFrameRTMP/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `GetServersForSteamPipeV1`*(interfacename: IContentServerDirectoryService, `cell_id`=none(uint32), `max_servers`=none(uint32), `ip_override`=none(string), `launcher_type`=none(int32), `ipv6_public`=none(string)): string = 
  ## `cell_id` : uint32 — (Required) client Cell ID
  ## `max_servers` : uint32 — (Optional) max servers in response list
  ## `ip_override` : string — (Optional) client IP address
  ## `launcher_type` : int32 — (Optional) launcher type
  ## `ipv6_public` : string — (Optional) client public ipv6 address if it knows it
  var params: seq[Param]
  if `cell_id`.isSome(): 
    params.add(newParam("cell_id", $cell_id))
  if `max_servers`.isSome(): 
    params.add(newParam("max_servers", $max_servers))
  if `ip_override`.isSome(): 
    params.add(newParam("ip_override", $ip_override))
  if `launcher_type`.isSome(): 
    params.add(newParam("launcher_type", $launcher_type))
  if `ipv6_public`.isSome(): 
    params.add(newParam("ipv6_public", $ipv6_public))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServersForSteamPipe/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetClientUpdateHostsV1`*(interfacename: IContentServerDirectoryService, `cached_signature`=none(string)): string = 
  ## `cached_signature` : string — (Required) 
  var params: seq[Param]
  if `cached_signature`.isSome(): 
    params.add(newParam("cached_signature", $cached_signature))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientUpdateHosts/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetDepotPatchInfoV1`*(interfacename: IContentServerDirectoryService, `appid`=none(uint32), `depotid`=none(uint32), `source_manifestid`=none(uint64), `target_manifestid`=none(uint64)): string = 
  ## `appid` : uint32 — (Required) 
  ## `depotid` : uint32 — (Required) 
  ## `source_manifestid` : uint64 — (Required) 
  ## `target_manifestid` : uint64 — (Required) 
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `depotid`.isSome(): 
    params.add(newParam("depotid", $depotid))
  if `source_manifestid`.isSome(): 
    params.add(newParam("source_manifestid", $source_manifestid))
  if `target_manifestid`.isSome(): 
    params.add(newParam("target_manifestid", $target_manifestid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetDepotPatchInfo/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `GetUserVoteSummaryV1`*(interfacename: IPublishedFileService, `publishedfileids`=none(uint64)): string = 
  ## Get user vote summary
  ## `publishedfileids` : uint64 — (Required) 
  var params: seq[Param]
  if `publishedfileids`.isSome(): 
    params.add(newParam("publishedfileids", $publishedfileids))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetUserVoteSummary/v1/"&prm2get(params)
  var client = newHttpClient()
  return client.getContent(url) 

proc `RecordOfflinePlaytimeV1`*(interfacename: IPlayerService, `steamid`=none(uint64), `ticket`=none(string), `play_sessions`=none(Message)): string = 
  ## Tracks playtime for a user when they are offline
  ## `steamid` : uint64 — (Required) 
  ## `ticket` : string — (Required) 
  ## `play_sessions` : Message — (Required) 
  var params: seq[Param]
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `ticket`.isSome(): 
    params.add(newParam("ticket", $ticket))
  if `play_sessions`.isSome(): 
    params.add(newParam("play_sessions", $play_sessions))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/RecordOfflinePlaytime/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `UserCreateSessionV1`*(interfacename: IGameNotificationsService, `appid`=none(uint32), `context`=none(uint64), `title`=none(Message), `users`=none(Message), `steamid`=none(uint64)): string = 
  ## Creates an async game session
  ## `appid` : uint32 — (Required) The appid to create the session for.
  ## `context` : uint64 — (Required) Game-specified context value the game can used to associate the session with some object on their backend.
  ## `title` : Message — (Required) The title of the session to be displayed within each user's list of sessions.
  ## `users` : Message — (Required) The initial state of all users in the session.
  ## `steamid` : uint64 — (Required) (Optional) steamid to make the request on behalf of -- if specified, the user must be in the session and all users being added to the session must be friends with the user.
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `context`.isSome(): 
    params.add(newParam("context", $context))
  if `title`.isSome(): 
    params.add(newParam("title", $title))
  if `users`.isSome(): 
    params.add(newParam("users", $users))
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/UserCreateSession/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `UserUpdateSessionV1`*(interfacename: IGameNotificationsService, `sessionid`=none(uint64), `appid`=none(uint32), `title`=none(Message), `users`=none(Message), `steamid`=none(uint64)): string = 
  ## Updates an async game session
  ## `sessionid` : uint64 — (Required) The sessionid to update.
  ## `appid` : uint32 — (Required) The appid of the session to update.
  ## `title` : Message — (Required) (Optional) The new title of the session.  If not specified, the title will not be changed.
  ## `users` : Message — (Required) (Optional) A list of users whose state will be updated to reflect the given state. If the users are not already in the session, they will be added to it.
  ## `steamid` : uint64 — (Required) (Optional) steamid to make the request on behalf of -- if specified, the user must be in the session and all users being added to the session must be friends with the user.
  var params: seq[Param]
  if `sessionid`.isSome(): 
    params.add(newParam("sessionid", $sessionid))
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `title`.isSome(): 
    params.add(newParam("title", $title))
  if `users`.isSome(): 
    params.add(newParam("users", $users))
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/UserUpdateSession/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `UserDeleteSessionV1`*(interfacename: IGameNotificationsService, `sessionid`=none(uint64), `appid`=none(uint32), `steamid`=none(uint64)): string = 
  ## Deletes an async game session
  ## `sessionid` : uint64 — (Required) The sessionid to delete.
  ## `appid` : uint32 — (Required) The appid of the session to delete.
  ## `steamid` : uint64 — (Required) (Optional) steamid to make the request on behalf of -- if specified, the user must be in the session.
  var params: seq[Param]
  if `sessionid`.isSome(): 
    params.add(newParam("sessionid", $sessionid))
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/UserDeleteSession/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `UploadUserApplicationLogV1`*(interfacename: IHelpRequestLogsService, `appid`=none(uint32), `log_type`=none(string), `version_string`=none(string), `log_contents`=none(string), `request_id`=none(uint64)): string = 
  ## User uploading application logs
  ## `appid` : uint32 — (Required) 
  ## `log_type` : string — (Required) 
  ## `version_string` : string — (Required) 
  ## `log_contents` : string — (Required) 
  ## `request_id` : uint64 — (Required) 
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `log_type`.isSome(): 
    params.add(newParam("log_type", $log_type))
  if `version_string`.isSome(): 
    params.add(newParam("version_string", $version_string))
  if `log_contents`.isSome(): 
    params.add(newParam("log_contents", $log_contents))
  if `request_id`.isSome(): 
    params.add(newParam("request_id", $request_id))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/UploadUserApplicationLog/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `GetApplicationLogDemandV1`*(interfacename: IHelpRequestLogsService, `appid`=none(uint32)): string = 
  ## Returns whether the server would like the user to upload logs
  ## `appid` : uint32 — (Required) 
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetApplicationLogDemand/v1/"
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return client.postContent(url, body = body) 

proc `ReportEventV1`*(interfacename: AsyncIClientStats_1046930): Future[string] {.async.} = 
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/ReportEvent/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url) 

proc `GetClientVersionV1`*(interfacename: AsyncIGCVersion_1046930): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: AsyncIGCVersion_1046930): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: AsyncIGCVersion_1269260): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: AsyncIGCVersion_1269260): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: AsyncIGCVersion_205790): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: AsyncIGCVersion_205790): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: AsyncIGCVersion_440): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: AsyncIGCVersion_440): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: AsyncIGCVersion_570): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: AsyncIGCVersion_570): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetClientVersionV1`*(interfacename: AsyncIGCVersion_583950): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: AsyncIGCVersion_583950): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetServerVersionV1`*(interfacename: AsyncIGCVersion_730): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerVersion/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetBucketizedDataV1`*(interfacename: AsyncIPortal2Leaderboards_620, `leaderboardName`=none(string)): Future[string] {.async.} = 
  ## `leaderboardName` : string — (Required) The leaderboard name to fetch data for.
  var params: seq[Param]
  if `leaderboardName`.isSome(): 
    params.add(newParam("leaderboardName", $leaderboardName))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetBucketizedData/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetAppListV1`*(interfacename: AsyncISteamApps): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetAppList/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetAppListV2`*(interfacename: AsyncISteamApps): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetAppList/v2/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetSDRConfigV1`*(interfacename: AsyncISteamApps, `appid`=none(uint32)): Future[string] {.async.} = 
  ## `appid` : uint32 — (Required) AppID of game
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetSDRConfig/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetServersAtAddressV1`*(interfacename: AsyncISteamApps, `addr`=none(string)): Future[string] {.async.} = 
  ## `addr` : string — (Required) IP or IP:queryport to list
  var params: seq[Param]
  if `addr`.isSome(): 
    params.add(newParam("addr", $addr))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServersAtAddress/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `UpToDateCheckV1`*(interfacename: AsyncISteamApps, `appid`=none(uint32), `version`=none(uint32)): Future[string] {.async.} = 
  ## `appid` : uint32 — (Required) AppID of game
  ## `version` : uint32 — (Required) The installed version of the game
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `version`.isSome(): 
    params.add(newParam("version", $version))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/UpToDateCheck/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `ViewerHeartbeatV1`*(interfacename: AsyncISteamBroadcast, `steamid`=none(uint64), `sessionid`=none(uint64), `token`=none(uint64), `stream`=none(int32)): Future[string] {.async.} = 
  ## `steamid` : uint64 — (Required) Steam ID of the broadcaster
  ## `sessionid` : uint64 — (Required) Broadcast Session ID
  ## `token` : uint64 — (Required) Viewer token
  ## `stream` : int32 — (Optional) video stream representation watching
  var params: seq[Param]
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `sessionid`.isSome(): 
    params.add(newParam("sessionid", $sessionid))
  if `token`.isSome(): 
    params.add(newParam("token", $token))
  if `stream`.isSome(): 
    params.add(newParam("stream", $stream))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/ViewerHeartbeat/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetCMListV1`*(interfacename: AsyncISteamDirectory, `cellid`=none(uint32), `maxcount`=none(uint32)): Future[string] {.async.} = 
  ## `cellid` : uint32 — (Required) Client's Steam cell ID
  ## `maxcount` : uint32 — (Optional) Max number of servers to return
  var params: seq[Param]
  if `cellid`.isSome(): 
    params.add(newParam("cellid", $cellid))
  if `maxcount`.isSome(): 
    params.add(newParam("maxcount", $maxcount))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetCMList/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetCMListForConnectV1`*(interfacename: AsyncISteamDirectory, `cellid`=none(uint32), `cmtype`=none(string), `realm`=none(string), `maxcount`=none(uint32)): Future[string] {.async.} = 
  ## `cellid` : uint32 — (Optional) Client's Steam cell ID, uses IP location if blank
  ## `cmtype` : string — (Optional) Optional CM type filter
  ## `realm` : string — (Optional) Optional Steam Realm filter
  ## `maxcount` : uint32 — (Optional) Max number of servers to return
  var params: seq[Param]
  if `cellid`.isSome(): 
    params.add(newParam("cellid", $cellid))
  if `cmtype`.isSome(): 
    params.add(newParam("cmtype", $cmtype))
  if `realm`.isSome(): 
    params.add(newParam("realm", $realm))
  if `maxcount`.isSome(): 
    params.add(newParam("maxcount", $maxcount))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetCMListForConnect/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetSteamPipeDomainsV1`*(interfacename: AsyncISteamDirectory): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetSteamPipeDomains/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetNewsForAppV1`*(interfacename: AsyncISteamNews, `appid`=none(uint32), `maxlength`=none(uint32), `enddate`=none(uint32), `count`=none(uint32), `tags`=none(string)): Future[string] {.async.} = 
  ## `appid` : uint32 — (Required) AppID to retrieve news for
  ## `maxlength` : uint32 — (Optional) Maximum length for the content to return, if this is 0 the full content is returned, if it's less then a blurb is generated to fit.
  ## `enddate` : uint32 — (Optional) Retrieve posts earlier than this date (unix epoch timestamp)
  ## `count` : uint32 — (Optional) # of posts to retrieve (default 20)
  ## `tags` : string — (Optional) Comma-separated list of tags to filter by (e.g. 'patchnodes')
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `maxlength`.isSome(): 
    params.add(newParam("maxlength", $maxlength))
  if `enddate`.isSome(): 
    params.add(newParam("enddate", $enddate))
  if `count`.isSome(): 
    params.add(newParam("count", $count))
  if `tags`.isSome(): 
    params.add(newParam("tags", $tags))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetNewsForApp/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetNewsForAppV2`*(interfacename: AsyncISteamNews, `appid`=none(uint32), `maxlength`=none(uint32), `enddate`=none(uint32), `count`=none(uint32), `feeds`=none(string), `tags`=none(string)): Future[string] {.async.} = 
  ## `appid` : uint32 — (Required) AppID to retrieve news for
  ## `maxlength` : uint32 — (Optional) Maximum length for the content to return, if this is 0 the full content is returned, if it's less then a blurb is generated to fit.
  ## `enddate` : uint32 — (Optional) Retrieve posts earlier than this date (unix epoch timestamp)
  ## `count` : uint32 — (Optional) # of posts to retrieve (default 20)
  ## `feeds` : string — (Optional) Comma-separated list of feed names to return news for
  ## `tags` : string — (Optional) Comma-separated list of tags to filter by (e.g. 'patchnodes')
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `maxlength`.isSome(): 
    params.add(newParam("maxlength", $maxlength))
  if `enddate`.isSome(): 
    params.add(newParam("enddate", $enddate))
  if `count`.isSome(): 
    params.add(newParam("count", $count))
  if `feeds`.isSome(): 
    params.add(newParam("feeds", $feeds))
  if `tags`.isSome(): 
    params.add(newParam("tags", $tags))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetNewsForApp/v2/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetCollectionDetailsV1`*(interfacename: AsyncISteamRemoteStorage, `collectioncount`=none(uint32), `publishedfileids`=none(seq[uint64])): Future[string] {.async.} = 
  ## `collectioncount` : uint32 — (Required) Number of collections being requested
  ## `publishedfileids` : seq[uint64] — (Required) collection ids to get the details for
  var params: seq[Param]
  if `collectioncount`.isSome(): 
    params.add(newParam("collectioncount", $collectioncount))
  if `publishedfileids`.isSome() and `publishedfileids`.get().len>0: 
    for key, value in `publishedfileids`.get():
      params.add(newParam("publishedfileids[" & $key & "]",$(`publishedfileids`.get()[key])))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetCollectionDetails/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `GetPublishedFileDetailsV1`*(interfacename: AsyncISteamRemoteStorage, `itemcount`=none(uint32), `publishedfileids`=none(seq[uint64])): Future[string] {.async.} = 
  ## `itemcount` : uint32 — (Required) Number of items being requested
  ## `publishedfileids` : seq[uint64] — (Required) published file id to look up
  var params: seq[Param]
  if `itemcount`.isSome(): 
    params.add(newParam("itemcount", $itemcount))
  if `publishedfileids`.isSome() and `publishedfileids`.get().len>0: 
    for key, value in `publishedfileids`.get():
      params.add(newParam("publishedfileids[" & $key & "]",$(`publishedfileids`.get()[key])))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetPublishedFileDetails/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `AuthenticateUserV1`*(interfacename: AsyncISteamUserAuth, `steamid`=none(uint64), `sessionkey`=none(Rawbinary), `encrypted_loginkey`=none(Rawbinary)): Future[string] {.async.} = 
  ## `steamid` : uint64 — (Required) Should be the users steamid, unencrypted.
  ## `sessionkey` : Rawbinary — (Required) Should be a 32 byte random blob of data, which is then encrypted with RSA using the Steam system's public key.  Randomness is important here for security.
  ## `encrypted_loginkey` : Rawbinary — (Required) Should be the users hashed loginkey, AES encrypted with the sessionkey.
  var params: seq[Param]
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `sessionkey`.isSome(): 
    params.add(newParam("sessionkey", $sessionkey))
  if `encrypted_loginkey`.isSome(): 
    params.add(newParam("encrypted_loginkey", $encrypted_loginkey))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/AuthenticateUser/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `GetTokenDetailsV1`*(interfacename: AsyncISteamUserOAuth, `access_token`=none(string)): Future[string] {.async.} = 
  ## `access_token` : string — (Required) OAuth2 token for which to return details
  var params: seq[Param]
  if `access_token`.isSome(): 
    params.add(newParam("access_token", $access_token))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetTokenDetails/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetGlobalAchievementPercentagesForAppV1`*(interfacename: AsyncISteamUserStats, `gameid`=none(uint64)): Future[string] {.async.} = 
  ## `gameid` : uint64 — (Required) GameID to retrieve the achievement percentages for
  var params: seq[Param]
  if `gameid`.isSome(): 
    params.add(newParam("gameid", $gameid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetGlobalAchievementPercentagesForApp/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetGlobalAchievementPercentagesForAppV2`*(interfacename: AsyncISteamUserStats, `gameid`=none(uint64)): Future[string] {.async.} = 
  ## `gameid` : uint64 — (Required) GameID to retrieve the achievement percentages for
  var params: seq[Param]
  if `gameid`.isSome(): 
    params.add(newParam("gameid", $gameid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetGlobalAchievementPercentagesForApp/v2/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetGlobalStatsForGameV1`*(interfacename: AsyncISteamUserStats, `appid`=none(uint32), `count`=none(uint32), `name`=none(seq[string]), `startdate`=none(uint32), `enddate`=none(uint32)): Future[string] {.async.} = 
  ## `appid` : uint32 — (Required) AppID that we're getting global stats for
  ## `count` : uint32 — (Required) Number of stats get data for
  ## `name` : seq[string] — (Required) Names of stat to get data for
  ## `startdate` : uint32 — (Optional) Start date for daily totals (unix epoch timestamp)
  ## `enddate` : uint32 — (Optional) End date for daily totals (unix epoch timestamp)
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `count`.isSome(): 
    params.add(newParam("count", $count))
  if `name`.isSome() and `name`.get().len>0: 
    for key, value in `name`.get():
      params.add(newParam("name[" & $key & "]",$(`name`.get()[key])))
  if `startdate`.isSome(): 
    params.add(newParam("startdate", $startdate))
  if `enddate`.isSome(): 
    params.add(newParam("enddate", $enddate))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetGlobalStatsForGame/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetNumberOfCurrentPlayersV1`*(interfacename: AsyncISteamUserStats, `appid`=none(uint32)): Future[string] {.async.} = 
  ## `appid` : uint32 — (Required) AppID that we're getting user count for
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetNumberOfCurrentPlayers/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetServerInfoV1`*(interfacename: AsyncISteamWebAPIUtil): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServerInfo/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetSupportedAPIListV1`*(interfacename: AsyncISteamWebAPIUtil, `key`=none(string)): Future[string] {.async.} = 
  ## `key` : string — (Optional) access key
  var params: seq[Param]
  if `key`.isSome(): 
    params.add(newParam("key", $key))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetSupportedAPIList/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `PollStatusV1`*(interfacename: AsyncISteamWebUserPresenceOAuth, `steamid`=none(string), `umqid`=none(uint64), `message`=none(uint32), `pollid`=none(uint32), `sectimeout`=none(uint32), `secidletime`=none(uint32), `use_accountids`=none(uint32)): Future[string] {.async.} = 
  ## `steamid` : string — (Required) Steam ID of the user
  ## `umqid` : uint64 — (Required) UMQ Session ID
  ## `message` : uint32 — (Required) Message that was last known to the user
  ## `pollid` : uint32 — (Optional) Caller-specific poll id
  ## `sectimeout` : uint32 — (Optional) Long-poll timeout in seconds
  ## `secidletime` : uint32 — (Optional) How many seconds is client considering itself idle, e.g. screen is off
  ## `use_accountids` : uint32 — (Optional) Boolean, 0 (default): return steamid_from in output, 1: return accountid_from
  var params: seq[Param]
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `umqid`.isSome(): 
    params.add(newParam("umqid", $umqid))
  if `message`.isSome(): 
    params.add(newParam("message", $message))
  if `pollid`.isSome(): 
    params.add(newParam("pollid", $pollid))
  if `sectimeout`.isSome(): 
    params.add(newParam("sectimeout", $sectimeout))
  if `secidletime`.isSome(): 
    params.add(newParam("secidletime", $secidletime))
  if `use_accountids`.isSome(): 
    params.add(newParam("use_accountids", $use_accountids))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/PollStatus/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `GetWorldStatusV1`*(interfacename: AsyncITFSystem_440): Future[string] {.async.} = 
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetWorldStatus/v1/"
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `PostGameDataFrameRTMPV1`*(interfacename: AsyncIBroadcastService, `appid`=none(uint32), `steamid`=none(uint64), `rtmp_token`=none(string), `frame_data`=none(string)): Future[string] {.async.} = 
  ## Add a game meta data frame to broadcast from a client. Uses RTMP token for validation
  ## `appid` : uint32 — (Required) AppID of the game being broadcasted
  ## `steamid` : uint64 — (Required) Broadcasters SteamID
  ## `rtmp_token` : string — (Required) Valid RTMP token for the Broadcaster
  ## `frame_data` : string — (Required) game data frame expressing current state of game (string, zipped, whatever)
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `rtmp_token`.isSome(): 
    params.add(newParam("rtmp_token", $rtmp_token))
  if `frame_data`.isSome(): 
    params.add(newParam("frame_data", $frame_data))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/PostGameDataFrameRTMP/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `GetServersForSteamPipeV1`*(interfacename: AsyncIContentServerDirectoryService, `cell_id`=none(uint32), `max_servers`=none(uint32), `ip_override`=none(string), `launcher_type`=none(int32), `ipv6_public`=none(string)): Future[string] {.async.} = 
  ## `cell_id` : uint32 — (Required) client Cell ID
  ## `max_servers` : uint32 — (Optional) max servers in response list
  ## `ip_override` : string — (Optional) client IP address
  ## `launcher_type` : int32 — (Optional) launcher type
  ## `ipv6_public` : string — (Optional) client public ipv6 address if it knows it
  var params: seq[Param]
  if `cell_id`.isSome(): 
    params.add(newParam("cell_id", $cell_id))
  if `max_servers`.isSome(): 
    params.add(newParam("max_servers", $max_servers))
  if `ip_override`.isSome(): 
    params.add(newParam("ip_override", $ip_override))
  if `launcher_type`.isSome(): 
    params.add(newParam("launcher_type", $launcher_type))
  if `ipv6_public`.isSome(): 
    params.add(newParam("ipv6_public", $ipv6_public))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetServersForSteamPipe/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetClientUpdateHostsV1`*(interfacename: AsyncIContentServerDirectoryService, `cached_signature`=none(string)): Future[string] {.async.} = 
  ## `cached_signature` : string — (Required) 
  var params: seq[Param]
  if `cached_signature`.isSome(): 
    params.add(newParam("cached_signature", $cached_signature))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetClientUpdateHosts/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetDepotPatchInfoV1`*(interfacename: AsyncIContentServerDirectoryService, `appid`=none(uint32), `depotid`=none(uint32), `source_manifestid`=none(uint64), `target_manifestid`=none(uint64)): Future[string] {.async.} = 
  ## `appid` : uint32 — (Required) 
  ## `depotid` : uint32 — (Required) 
  ## `source_manifestid` : uint64 — (Required) 
  ## `target_manifestid` : uint64 — (Required) 
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `depotid`.isSome(): 
    params.add(newParam("depotid", $depotid))
  if `source_manifestid`.isSome(): 
    params.add(newParam("source_manifestid", $source_manifestid))
  if `target_manifestid`.isSome(): 
    params.add(newParam("target_manifestid", $target_manifestid))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetDepotPatchInfo/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `GetUserVoteSummaryV1`*(interfacename: AsyncIPublishedFileService, `publishedfileids`=none(uint64)): Future[string] {.async.} = 
  ## Get user vote summary
  ## `publishedfileids` : uint64 — (Required) 
  var params: seq[Param]
  if `publishedfileids`.isSome(): 
    params.add(newParam("publishedfileids", $publishedfileids))
  ## HTTP METHOD GET
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetUserVoteSummary/v1/"&prm2get(params)
  var client = newAsyncHttpClient()
  return await client.getContent(url) 

proc `RecordOfflinePlaytimeV1`*(interfacename: AsyncIPlayerService, `steamid`=none(uint64), `ticket`=none(string), `play_sessions`=none(Message)): Future[string] {.async.} = 
  ## Tracks playtime for a user when they are offline
  ## `steamid` : uint64 — (Required) 
  ## `ticket` : string — (Required) 
  ## `play_sessions` : Message — (Required) 
  var params: seq[Param]
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  if `ticket`.isSome(): 
    params.add(newParam("ticket", $ticket))
  if `play_sessions`.isSome(): 
    params.add(newParam("play_sessions", $play_sessions))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/RecordOfflinePlaytime/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `UserCreateSessionV1`*(interfacename: AsyncIGameNotificationsService, `appid`=none(uint32), `context`=none(uint64), `title`=none(Message), `users`=none(Message), `steamid`=none(uint64)): Future[string] {.async.} = 
  ## Creates an async game session
  ## `appid` : uint32 — (Required) The appid to create the session for.
  ## `context` : uint64 — (Required) Game-specified context value the game can used to associate the session with some object on their backend.
  ## `title` : Message — (Required) The title of the session to be displayed within each user's list of sessions.
  ## `users` : Message — (Required) The initial state of all users in the session.
  ## `steamid` : uint64 — (Required) (Optional) steamid to make the request on behalf of -- if specified, the user must be in the session and all users being added to the session must be friends with the user.
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `context`.isSome(): 
    params.add(newParam("context", $context))
  if `title`.isSome(): 
    params.add(newParam("title", $title))
  if `users`.isSome(): 
    params.add(newParam("users", $users))
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/UserCreateSession/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `UserUpdateSessionV1`*(interfacename: AsyncIGameNotificationsService, `sessionid`=none(uint64), `appid`=none(uint32), `title`=none(Message), `users`=none(Message), `steamid`=none(uint64)): Future[string] {.async.} = 
  ## Updates an async game session
  ## `sessionid` : uint64 — (Required) The sessionid to update.
  ## `appid` : uint32 — (Required) The appid of the session to update.
  ## `title` : Message — (Required) (Optional) The new title of the session.  If not specified, the title will not be changed.
  ## `users` : Message — (Required) (Optional) A list of users whose state will be updated to reflect the given state. If the users are not already in the session, they will be added to it.
  ## `steamid` : uint64 — (Required) (Optional) steamid to make the request on behalf of -- if specified, the user must be in the session and all users being added to the session must be friends with the user.
  var params: seq[Param]
  if `sessionid`.isSome(): 
    params.add(newParam("sessionid", $sessionid))
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `title`.isSome(): 
    params.add(newParam("title", $title))
  if `users`.isSome(): 
    params.add(newParam("users", $users))
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/UserUpdateSession/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `UserDeleteSessionV1`*(interfacename: AsyncIGameNotificationsService, `sessionid`=none(uint64), `appid`=none(uint32), `steamid`=none(uint64)): Future[string] {.async.} = 
  ## Deletes an async game session
  ## `sessionid` : uint64 — (Required) The sessionid to delete.
  ## `appid` : uint32 — (Required) The appid of the session to delete.
  ## `steamid` : uint64 — (Required) (Optional) steamid to make the request on behalf of -- if specified, the user must be in the session.
  var params: seq[Param]
  if `sessionid`.isSome(): 
    params.add(newParam("sessionid", $sessionid))
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `steamid`.isSome(): 
    params.add(newParam("steamid", $steamid))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/UserDeleteSession/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `UploadUserApplicationLogV1`*(interfacename: AsyncIHelpRequestLogsService, `appid`=none(uint32), `log_type`=none(string), `version_string`=none(string), `log_contents`=none(string), `request_id`=none(uint64)): Future[string] {.async.} = 
  ## User uploading application logs
  ## `appid` : uint32 — (Required) 
  ## `log_type` : string — (Required) 
  ## `version_string` : string — (Required) 
  ## `log_contents` : string — (Required) 
  ## `request_id` : uint64 — (Required) 
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  if `log_type`.isSome(): 
    params.add(newParam("log_type", $log_type))
  if `version_string`.isSome(): 
    params.add(newParam("version_string", $version_string))
  if `log_contents`.isSome(): 
    params.add(newParam("log_contents", $log_contents))
  if `request_id`.isSome(): 
    params.add(newParam("request_id", $request_id))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/UploadUserApplicationLog/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 

proc `GetApplicationLogDemandV1`*(interfacename: AsyncIHelpRequestLogsService, `appid`=none(uint32)): Future[string] {.async.} = 
  ## Returns whether the server would like the user to upload logs
  ## `appid` : uint32 — (Required) 
  var params: seq[Param]
  if `appid`.isSome(): 
    params.add(newParam("appid", $appid))
  let body = prm2post(params)
  ## HTTP METHOD POST
  let url = WEBAPI_BASE_URL & interfacename.name & "/GetApplicationLogDemand/v1/"
  var client = newAsyncHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" }) 
  return await client.postContent(url, body = body) 