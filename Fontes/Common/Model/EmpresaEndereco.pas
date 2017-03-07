unit EmpresaEndereco;

interface

uses
  System.Classes, System.Generics.Collections,
  //
  Aurelius.Mapping.Attributes, Aurelius.Types.Blob, Aurelius.Types.Nullable, Aurelius.Types.Proxy;

type
  [Entity]
  [Table('EMPRESA_ENDERECO')]
  [Id('Id', TIdGenerator.IdentityOrSequence)]
  TEmpresaEndereco = class
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FLOGRADOURO: string;
    FNUMERO: string;
    FCOMPLEMENTO: string;
    FBAIRRO: string;
    FCIDADE: string;
    FCEP: string;
  public
    [Column('ID', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    property Id: Integer read FID write FID;
    [Column('ID_EMPRESA', [])]
    property IdEmpresa: Integer read FID_EMPRESA write FID_EMPRESA;
    [Column('LOGRADOURO', [], 100)]
    property Logradouro: string read FLOGRADOURO write FLOGRADOURO;
    [Column('NUMERO', [], 10)]
    property Numero: string read FNUMERO write FNUMERO;
    [Column('BAIRRO', [], 100)]
    property Bairro: string read FBAIRRO write FBAIRRO;
    [Column('CIDADE', [], 100)]
    property Cidade: string read FCIDADE write FCIDADE;
    [Column('CEP', [], 8)]
    property Cep: string read FCEP write FCEP;
  end;

implementation

initialization
  RegisterEntity(TEmpresaEndereco);

end.
