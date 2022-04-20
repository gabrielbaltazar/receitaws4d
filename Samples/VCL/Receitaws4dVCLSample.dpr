program Receitaws4dVCLSample;

uses
  Vcl.Forms,
  FReceitaws4dVCLSample in 'FReceitaws4dVCLSample.pas' {Form1},
  Receitaws4d.Component.Interfaces in '..\..\Source\Receitaws4d.Component.Interfaces.pas',
  Receitaws4d.Component.RestClient in '..\..\Source\Receitaws4d.Component.RestClient.pas',
  Receitaws4d.Exceptions in '..\..\Source\Receitaws4d.Exceptions.pas',
  Receitaws4d.Helper.JSON in '..\..\Source\Receitaws4d.Helper.JSON.pas',
  Receitaws4d.Model.Interfaces in '..\..\Source\Receitaws4d.Model.Interfaces.pas',
  Receitaws4d.Model.Socio in '..\..\Source\Receitaws4d.Model.Socio.pas',
  Receitaws4d.Model.Atividade in '..\..\Source\Receitaws4d.Model.Atividade.pas',
  Receitaws4d.Model.Iterator in '..\..\Source\Receitaws4d.Model.Iterator.pas',
  Receitaws4d.Model.Pessoa in '..\..\Source\Receitaws4d.Model.Pessoa.pas',
  Receitaws4d.Helper.DateTime in '..\..\Source\Receitaws4d.Helper.DateTime.pas',
  Receitaws4d.Service.Interfaces in '..\..\Source\Receitaws4d.Service.Interfaces.pas',
  Receitaws4d.Service in '..\..\Source\Receitaws4d.Service.pas',
  Receitaws4d in '..\..\Source\Receitaws4d.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
