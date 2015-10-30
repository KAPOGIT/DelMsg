{     ______          _        __      _  _____                  _
     /  _   \ ___   / /____   / /_   (_)/ ___  \ ____   ____   / /
     / /  / // _ \ / // __ \ / __ \ / // /   |_|/ __ \ / __ \ / /
   _/ /_ / //  __ / // /_/ // / / // // /_____ / /_/ // /_/ // /
  /______ / \___//_// ____//_/ /_//_/ \______/ \____/ \____//_/
                   /_/http://delphicool.developpez.com
}
unit MainForm;

 interface


 uses
   ShellApi, Messages, Windows,
   SysUtils, Classes, Controls, Forms, StdCtrls, Graphics, ExtCtrls ;

 type
   TMain = class(TForm)
    Logo: TImage;
    Moi: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure LogoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);


   private
   public
   end;


 const
   MonSite = 'http://delphicool.developpez.com';

 var
   Main: TMain;

 implementation

 {$R *.dfm}
 {$R rsrc\res.res}


{จจจจจจจจ D้but du code จจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจ}


procedure TMain.LogoClick(Sender: TObject);
  begin
   ShellExecute(handle, nil, PChar(MonSite), nil, nil,sw_maximize);
  end;




procedure TMain.Button1Click(Sender: TObject);
  begin
   ShellExecute(0,'open','Notepad',nil,nil,sw_normal);
  end;

procedure TMain.Button2Click(Sender: TObject);
  begin
    If FindWindow('Notepad',nil)<>0 Then Label2.Caption := 'En route'
    else Label2.Caption := 'Non Lanc้';
  end;

end.
