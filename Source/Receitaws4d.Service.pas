unit Receitaws4d.Service;

interface

uses
  Receitaws4d.Service.Interfaces,
  Receitaws4d.Model.Interfaces,
  Receitaws4d.Model.Pessoa,
  Receitaws4d.Model.Atividade,
  Receitaws4d.Model.Socio,
  Receitaws4d.Model.Iterator,
  Receitaws4d.Component.Interfaces,
  System.SysUtils,
  System.JSON,
  System.Generics.Collections,
  Receitaws4d.Helper.JSON,
  Receitaws4d.Helper.DateTime;

type TReceitaws4dService = class(TInterfacedObject, IReceitaws4dService)

  private
    FCNPJ: string;
    FPessoa: IReceitaws4dModelPessoa;
    FComponent: IReceitaws4dComponentRequest;

    function FormatCNPJ(ACNPJ: String): string;

    procedure ReadFromJSON(AJSON: TJSONObject; AEmpresa: IReceitaws4dModelPessoa);
    procedure ReadAtividadesSecundarias(AJSON: TJSONObject; AEmpresa: IReceitaws4dModelPessoa);
    procedure ReadSocios(AJSON: TJSONObject; AEmpresa: IReceitaws4dModelPessoa);

  protected
    function CNPJ(AValue: String): IReceitaws4dService;

    function Search: IReceitaws4dModelPessoa;
    function Pessoa: IReceitaws4dModelPessoa;

    function Component(AValue: IReceitaws4dComponentRequest): IReceitaws4dService;

  public
    class function New: IReceitaws4dService;
end;

implementation

{ TReceitaws4dService }

function TReceitaws4dService.CNPJ(AValue: String): IReceitaws4dService;
begin
  result := Self;
  FCNPJ := AValue;
end;

function TReceitaws4dService.Component(AValue: IReceitaws4dComponentRequest): IReceitaws4dService;
begin
  result := Self;
  FComponent := AValue;
end;

function TReceitaws4dService.Pessoa: IReceitaws4dModelPessoa;
begin
  if not Assigned(FPessoa) then
    FPessoa := TReceitaws4dModelPessoa.New;
  result := FPessoa;
end;

function TReceitaws4dService.FormatCNPJ(ACNPJ: String): string;
var
  I: Integer;
begin
  result := EmptyStr;
  for I := 1 to ACNPJ.Length do
  begin
    if CharInSet(ACNPJ[i], ['0'..'9']) then
      result := result + ACNPJ[i];
  end;
end;

class function TReceitaws4dService.New: IReceitaws4dService;
begin
  result := Self.Create;
end;

procedure TReceitaws4dService.ReadAtividadesSecundarias(AJSON: TJSONObject; AEmpresa: IReceitaws4dModelPessoa);
var
  LJSON: TJSONObject;
  LJSONArray: TJSONArray;
  LAtividades: TList<IReceitaws4dModelAtividade>;
  I: Integer;
begin
  LJSONArray := AJSON.ValueAsJSONArray('atividades_secundarias');
  if Assigned(LJSONArray) then
  begin
    LAtividades := TList<IReceitaws4dModelAtividade>.create;
    try
      for I := 0 to Pred(LJSONArray.Count) do
      begin
        LJSON := LJSONArray.Items[I] as TJSONObject;
        LAtividades.Add(TReceitaws4dModelAtividade.New);
        LAtividades.Last
          .Codigo(LJSON.ValueAsString('code'))
          .Descricao(LJSON.ValueAsString('text'));
      end;

      AEmpresa.AtividadesSecundarias(
        TReceitaws4dModelIterator<IReceitaws4dModelAtividade>.New(LAtividades));
    except
      LAtividades.Free;
      raise;
    end;
  end;
end;

procedure TReceitaws4dService.ReadFromJSON(AJSON: TJSONObject; AEmpresa: IReceitaws4dModelPessoa);
var
  LJSON: TJSONObject;
  LJSONArray: TJSONArray;
begin
  if not Assigned(AJSON) then
    Exit;

  AEmpresa
    .CNPJ(FormatCNPJ(FCNPJ))
    .Nome(AJSON.ValueAsString('nome'))
    .NomeFantasia(AJSON.ValueAsString('fantasia'))
    .UltimaAtualizacao(AJSON.ValueAsIso8601('ultima_atualizacao'))
    .Tipo(AJSON.ValueAsString('tipo'))
    .Porte(AJSON.ValueAsString('porte'))
    .DataAbertura(AJSON.ValueAsDateTime('abertura'))
    .NaturezaJuridica(AJSON.ValueAsString('natureza_juridica'))
    .Logradouro(AJSON.ValueAsString('logradouro'))
    .Numero(AJSON.ValueAsString('numero'))
    .Complemento(AJSON.ValueAsString('complemento'))
    .Cep(AJSON.ValueAsString('cep'))
    .Bairro(AJSON.ValueAsString('bairro'))
    .Municipio(AJSON.ValueAsString('municipio'))
    .UF(AJSON.ValueAsString('uf'))
    .Email(AJSON.ValueAsString('email'))
    .Telefone(AJSON.ValueAsString('telefone'))
    .Efr(AJSON.ValueAsString('efr'))
    .Situacao(AJSON.ValueAsString('situacao'))
    .DataSituacao(AJSON.ValueAsDateTime('data_situacao'))
    .MotivoSituacao(AJSON.ValueAsString('motivo_situacao'))
    .SituacaoEspecial(AJSON.ValueAsString('situacao_especial'))
    .DataSituacaoEspecial(AJSON.ValueAsDateTime('data_situacao_especial'))
    .CapitalSocial(AJSON.ValueAsFloat('capital_social'));

  LJSONArray := AJSON.ValueAsJSONArray('atividade_principal');
  if (Assigned(LJSONArray)) and (LJSONArray.Count > 0) then
  begin
    LJSON := LJSONArray.Items[0] as TJSONObject;
    AEmpresa.AtividadePrincipal
      .Codigo(LJSON.ValueAsString('code'))
      .Descricao(LJSON.ValueAsString('text'));
  end;

  ReadAtividadesSecundarias(AJSON, AEmpresa);
  ReadSocios(AJSON, AEmpresa);
end;

procedure TReceitaws4dService.ReadSocios(AJSON: TJSONObject; AEmpresa: IReceitaws4dModelPessoa);
var
  LJSON: TJSONObject;
  LJSONArray: TJSONArray;
  LSocios: TList<IReceitaws4dModelSocio>;
  I: Integer;
begin
  LJSONArray := AJSON.ValueAsJSONArray('qsa');
  if Assigned(LJSONArray) then
  begin
    LSocios := TList<IReceitaws4dModelSocio>.Create;
    try
      for I := 0 to Pred(LJSONArray.Count) do
      begin
        LJSON := LJSONArray.Items[I] as TJSONObject;
        LSocios.Add(TReceitaws4dModelSocio.New);
        LSocios.Last
          .Nome(LJSON.ValueAsString('nome'))
          .Qualificacao(LJSON.ValueAsString('qual'))
          .PaisOrigem(LJSON.ValueAsString('pais_origem'))
          .NomeRepresentanteLegal(LJSON.ValueAsString('nome_rep_legal'))
          .QualificacaoRepresentanteLegal(LJSON.ValueAsString('qual_rep_legal'))
      end;

      AEmpresa.Socios(
        TReceitaws4dModelIterator<IReceitaws4dModelSocio>.New(LSocios));
    except
      LSocios.Free;
      raise;
    end;
  end;
end;

function TReceitaws4dService.Search: IReceitaws4dModelPessoa;
var
  LUrl: String;
  LStatus: String;
  LJSON: TJSONObject;
begin
  FPessoa := TReceitaws4dModelPessoa.New;
  LUrl := Format('https://www.receitaws.com.br/v1/cnpj/%s', [FormatCNPJ(FCNPJ)]);
  FComponent
    .BaseUrl(LUrl)
    .Send;

  LJSON := FComponent.Response.GetJSONObject;
  if Assigned(LJSON) then
  begin
    LStatus := LJSON.ValueAsString('status');
    if LStatus.ToUpper = 'ERROR' then
      raise Exception.Create(LJSON.ValueAsString('message'));

    ReadFromJSON(LJSON, FPessoa);
  end;

  result := FPessoa;
end;

end.
