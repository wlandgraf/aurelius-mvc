unit Empresa;

interface

uses
  System.Classes, System.Generics.Collections,
  //
  Aurelius.Mapping.Attributes, Aurelius.Types.Blob, Aurelius.Types.Nullable, Aurelius.Types.Proxy,
  //
  Contador, EmpresaEndereco;

type
  [Entity]
  [Table('EMPRESA')]
  [Id('Id', TIdGenerator.IdentityOrSequence)]
  TEmpresa = class
  private
    FID: Integer;
    FID_CONTADOR: Integer;
    FRAZAO_SOCIAL: string;
    FFANTASIA: string;
    FCNPJ: string;

    FContador: TContador;
    FEnderecoLista: TObjectList<TEmpresaEndereco>;
  public
    [Column('ID', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    property Id: Integer read FID write FID;
    [Column('ID_CONTADOR', [])]
    property IdContador: Integer read FID_CONTADOR write FID_CONTADOR;
    [Column('RAZAO_SOCIAL', [], 100)]
    property RazaoSocial: string read FRAZAO_SOCIAL write FRAZAO_SOCIAL;
    [Column('FANTASIA', [], 100)]
    property Fantasia: string read FFANTASIA write FFANTASIA;
    [Column('CNPJ', [], 100)]
    property Cnpj: string read FCNPJ write FCNPJ;

    [Association([], CascadeTypeAllButRemove)]
    [JoinColumn('ID_CONTADOR', [], 'ID')]
    property Contador: TContador read FContador write FContador;
    [ManyValuedAssociation([], CascadeTypeAll)]
    [ForeignJoinColumn('ID', [], 'ID_EMPRESA')]
    property EnderecoLista: TObjectList<TEmpresaEndereco> read FEnderecoLista write FEnderecoLista;
  end;

implementation

initialization
  RegisterEntity(TEmpresa);

end.
