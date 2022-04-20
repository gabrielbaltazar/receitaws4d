unit Receitaws4d.Model.Iterator;

interface

uses
  Receitaws4d.Model.Interfaces,
  System.SysUtils,
  System.Generics.Collections;

type TReceitaws4dModelIterator<T> = class(TInterfacedObject, IReceitaws4dIterator<T>)

  private
    FList: TList<T>;
    FIndex: Integer;

  protected
    function HasNext: Boolean;
    function Index: Integer;
    function Current: T;
    function First: T;
    function Last: T;
    function Count: Integer;
    function Items(AIndex: Integer): T;

  public
    class function New(AList: TList<T>): IReceitaws4dIterator<T>;
    constructor create(AList: TList<T>);
    destructor Destroy; override;
end;

implementation

{ TReceitaws4dModelIterator<T> }

function TReceitaws4dModelIterator<T>.Count: Integer;
begin
  result := FList.Count;
end;

constructor TReceitaws4dModelIterator<T>.create(AList: TList<T>);
begin
  FList := AList;
  FIndex := -1;
end;

function TReceitaws4dModelIterator<T>.Current: T;
begin
  if FIndex < 0 then
    FIndex := 0;
  result := FList.Items[FIndex];
end;

destructor TReceitaws4dModelIterator<T>.Destroy;
begin
  FList.Free;
  inherited;
end;

function TReceitaws4dModelIterator<T>.First: T;
begin
  FIndex := 0;
  result := FList.Items[FIndex];
end;

function TReceitaws4dModelIterator<T>.HasNext: Boolean;
begin
  FIndex := FIndex + 1;
  result := FList.Count > FIndex;
end;

function TReceitaws4dModelIterator<T>.Index: Integer;
begin
  result := FIndex;
end;

function TReceitaws4dModelIterator<T>.Items(AIndex: Integer): T;
begin
  FIndex := AIndex;
  result := FList.Items[AIndex];
end;

function TReceitaws4dModelIterator<T>.Last: T;
begin
  FIndex := FList.Count - 1;
  result := FList.Last;
end;

class function TReceitaws4dModelIterator<T>.New(AList: TList<T>): IReceitaws4dIterator<T>;
begin
  result := Self.create(AList);
end;

end.
