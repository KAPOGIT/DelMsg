unit KillProcessForm;

{Ma clée dans les Registre
HKEY_LOCAL_MACHINEs\Software\DelphiCool\Kill Process}

interface

uses
  Registry, Windows, SysUtils, Classes,Controls, Forms, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    EditClass: TEdit;
    Label1: TLabel;
    EditTitre: TEdit;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
  var
      dwProcessId: DWORD;
      HandleProcess:THandle;
      
  begin

     GetWindowThreadProcessId(FindWindow(Pchar(EditClass.Text),Pchar(EditTitre.Text)),@dwProcessId);
        if dwProcessId<>0 then
         begin
   {Obtention du Handle du process à partir de l'identifiant du thread
                (dwProcessId)         }
       HandleProcess:=OpenProcess(PROCESS_TERMINATE,False,dwProcessId);

    {Arrêt du process désigné par HandleProcess.
     Tous ses threads sont également arrétés.}
               TerminateProcess(HandleProcess,0);
     end;
  end;

procedure TForm1.FormCreate(Sender: TObject);
Var Reg : Tregistry;
   s : string;
begin
 Reg := Tregistry.Create;
 reg.RootKey := HKEY_LOCAL_MACHINE;
 Reg.OpenKey('Software\DelphiCool\Kill Process',True);
      s := reg.ReadString('');
      
  reg.Free;

  if s = 'true' then checkbox1.Checked := True
   else
     checkbox1.Checked := false;


end;

procedure TForm1.CheckBox1Click(Sender: TObject);
Var Reg : Tregistry;
   
begin
 Reg := Tregistry.Create;
 reg.RootKey := HKEY_LOCAL_MACHINE;
 Reg.OpenKey('Software\DelphiCool\Kill Process',True);
 if checkbox1.Checked = True then
    Begin
        Self.FormStyle := fsstayontop;
        reg.WriteString('','true');
    end
  else
    Begin
       Self.FormStyle := fsnormal;
       reg.WriteString('','false');
    end;
    
  reg.Free;

end;

end.
 