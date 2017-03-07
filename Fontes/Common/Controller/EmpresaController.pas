unit EmpresaController;

interface

uses
  System.Generics.Collections,
  //
  Aurelius.Engine.ObjectManager, Aurelius.Criteria.Base, Aurelius.Criteria.Expression, Aurelius.Criteria.Linq, Aurelius.Criteria.Projections,
  //
  Empresa;

type
  TEmpresaController = class
  private
    class var FManager: TObjectManager;
  public
    class procedure Save(AEmpresa: TEmpresa);
    class function Update(AEmpresa: TEmpresa): Boolean;
    class function Delete(AEmpresa: TEmpresa): Boolean;
    class function FindObject(AFilter: TCustomCriterion): TEmpresa;
    class function FindObjectList(AFilter: TCustomCriterion): TObjectList<TEmpresa>;
    class function FindCriteria(AFilter: TCustomCriterion): TCriteria;
  end;

implementation

uses
  ConnectionModule;

class procedure TEmpresaController.Save(AEmpresa: TEmpresa);
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.Save(AEmpresa);
  finally
    FManager.Free;
  end;
end;

class function TEmpresaController.Update(AEmpresa: TEmpresa): Boolean;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.Update(AEmpresa);
    Result := True;
  finally
    FManager.Free;
  end;
end;

class function TEmpresaController.Delete(AEmpresa: TEmpresa): Boolean;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.Remove(AEmpresa);
    Result := True;
  finally
    FManager.Free;
  end;
end;

class function TEmpresaController.FindObject(AFilter: TCustomCriterion): TEmpresa;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.OwnsObjects := False;
    Result := FManager.CreateCriteria<TEmpresa>.Add(AFilter).UniqueResult;
  finally
    FManager.Free;
  end;
end;

class function TEmpresaController.FindObjectList(AFilter: TCustomCriterion): TObjectList<TEmpresa>;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.OwnsObjects := False;
    Result := FManager.CreateCriteria<TEmpresa>.Add(AFilter).List;
  finally
    FManager.Free;
  end;
end;

class function TEmpresaController.FindCriteria(AFilter: TCustomCriterion): TCriteria;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.OwnsObjects := False;
    Result := FManager.CreateCriteria<TEmpresa>.Add(AFilter);
  finally
    FManager.Free;
  end;  
end;

end.
