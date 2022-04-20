unit Receitaws4d.Helper.JSON;

interface

uses
  System.SysUtils,
  System.JSON,
  Receitaws4d.Helper.DateTime;

type TReceitaws4dHelperJSONObject = class helper for TJSONObject

  public
    function ValueAsBoolean(AName: string; ADefault: Boolean = false): Boolean;
    function ValueAsString(AName: string; ADefault: string = ''): string;
    function ValueAsInteger(AName: string; ADefault: Integer = 0): Integer;
    function ValueAsFloat(AName: string; ADefault: Double = 0): Double;
    function ValueAsDateTime(AName: string; AFormat: String = 'dd/MM/yyyy'): TDateTime;
    function ValueAsIso8601(AName: string): TDateTime;
    function ValueAsJSONObject(AName: String): TJSONObject;
    function ValueAsJSONArray (AName: String): TJSONArray;
end;

implementation

{ TReceitaws4dHelperJSONObject }

function TReceitaws4dHelperJSONObject.ValueAsBoolean(AName: string; ADefault: Boolean): Boolean;
var
  LStrValue: string;
begin
  result := ADefault;
  if GetValue(AName) <> nil then
  begin
    LStrValue := GetValue(AName).ToString;
    result := not LStrValue.Equals('false');
  end;
end;

function TReceitaws4dHelperJSONObject.ValueAsDateTime(AName, AFormat: String): TDateTime;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName);
  result.fromFormat(LStrValue, AFormat);
end;

function TReceitaws4dHelperJSONObject.ValueAsFloat(AName: string; ADefault: Double): Double;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName, ADefault.ToString);
  LStrValue := LStrValue
                .Replace('.', FormatSettings.DecimalSeparator)
                .Replace(',', FormatSettings.DecimalSeparator);

  result := StrToFloatDef(LStrValue, ADefault);
end;

function TReceitaws4dHelperJSONObject.ValueAsInteger(AName: string; ADefault: Integer): Integer;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName, ADefault.ToString);
  result := StrToIntDef(LStrValue, ADefault);
end;

function TReceitaws4dHelperJSONObject.ValueAsIso8601(AName: string): TDateTime;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName, EmptyStr);
  Result.fromIso8601ToDateTime(LStrValue);
end;

function TReceitaws4dHelperJSONObject.ValueAsJSONArray(AName: String): TJSONArray;
begin
  result := nil;
  if GetValue(AName) is TJSONArray then
    result := TJSONArray( GetValue(AName) );
end;

function TReceitaws4dHelperJSONObject.ValueAsJSONObject(AName: String): TJSONObject;
begin
  result := nil;
  if GetValue(AName) is TJSONObject then
    result := TJSONObject( GetValue(AName) );
end;

function TReceitaws4dHelperJSONObject.ValueAsString(AName, ADefault: string): string;
begin
  result := ADefault;
  if GetValue(AName) <> nil then
    result := GetValue(AName).Value;
end;

end.
