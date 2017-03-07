unit EmpresaEnderecoController;

interface

uses
  System.Generics.Collections,
  //
  Aurelius.Engine.ObjectManager, Aurelius.Criteria.Base, Aurelius.Criteria.Expression, Aurelius.Criteria.Linq, Aurelius.Criteria.Projections,
  //
  EmpresaEndereco;

type
  TEmpresaEnderecoController = class
  private
    class var FManager: TObjectManager;
  public
    class procedure Save(AEmpresaEndereco: TEmpresaEndereco);
    class function Update(AEmpresaEndereco: TEmpresaEndereco): Boolean;
    class function Delete(AEmpresaEndereco: TEmpresaEndereco): Boolean;
    class function FindObject(AFilter: TCustomCriterion): TEmpresaEndereco;
    class function FindObjectList(AFilter: TCustomCriterion): TObjectList<TEmpresaEndereco>;
    class function FindCriteria(AFilter: TCustomCriterion): TCriteria;
  end;

implementation

uses
  ConnectionModule;

class procedure TEmpresaEnderecoController.Save(AEmpresaEndereco: TEmpresaEndereco);
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.Save(AEmpresaEndereco);
  finally
    FManager.Free;
  end;
end;

class function TEmpresaEnderecoController.Update(AEmpresaEndereco: TEmpresaEndereco): Boolean;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.Update(AEmpresaEndereco);
    Result := True;
  finally
    FManager.Free;
  end;
end;

class function TEmpresaEnderecoController.Delete(AEmpresaEndereco: TEmpresaEndereco): Boolean;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.Remove(AEmpresaEndereco);
    Result := True;
  finally
    FManager.Free;
  end;
end;

class function TEmpresaEnderecoController.FindObject(AFilter: TCustomCriterion): TEmpresaEndereco;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.OwnsObjects := False;
    Result := FManager.CreateCriteria<TEmpresaEndereco>.Add(AFilter).UniqueResult;
  finally
    FManager.Free;
  end;
end;

class function TEmpresaEnderecoController.FindObjectList(AFilter: TCustomCriterion): TObjectList<TEmpresaEndereco>;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.OwnsObjects := False;
    Result := FManager.CreateCriteria<TEmpresaEndereco>.Add(AFilter).List;
  finally
    FManager.Free;
  end;
end;

class function TEmpresaEnderecoController.FindCriteria(AFilter: TCustomCriterion): TCriteria;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.OwnsObjects := False;
    Result := FManager.CreateCriteria<TEmpresaEndereco>.Add(AFilter);
  finally
    FManager.Free;
  end;
end;

end.

