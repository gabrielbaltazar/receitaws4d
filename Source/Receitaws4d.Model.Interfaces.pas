unit Receitaws4d.Model.Interfaces;

interface

type
  IReceitaws4dModelAtividade = interface;
  IReceitaws4dModelSocio = interface;

  IReceitaws4dIterator<T> = interface
    ['{BE80B860-3F8F-4311-A820-38A248BAFEBB}']
    function HasNext: Boolean;
    function Index: Integer;
    function Current: T;
    function First: T;
    function Last: T;
    function Count: Integer;
    function Items(AIndex: Integer): T;
  end;

  IReceitaws4dModelPessoa = interface
    ['{DE36B876-6815-4CEA-B201-A0500B249A58}']
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
  end;

  IReceitaws4dModelAtividade = interface
    ['{28188B58-0AFF-42D9-96D2-99204D13D2E9}']
    function Codigo: String; overload;
    function Codigo(AValue: String): IReceitaws4dModelAtividade; overload;

    function Descricao: String; overload;
    function Descricao(AValue: String): IReceitaws4dModelAtividade; overload;
  end;

  IReceitaws4dModelSocio = interface
    ['{7FA20E6D-58CF-4394-AAEF-F448238025EC}']
    function Nome: String; overload;
    function Nome(AValue: String): IReceitaws4dModelSocio; overload;

    function Qualificacao: String; overload;
    function Qualificacao(AValue: String): IReceitaws4dModelSocio; overload;

    function PaisOrigem: String; overload;
    function PaisOrigem(AValue: String): IReceitaws4dModelSocio; overload;

    function NomeRepresentanteLegal: String; overload;
    function NomeRepresentanteLegal(AValue: String): IReceitaws4dModelSocio; overload;

    function QualificacaoRepresentanteLegal: String; overload;
    function QualificacaoRepresentanteLegal(AValue: String): IReceitaws4dModelSocio; overload;
  end;

implementation

end.
