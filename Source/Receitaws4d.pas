unit Receitaws4d;

interface

uses
  Receitaws4d.Model.Interfaces,
  Receitaws4d.Exceptions,
  Receitaws4d.Service.Interfaces;

type
  IReceitaws4dModelPessoa = Receitaws4d.Model.Interfaces.IReceitaws4dModelPessoa;
  EReceitaws4dException = Receitaws4d.Exceptions.EReceitaws4dException;
  IReceitaws4dService = Receitaws4d.Service.Interfaces.IReceitaws4dService;

function GetReceitaws4d: IReceitaws4dService;

implementation

function GetReceitaws4d: IReceitaws4dService;
begin
  result := GetService;
end;

end.
