unit Receitaws4d.Component.RestClient;

interface

uses
  Receitaws4d.Component.Interfaces,
  Receitaws4d.Exceptions,
  REST.Client,
  REST.Types,
  IPPeerCommon,
  IPPeerAPI,
  IPPeerClient,
  System.Classes,
  System.SysUtils,
  System.JSON,
  System.TypInfo;

type TReceitaws4dComponentRestClient = class(TInterfacedObject, IReceitaws4dComponentRequest,
                                                                IReceitaws4dComponentResponse)
  private
    FBaseUrl: String;
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;

    procedure CreateComponents;

  protected
    function BaseUrl(AValue: String): IReceitaws4dComponentRequest;
    function Send: IReceitaws4dComponentResponse;

    function Response: IReceitaws4dComponentResponse;
    function StatusCode: Integer;
    function StatusText: string;
    function GetJSONObject: TJSONObject;

  public
    class function New: IReceitaws4dComponentRequest;
    destructor Destroy; override;

end;

implementation

{ TReceitaws4dComponentRestClient }

function TReceitaws4dComponentRestClient.BaseUrl(AValue: String): IReceitaws4dComponentRequest;
begin
  result := Self;
  FBaseUrl := AValue;
end;

procedure TReceitaws4dComponentRestClient.CreateComponents;
begin
  FreeAndNil(FResponse);
  FreeAndNil(FRequest);
  FreeAndNil(FClient);

  FResponse := TRESTResponse.Create(nil);
  FClient := TRESTClient.Create(nil);
  FClient.SynchronizedEvents := False;
  FClient.RaiseExceptionOn500 := False;

  FRequest := TRESTRequest.Create(nil);
  FRequest.SynchronizedEvents := False;

  FRequest.Client := FClient;
  FRequest.Response := FResponse;
end;

destructor TReceitaws4dComponentRestClient.Destroy;
begin
  FreeAndNil(FResponse);
  FreeAndNil(FRequest);
  FreeAndNil(FClient);
  inherited;
end;

function TReceitaws4dComponentRestClient.GetJSONObject: TJSONObject;
begin
  result := nil;
  if Assigned(FResponse) then
    result := TJSONObject(FResponse.JSONValue);
end;

class function TReceitaws4dComponentRestClient.New: IReceitaws4dComponentRequest;
begin
  result := Self.Create;
end;

function TReceitaws4dComponentRestClient.Response: IReceitaws4dComponentResponse;
begin
  result := Self;
end;

function TReceitaws4dComponentRestClient.Send: IReceitaws4dComponentResponse;
begin
  result := Self;
  CreateComponents;

  FClient.BaseURL := FBaseUrl;
  FRequest.Method := rmGET;
  FRequest.Execute;

  if FResponse.StatusCode >= 400 then
    raise EReceitaws4dException.Create(StatusCode, StatusText, FResponse.Content, FResponse.JSONValue);
end;

function TReceitaws4dComponentRestClient.StatusCode: Integer;
begin
  result := 0;
  if Assigned(FResponse) then
    result := FResponse.StatusCode;
end;

function TReceitaws4dComponentRestClient.StatusText: string;
begin
  result := EmptyStr;
  if Assigned(FResponse) then
    result := FResponse.StatusText;
end;

end.
