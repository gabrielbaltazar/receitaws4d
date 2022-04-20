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
  LPerson: IReceitaws4dModelPessoa;
  LIndex: Integer;
begin
  LPerson := GetReceitaws4d
              .CNPJ(edtCNPJ.Text)
              .Search;

  mmoData.Lines.Clear;

  WriteData('Nome: %s', [LPerson.Nome]);
  WriteData('Nome Fantasia: %s', [LPerson.NomeFantasia]);
  WriteData('CNPJ: %s', [LPerson.CNPJ]);
  WriteData('Ultima Atualizacao: %s', [FormatDateTime('dd/MM/yyyy hh:mm:ss', LPerson.UltimaAtualizacao)]);
  WriteData('Tipo: %s', [LPerson.Tipo]);
  WriteData('Porte: %s', [LPerson.Porte]);
  WriteData('Data Abertura: %s', [FormatDateTime('dd/MM/yyyy hh:mm:ss', LPerson.DataAbertura)]);
  WriteData('Natureza Juridica: %s', [LPerson.NaturezaJuridica]);
  WriteData('Logradouro: %s', [LPerson.Logradouro]);
  WriteData('Numero: %s', [LPerson.Numero]);
  WriteData('Complemento: %s', [LPerson.Complemento]);
  WriteData('Cep: %s', [LPerson.Cep]);
  WriteData('Bairro: %s', [LPerson.Bairro]);
  WriteData('Municipio: %s', [LPerson.Municipio]);
  WriteData('UF: %s', [LPerson.UF]);
  WriteData('Email: %s', [LPerson.Email]);
  WriteData('Telefone: %s', [LPerson.Telefone]);
  WriteData('Efr: %s', [LPerson.Efr]);
  WriteData('Situacao: %s', [LPerson.Situacao]);
  WriteData('Data Situacao: %s', [FormatDateTime('dd/MM/yyyy hh:mm:ss', LPerson.DataSituacao)]);
  WriteData('Motivo Situacao: %s', [LPerson.MotivoSituacao]);
  WriteData('Situacao Especial: %s', [LPerson.SituacaoEspecial]);
  WriteData('Capital Social: %s', [CurrToStr(LPerson.CapitalSocial)]);
  WriteData('Data Situacao Especial: %s', [FormatDateTime('dd/MM/yyyy hh:mm:ss', LPerson.DataSituacaoEspecial)]);

  WriteData('Codigo Atividade Principal: %s', [LPerson.AtividadePrincipal.Codigo]);
  WriteData('Atividade Principal: %s', [LPerson.AtividadePrincipal.Descricao]);

  WriteData('', []);
  while LPerson.AtividadesSecundarias.HasNext do
  begin
    WriteData('', []);
    LIndex := LPerson.AtividadesSecundarias.Index + 1;
    WriteData('Codigo Atividade %d: %s', [LIndex, LPerson.AtividadesSecundarias.Current.Codigo]);
    WriteData('Atividade %d: %s', [LIndex, LPerson.AtividadesSecundarias.Current.Descricao]);
  end;

  WriteData('', []);
  while LPerson.Socios.HasNext do
  begin
    WriteData('', []);
    LIndex := LPerson.Socios.Index + 1;
    WriteData('Nome Sócio %d: %s', [LIndex, LPerson.Socios.Current.Nome]);
    WriteData('Qualificação Sócio %d: %s', [LIndex, LPerson.Socios.Current.Qualificacao]);
    WriteData('País Sócio %d: %s', [LIndex, LPerson.Socios.Current.PaisOrigem]);
    WriteData('Nome Representante Sócio %d: %s', [LIndex, LPerson.Socios.Current.NomeRepresentanteLegal]);
    WriteData('Qualificacao Representante Sócio %d: %s', [LIndex, LPerson.Socios.Current.QualificacaoRepresentanteLegal]);
  end;
end;

procedure TForm1.WriteData(AText: String; const AArgs: array of const);
begin
  mmoData.Lines.Add(Format(AText, AArgs));
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
