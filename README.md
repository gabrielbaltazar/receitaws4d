# Receitaws4d
Search for an company by a specific document

## Search Company
```delphi
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
```
