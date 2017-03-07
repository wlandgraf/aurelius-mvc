unit ContadorController;

interface

uses
  System.Generics.Collections,
  //
  Aurelius.Engine.ObjectManager, Aurelius.Criteria.Base, Aurelius.Criteria.Expression, Aurelius.Criteria.Linq, Aurelius.Criteria.Projections,
  //
  Contador;

type
  TContadorController = class
  private
    class var FManager: TObjectManager;
  public
    class procedure Save(AContador: TContador);
    class function Update(AContador: TContador): Boolean;
    class function Delete(AContador: TContador): Boolean;
    class function FindObject(AFilter: TCustomCriterion): TContador;
    class function FindObjectList(AFilter: TCustomCriterion): TObjectList<TContador>;
    class function FindCriteria(AFilter: TCustomCriterion): TCriteria;
  end;

implementation

uses
  ConnectionModule;

class procedure TContadorController.Save(AContador: TContador);
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.Save(AContador);
  finally
    FManager.Free;
  end;
end;

class function TContadorController.Update(AContador: TContador): Boolean;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.Update(AContador);
    Result := True;
  finally
    FManager.Free;
  end;
end;

class function TContadorController.Delete(AContador: TContador): Boolean;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.Remove(AContador);
    Result := True;
  finally
    FManager.Free;
  end;
end;

class function TContadorController.FindObject(AFilter: TCustomCriterion): TContador;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.OwnsObjects := False;
    Result := FManager.CreateCriteria<TContador>.Add(AFilter).UniqueResult;
  finally
    FManager.Free;
  end;
end;

class function TContadorController.FindObjectList(AFilter: TCustomCriterion): TObjectList<TContador>;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.OwnsObjects := False;
    Result := FManager.CreateCriteria<TContador>.Add(AFilter).List;
  finally
    FManager.Free;
  end;
end;

class function TContadorController.FindCriteria(AFilter: TCustomCriterion): TCriteria;
begin
  FManager := TObjectManager.Create(TFireDacFirebirdConnection.CreateConnection);
  try
    FManager.OwnsObjects := False;
    Result := FManager.CreateCriteria<TContador>.Add(AFilter);
  finally
    FManager.Free;
  end;
end;

end.

