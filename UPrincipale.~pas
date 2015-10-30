unit UPrincipale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, Mask, ImgList, ShellAPI,Menus; 

type
  TFrmSMS = class(TForm)
    memoMsg: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    lstNumber: TListBox;
    mskNumero: TMaskEdit;
    Label5: TLabel;
    Label2: TLabel;
    EffacerMes: TButton;
    Envoi: TButton;
    Button3: TButton;
    Impcont: TButton;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    StatusBar1: TStatusBar;
    Mmsms: TMainMenu;
    Fichier1: TMenuItem;
    Envoi1: TMenuItem;
    Journal1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    EffacerMessage1: TMenuItem;
    ImporterContacts1: TMenuItem;
    Quitter1: TMenuItem;
    Button1: TButton;
    ficDlg: TOpenDialog;
    procedure EnvoiClick(Sender: TObject);
    procedure mskNumeroExit(Sender: TObject);
    procedure Quitter1Click(Sender: TObject);
    procedure Envoi1Click(Sender: TObject);
    procedure ImporterContacts1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmSMS: TFrmSMS;

implementation

uses Uutilitaires,Myshell;

{$R *.dfm}

procedure TFrmSMS.EnvoiClick(Sender: TObject);
 var i,fc : integer;
     Telephone,Message_Text : string;
begin
    with lstNumber do
    begin
        fc := lstNumber.Count;
        if fc>0 then
        for i := 0 to fc-1 do
        Begin
            Telephone:=Items[i] ;
            Message_Text:= '/i /p:'+Telephone+'/m:'+memoMsg.text+'/l';
            //ShellExecute(0, 'Open', 'C:\Program Files\Microsoft SMS Sender\smssender.exe', Pchar(Message_Text), Nil, sw_ShowNormal);
            MyShellExecute('C:\Program Files\Microsoft SMS Sender\smssender.exe',Message_Text,sw_ShowNormal,50)
        end ;
        lstNumber.Clear;
    end;

    {
    with lstNumber do
    begin
        fc := lstNumber.Count;
        if fc>0 then
        for i := 0 to fc-1 do
        Begin
            Telephone:=Items[i] ;
            Message_Text:= '/i /p:'+Telephone+'/m:'+'"'+memoMsg.text+'"'+'/l';
            Showmessage(Message_Text);
            ShellExecute(0, 'Open', 'C:\Program Files\Microsoft SMS Sender\smssender.exe', Pchar(Message_Text), Nil, sw_ShowNormal);
        end ;
        lstNumber.Clear;
    end;
     }
    // ShellExecute(0, 'Open', 'C:\Program Files\Microsoft SMS Sender\smssender.exe/i /p:22506575432/m:Bonsoir Mme Siekoua ceci est un Test Merci/l', Nil, Nil, sw_ShowNormal);
end;

procedure TFrmSMS.mskNumeroExit(Sender: TObject);
begin
    with lstNumber,Items do
    if  (IndexOf(mskNumero.Text)=-1) and (Trim(mskNumero.Text)<>'') then
    begin
        Add(mskNumero.Text);
        mskNumero.Clear;
    end;

end;

procedure TFrmSMS.Quitter1Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmSMS.Envoi1Click(Sender: TObject);
 var i,fc : integer;
    Telephone,Message_Text : string;
begin

    with lstNumber do
    begin
        fc := lstNumber.Count;
        if fc>0 then
        for i := 0 to fc-1 do
        Begin
            Telephone:=Items[i] ;
            Message_Text:= '/i /p:'+Telephone+'/m:'+memoMsg.text+'/l';
            //ShellExecute(0, 'Open', 'C:\Program Files\Microsoft SMS Sender\smssender.exe', Pchar(Message_Text), Nil, sw_ShowNormal);
            MyShellExecute('C:\Program Files\Microsoft SMS Sender\smssender.exe',Message_Text,sw_ShowNormal,50)
        end ;
        lstNumber.Clear;
    end;

    // ShellExecute(0, 'Open', 'C:\Program Files\Microsoft SMS Sender\smssender.exe/i /p:22506575432/m:Bonsoir Mme Siekoua ceci est un Test Merci/l', Nil, Nil, sw_ShowNormal);
end;
procedure TFrmSMS.ImporterContacts1Click(Sender: TObject);
begin
  FrmUtilitaire := TFrmUtilitaire.Create(self);
  with FrmUtilitaire do
  begin
    ShowModal;
    Release;
  end;
end;

procedure TFrmSMS.FormCreate(Sender: TObject);
begin
      ///FrmUtilitaire.DoubleBuffered := True;
end;

end.
