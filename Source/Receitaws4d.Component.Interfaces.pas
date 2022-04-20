unit Receitaws4d.Component.Interfaces;

interface

uses
  System.JSON;

type
  IReceitaws4dComponentResponse = interface;

  IReceitaws4dComponentRequest = interface
    ['{3CF514B7-C24D-4D40-A236-515EC567AEE4}']
    function BaseUrl(AValue: String): IReceitaws4dComponentRequest;
    function Send: IReceitaws4dComponentResponse;

    function Response: IReceitaws4dComponentResponse;
  end;

  IReceitaws4dComponentResponse = interface
    ['{648E3C39-0476-4310-91D2-61E0BDAF4E66}']
    function StatusCode: Integer;
    function StatusText: string;
    function GetJSONObject: TJSONObject;
  end;

function GetComponent: IReceitaws4dComponentRequest;

implementation

uses
  Receitaws4d.Component.RestClient;

function GetComponent: IReceitaws4dComponentRequest;
begin
  result := TReceitaws4dComponentRestClient.New;
end;

end.
