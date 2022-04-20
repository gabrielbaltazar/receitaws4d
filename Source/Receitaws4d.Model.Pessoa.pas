unit Receitaws4d.Model.Pessoa;

interface

uses
  Receitaws4d.Model.Interfaces,
  Receitaws4d.Model.Atividade;

type TReceitaws4dModelPessoa = class(TInterfacedObject, IReceitaws4dModelPessoa)

  private
    FNome: string;
    FNomeFantasia: string;
    FCNPJ: string;
    FUltimaAtualizacao: TDateTime;
    FTipo: String;
    FPorte: string;
    FNaturezaJuridica: String;
    FLogradouro: String;
    FNumero: string;
    FComplemento: String;
    FCep: String;
    FDataAbertura: TDateTime;
    FBairro: String;
    FMunicipio: String;
    FUF: String;
    FEmail: String;
    FTelefone: String;
    FEfr: String;
    FSituacao: string;
    FDataSituacao: TDateTime;
    FMotivoSituacao: String;
    FSituacaoEspecial: String;
    FDataSituacaoEspecial: TDateTime;
    FCapitalSocial: Currency;
    FAtividadePrincipal: IReceitaws4dModelAtividade;
    FAtividadesSecundarias: IReceitaws4dIterator<IReceitaws4dModelAtividade>;
    FSocios: IReceitaws4dIterator<IReceitaws4dModelSocio>;

  protected
    function Nome: String; overload;
    function Nome(AValue: String): IReceitaws4dModelPessoa; overload;

    function NomeFantasia: string; overload;
    function NomeFantasia(AValue: string): IReceitaws4dModelPessoa; overload;

    function CNPJ: string; overload;
    function CNPJ(AValue: string): IReceitaws4dModelPessoa; overload;

    function UltimaAtualizacao: TDateTime; overload;
    function UltimaAtualizacao(AValue: TDateTime): IReceitaws4dModelPessoa; overload;

    function Tipo: String; overload;
    function Tipo(AValue: String): IReceitaws4dModelPessoa; overload;

    function Porte: string; overload;
    function Porte(AValue: string): IReceitaws4dModelPessoa; overload;

    function DataAbertura: TDateTime; overload;
    function DataAbertura(AValue: TDateTime): IReceitaws4dModelPessoa; overload;

    function NaturezaJuridica: String; overload;
    function NaturezaJuridica(AValue: String): IReceitaws4dModelPessoa; overload;

    function Logradouro: String; overload;
    function Logradouro(AValue: String): IReceitaws4dModelPessoa; overload;

    function Numero: string; overload;
    function Numero(AValue: string): IReceitaws4dModelPessoa; overload;

    function Complemento: String; overload;
    function Complemento(AValue: String): IReceitaws4dModelPessoa; overload;

    function Cep: String; overload;
    function Cep(AValue: String): IReceitaws4dModelPessoa; overload;

    function Bairro: String; overload;
    function Bairro(AValue: String): IReceitaws4dModelPessoa; overload;

    function Municipio: String; overload;
    function Municipio(AValue: String): IReceitaws4dModelPessoa; overload;

    function UF: String; overload;
    function UF(AValue: String): IReceitaws4dModelPessoa; overload;

    function Email: String; overload;
    function Email(AValue: String): IReceitaws4dModelPessoa; overload;

    function Telefone: String; overload;
    function Telefone(AValue: String): IReceitaws4dModelPessoa; overload;

    function Efr: String; overload;
    function Efr(AValue: String): IReceitaws4dModelPessoa; overload;

    function Situacao: string; overload;
    function Situacao(AValue: string): IReceitaws4dModelPessoa; overload;

    function DataSituacao: TDateTime; overload;
    function DataSituacao(AValue: TDateTime): IReceitaws4dModelPessoa; overload;

    function MotivoSituacao: String; overload;
    function MotivoSituacao(AValue: String): IReceitaws4dModelPessoa; overload;

    function SituacaoEspecial: String; overload;
    function SituacaoEspecial(AValue: String): IReceitaws4dModelPessoa; overload;

    function DataSituacaoEspecial: TDateTime; overload;
    function DataSituacaoEspecial(AValue: TDateTime): IReceitaws4dModelPessoa; overload;

    function CapitalSocial: Currency; overload;
    function CapitalSocial(AValue: Currency): IReceitaws4dModelPessoa; overload;

    function AtividadePrincipal: IReceitaws4dModelAtividade;

    function AtividadesSecundarias: IReceitaws4dIterator<IReceitaws4dModelAtividade>; overload;
    function AtividadesSecundarias(AValue: IReceitaws4dIterator<IReceitaws4dModelAtividade>): IReceitaws4dModelPessoa; overload;

    function Socios: IReceitaws4dIterator<IReceitaws4dModelSocio>; overload;
    function Socios(AValue: IReceitaws4dIterator<IReceitaws4dModelSocio>): IReceitaws4dModelPessoa; overload;

  public
    constructor create;
    class function New: IReceitaws4dModelPessoa;
end;

implementation

{ TReceitaws4dModelPessoa }

function TReceitaws4dModelPessoa.AtividadePrincipal: IReceitaws4dModelAtividade;
begin
  result := FAtividadePrincipal;
end;

function TReceitaws4dModelPessoa.AtividadesSecundarias: IReceitaws4dIterator<IReceitaws4dModelAtividade>;
begin
  result := FAtividadesSecundarias;
end;

function TReceitaws4dModelPessoa.AtividadesSecundarias(AValue: IReceitaws4dIterator<IReceitaws4dModelAtividade>): IReceitaws4dModelPessoa;
begin
  result := Self;
  FAtividadesSecundarias := AValue;
end;

function TReceitaws4dModelPessoa.Bairro(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FBairro := AValue;
end;

function TReceitaws4dModelPessoa.Bairro: String;
begin
  result := FBairro;
end;

function TReceitaws4dModelPessoa.CapitalSocial: Currency;
begin
  result := FCapitalSocial;
end;

function TReceitaws4dModelPessoa.CapitalSocial(AValue: Currency): IReceitaws4dModelPessoa;
begin
  result := Self;
  FCapitalSocial := AValue;
end;

function TReceitaws4dModelPessoa.Cep: String;
begin
  result := FCep;
end;

function TReceitaws4dModelPessoa.Cep(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FCep := AValue;
end;

function TReceitaws4dModelPessoa.CNPJ(AValue: string): IReceitaws4dModelPessoa;
begin
  result := Self;
  FCNPJ := AValue;
end;

function TReceitaws4dModelPessoa.CNPJ: string;
begin
  result := FCNPJ;
end;

function TReceitaws4dModelPessoa.Complemento(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FComplemento := AValue;
end;

function TReceitaws4dModelPessoa.Complemento: String;
begin
  result := FComplemento;
end;

constructor TReceitaws4dModelPessoa.create;
begin
  FAtividadePrincipal := TReceitaws4dModelAtividade.New;
end;

function TReceitaws4dModelPessoa.DataAbertura: TDateTime;
begin
  result := FDataAbertura;
end;

function TReceitaws4dModelPessoa.DataAbertura(AValue: TDateTime): IReceitaws4dModelPessoa;
begin
  result := Self;
  FDataAbertura := AValue;
end;

function TReceitaws4dModelPessoa.DataSituacao(AValue: TDateTime): IReceitaws4dModelPessoa;
begin
  result := Self;
  FDataSituacao := AValue;
end;

function TReceitaws4dModelPessoa.DataSituacao: TDateTime;
begin
  result := FDataSituacao;
end;

function TReceitaws4dModelPessoa.DataSituacaoEspecial: TDateTime;
begin
  result := FDataSituacaoEspecial;
end;

function TReceitaws4dModelPessoa.DataSituacaoEspecial(AValue: TDateTime): IReceitaws4dModelPessoa;
begin
  result := Self;
  FDataSituacaoEspecial := AValue;
end;

function TReceitaws4dModelPessoa.Efr(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FEfr := AValue;
end;

function TReceitaws4dModelPessoa.Efr: String;
begin
  result := FEfr;
end;

function TReceitaws4dModelPessoa.Email: String;
begin
  Result := FEmail;
end;

function TReceitaws4dModelPessoa.Email(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FEmail := AValue;
end;

function TReceitaws4dModelPessoa.Logradouro: String;
begin
  result := FLogradouro;
end;

function TReceitaws4dModelPessoa.Logradouro(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FLogradouro := AValue;
end;

function TReceitaws4dModelPessoa.MotivoSituacao: String;
begin
  result := FMotivoSituacao;
end;

function TReceitaws4dModelPessoa.MotivoSituacao(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FMotivoSituacao := AValue;
end;

function TReceitaws4dModelPessoa.Municipio(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FMunicipio := AValue;
end;

function TReceitaws4dModelPessoa.Municipio: String;
begin
  result := FMunicipio;
end;

function TReceitaws4dModelPessoa.NaturezaJuridica(AValue: String): IReceitaws4dModelPessoa;
begin
  Result := Self;
  FNaturezaJuridica := AValue;
end;

function TReceitaws4dModelPessoa.NaturezaJuridica: String;
begin
  Result := FNaturezaJuridica;
end;

class function TReceitaws4dModelPessoa.New: IReceitaws4dModelPessoa;
begin
  result := Self.create;
end;

function TReceitaws4dModelPessoa.Nome(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FNome := AValue;
end;

function TReceitaws4dModelPessoa.Nome: String;
begin
  result := FNome;
end;

function TReceitaws4dModelPessoa.NomeFantasia(AValue: string): IReceitaws4dModelPessoa;
begin
  result := Self;
  FNomeFantasia := AValue;
end;

function TReceitaws4dModelPessoa.NomeFantasia: string;
begin
  result := FNomeFantasia;
end;

function TReceitaws4dModelPessoa.Numero(AValue: string): IReceitaws4dModelPessoa;
begin
  result := Self;
  FNumero := AValue;
end;

function TReceitaws4dModelPessoa.Numero: string;
begin
  result := FNumero;
end;

function TReceitaws4dModelPessoa.Porte: string;
begin
  result := FPorte;
end;

function TReceitaws4dModelPessoa.Porte(AValue: string): IReceitaws4dModelPessoa;
begin
  result := Self;
  FPorte := AValue;
end;

function TReceitaws4dModelPessoa.Situacao: string;
begin
  result := FSituacao;
end;

function TReceitaws4dModelPessoa.Situacao(AValue: string): IReceitaws4dModelPessoa;
begin
  result := Self;
  FSituacao := AValue;
end;

function TReceitaws4dModelPessoa.SituacaoEspecial: String;
begin
  result := FSituacaoEspecial;
end;

function TReceitaws4dModelPessoa.SituacaoEspecial(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FSituacaoEspecial := AValue;
end;

function TReceitaws4dModelPessoa.Socios(AValue: IReceitaws4dIterator<IReceitaws4dModelSocio>): IReceitaws4dModelPessoa;
begin
  result := Self;
  FSocios := AValue;
end;

function TReceitaws4dModelPessoa.Socios: IReceitaws4dIterator<IReceitaws4dModelSocio>;
begin
  result := FSocios;
end;

function TReceitaws4dModelPessoa.Telefone(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FTelefone := AValue;
end;

function TReceitaws4dModelPessoa.Telefone: String;
begin
  result := FTelefone;
end;

function TReceitaws4dModelPessoa.Tipo: String;
begin
  result := FTipo;
end;

function TReceitaws4dModelPessoa.Tipo(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FTipo := AValue;
end;

function TReceitaws4dModelPessoa.UF: String;
begin
  result := FUF;
end;

function TReceitaws4dModelPessoa.UF(AValue: String): IReceitaws4dModelPessoa;
begin
  result := Self;
  FUF := AValue;
end;

function TReceitaws4dModelPessoa.UltimaAtualizacao: TDateTime;
begin
  result := FUltimaAtualizacao;
end;

function TReceitaws4dModelPessoa.UltimaAtualizacao(AValue: TDateTime): IReceitaws4dModelPessoa;
begin
  result := Self;
  FUltimaAtualizacao := AValue;
end;

end.
