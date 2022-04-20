unit Receitaws4d.Service.Interfaces;

interface

uses
  Receitaws4d.Model.Interfaces,
  Receitaws4d.Component.Interfaces;

type
  IReceitaws4dService = interface
    ['{58F0946F-6E1E-4C62-A8FE-7B01D9414534}']
    function CNPJ(AValue: String): IReceitaws4dService;

    function Search: IReceitaws4dModelPessoa;
    function Pessoa: IReceitaws4dModelPessoa;

    function Component(AValue: IReceitaws4dComponentRequest): IReceitaws4dService;
  end;

function GetService: IReceitaws4dService;

implementation

uses
  Receitaws4d.Service;

function GetService: IReceitaws4dService;
begin
  result := TReceitaws4dService.New;
  result.Component(GetComponent);
end;

end.
