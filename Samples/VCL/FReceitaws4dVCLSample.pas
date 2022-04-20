unit FReceitaws4dVCLSample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlTop: TPanel;
    edtCNPJ: TEdit;
    Label1: TLabel;
    btnSearch: TButton;
    mmoData: TMemo;
    procedure btnSearchClick(Sender: TObject);
  private
    procedure WriteData(AText: String; const AArgs: array of const);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Receitaws4d;

procedure TForm1.btnSearchClick(Sender: TObject);
var
  LPessoa: IReceitaws4dModelPessoa;
  LIndex: Integer;
begin
  LPessoa := GetReceitaws4d
              .CNPJ(edtCNPJ.Text)
              .Search;

  mmoData.Lines.Clear;

  WriteData('Nome: %s', [LPessoa.Nome]);
  WriteData('Nome Fantasia: %s', [LPessoa.NomeFantasia]);
  WriteData('CNPJ: %s', [LPessoa.CNPJ]);
  WriteData('Ultima Atualizacao: %s', [FormatDateTime('dd/MM/yyyy hh:mm:ss', LPessoa.UltimaAtualizacao)]);
  WriteData('Tipo: %s', [LPessoa.Tipo]);
  WriteData('Porte: %s', [LPessoa.Porte]);
  WriteData('Data Abertura: %s', [FormatDateTime('dd/MM/yyyy hh:mm:ss', LPessoa.DataAbertura)]);
  WriteData('Natureza Juridica: %s', [LPessoa.NaturezaJuridica]);
  WriteData('Logradouro: %s', [LPessoa.Logradouro]);
  WriteData('Numero: %s', [LPessoa.Numero]);
  WriteData('Complemento: %s', [LPessoa.Complemento]);
  WriteData('Cep: %s', [LPessoa.Cep]);
  WriteData('Bairro: %s', [LPessoa.Bairro]);
  WriteData('Municipio: %s', [LPessoa.Municipio]);
  WriteData('UF: %s', [LPessoa.UF]);
  WriteData('Email: %s', [LPessoa.Email]);
  WriteData('Telefone: %s', [LPessoa.Telefone]);
  WriteData('Efr: %s', [LPessoa.Efr]);
  WriteData('Situacao: %s', [LPessoa.Situacao]);
  WriteData('Data Situacao: %s', [FormatDateTime('dd/MM/yyyy hh:mm:ss', LPessoa.DataSituacao)]);
  WriteData('Motivo Situacao: %s', [LPessoa.MotivoSituacao]);
  WriteData('Situacao Especial: %s', [LPessoa.SituacaoEspecial]);
  WriteData('Capital Social: %s', [CurrToStr(LPessoa.CapitalSocial)]);
  WriteData('Data Situacao Especial: %s', [FormatDateTime('dd/MM/yyyy hh:mm:ss', LPessoa.DataSituacaoEspecial)]);

  WriteData('Codigo Atividade Principal: %s', [LPessoa.AtividadePrincipal.Codigo]);
  WriteData('Atividade Principal: %s', [LPessoa.AtividadePrincipal.Descricao]);

  WriteData('', []);
  while LPessoa.AtividadesSecundarias.HasNext do
  begin
    WriteData('', []);
    LIndex := LPessoa.AtividadesSecundarias.Index + 1;
    WriteData('Codigo Atividade %d: %s', [LIndex, LPessoa.AtividadesSecundarias.Current.Codigo]);
    WriteData('Atividade %d: %s', [LIndex, LPessoa.AtividadesSecundarias.Current.Descricao]);
  end;

  WriteData('', []);
  while LPessoa.Socios.HasNext do
  begin
    WriteData('', []);
    LIndex := LPessoa.Socios.Index + 1;
    WriteData('Nome Sócio %d: %s', [LIndex, LPessoa.Socios.Current.Nome]);
    WriteData('Qualificação Sócio %d: %s', [LIndex, LPessoa.Socios.Current.Qualificacao]);
    WriteData('País Sócio %d: %s', [LIndex, LPessoa.Socios.Current.PaisOrigem]);
    WriteData('Nome Representante Sócio %d: %s', [LIndex, LPessoa.Socios.Current.NomeRepresentanteLegal]);
    WriteData('Qualificacao Representante Sócio %d: %s', [LIndex, LPessoa.Socios.Current.QualificacaoRepresentanteLegal]);
  end;
end;

procedure TForm1.WriteData(AText: String; const AArgs: array of const);
begin
  mmoData.Lines.Add(Format(AText, AArgs));
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
