unit Receitaws4d.Model.Atividade;

interface

uses
  Receitaws4d.Model.Interfaces;

type TReceitaws4dModelAtividade = class(TInterfacedObject, IReceitaws4dModelAtividade)

  private
    FCodigo: String;
    FDescricao: string;

  protected
    function Codigo(AValue: String): IReceitaws4dModelAtividade; overload;
    function Codigo: String; overload;

    function Descricao(AValue: String): IReceitaws4dModelAtividade; overload;
    function Descricao: String; overload;

  public
    class function New: IReceitaws4dModelAtividade;
end;

implementation

{ TReceitaws4dModelAtividade }

function TReceitaws4dModelAtividade.Codigo(AValue: String): IReceitaws4dModelAtividade;
begin
  result := Self;
  FCodigo := AValue;
end;

function TReceitaws4dModelAtividade.Codigo: String;
begin
  result := FCodigo;
end;

function TReceitaws4dModelAtividade.Descricao: String;
begin
  result := FDescricao;
end;

function TReceitaws4dModelAtividade.Descricao(AValue: String): IReceitaws4dModelAtividade;
begin
  result := Self;
  FDescricao := AValue;
end;

class function TReceitaws4dModelAtividade.New: IReceitaws4dModelAtividade;
begin
  result := Self.Create;
end;

end.
