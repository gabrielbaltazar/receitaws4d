unit Receitaws4d.Model.Socio;

interface

uses
  Receitaws4d.Model.Interfaces;

type TReceitaws4dModelSocio = class(TInterfacedObject, IReceitaws4dModelSocio)

  private
    FNome: String;
    FQualificacao: String;
    FPaisOrigem: String;
    FNomeRepresentanteLegal: String;
    FQualificacaoRepresentanteLegal: String;

  protected
    function Nome(AValue: String): IReceitaws4dModelSocio; overload;
    function Nome: String; overload;

    function Qualificacao(AValue: String): IReceitaws4dModelSocio; overload;
    function Qualificacao: String; overload;

    function PaisOrigem(AValue: String): IReceitaws4dModelSocio; overload;
    function PaisOrigem: String; overload;

    function NomeRepresentanteLegal(AValue: String): IReceitaws4dModelSocio; overload;
    function NomeRepresentanteLegal: String; overload;

    function QualificacaoRepresentanteLegal(AValue: String): IReceitaws4dModelSocio; overload;
    function QualificacaoRepresentanteLegal: String; overload;

  public
    class function New: IReceitaws4dModelSocio;

end;

implementation

{ TReceitaws4dModelSocio }

class function TReceitaws4dModelSocio.New: IReceitaws4dModelSocio;
begin
  result := Self.Create;
end;

function TReceitaws4dModelSocio.Nome: String;
begin
  result := FNome;
end;

function TReceitaws4dModelSocio.Nome(AValue: String): IReceitaws4dModelSocio;
begin
  result := Self;
  FNome := AValue;
end;

function TReceitaws4dModelSocio.NomeRepresentanteLegal(AValue: String): IReceitaws4dModelSocio;
begin
  result := Self;
  FNomeRepresentanteLegal := AValue;
end;

function TReceitaws4dModelSocio.NomeRepresentanteLegal: String;
begin
  Result := FNomeRepresentanteLegal;
end;

function TReceitaws4dModelSocio.PaisOrigem(AValue: String): IReceitaws4dModelSocio;
begin
  result := Self;
  FPaisOrigem := AValue;
end;

function TReceitaws4dModelSocio.PaisOrigem: String;
begin
  result := FPaisOrigem;
end;

function TReceitaws4dModelSocio.Qualificacao: String;
begin
  result := FQualificacao;
end;

function TReceitaws4dModelSocio.Qualificacao(AValue: String): IReceitaws4dModelSocio;
begin
  result := Self;
  FQualificacao := AValue;
end;

function TReceitaws4dModelSocio.QualificacaoRepresentanteLegal: String;
begin
  result := FQualificacaoRepresentanteLegal;
end;

function TReceitaws4dModelSocio.QualificacaoRepresentanteLegal(AValue: String): IReceitaws4dModelSocio;
begin
  result := Self;
  FQualificacao := AValue;
end;

end.
