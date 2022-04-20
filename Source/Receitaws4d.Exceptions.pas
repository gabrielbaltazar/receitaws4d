unit Receitaws4d.Exceptions;

interface

uses
  System.JSON,
  System.SysUtils;

type
  EReceitaws4dException = class(Exception)
  private
    FStatusCode: Integer;
    FStatusText: String;
    FContent: string;
    FJSONValue: TJSONValue;

  public
    property StatusCode: Integer read FStatusCode;
    property StatusText: String read FStatusText;
    property Content: string read FContent;
    property JSONValue: TJSONValue read FJSONValue;

    constructor create(AStatusCode: Integer; AStatusText, AContent: String; AJSON: TJSONValue);
    destructor Destroy; override;
  end;

implementation

{ EReceitaws4dException }

constructor EReceitaws4dException.create(AStatusCode: Integer; AStatusText, AContent: String; AJSON: TJSONValue);
begin
  FStatusCode := AStatusCode;
  FStatusText := AStatusText;
  FContent := AContent;

  Self.Message := Format('%s %s: %s', [FStatusCode.ToString,
                                       FStatusText,
                                       FContent]);

  if Assigned(AJSON) then
    FJSONValue := AJSON.Clone as TJSONValue;
end;

destructor EReceitaws4dException.Destroy;
begin
  FJSONValue.Free;
  inherited;
end;

end.
