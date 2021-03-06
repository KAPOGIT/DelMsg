{----------------------------------------------------------------}
{ MYSHELL EXE - Sub� - 08/03/05                                  }
{----------------------------------------------------------------}
{ Pour tester ce programme directement dans l'EDI, il faudra     }
{ d�sactiver le d�bogueur int�gr� de Delphi :                    }
{ Menu Outils/Options du d�bogueur/D�bogage int�gr�.             }
{----------------------------------------------------------------}
{ Il est possible dans certains cas d'utiliser directement       }
{ ShellExecute et GetForeGroundWindow ou GetActiveWindow pour    }
{ obtenir l'handle de la fen�tre du programme �x�cut�.           }
{----------------------------------------------------------------}
Unit Uutilitaires;
Interface
Uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, ExtCtrls, StdCtrls;

Type
  TFrmUtilitaire = Class(TForm)
    Procedure FormCreate(Sender: TObject);
    Procedure FormResize(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  End;

Var
  FrmUtilitaire: TFrmUtilitaire;     

{----------------------------------------------------------------}
{                       }Implementation{                         }
{----------------------------------------------------------------}
{$R *.DFM}
Uses MyShell;

Var
  NewHandle: Cardinal;
{----------------------------------------------------------------}
Procedure TFrmUtilitaire.FormCreate(Sender: TObject);
Begin
  FrmUtilitaire.DoubleBuffered := True;

  { Ex�cution de Notepad (r�duit), timeOut = 5 sec }
  NewHandle := MyShellExecute('Notepad', '', 0, 5000);
  If (NewHandle = 0) Then
  Begin
    ShowMessage('Erreur d''�x�cution du programme !');
    Application.Terminate;
  End;

  { Supprime la barre de titre de Notepad }
  SetWindowLong(NewHandle, GWL_STYLE,
    GetWindowLong(NewHandle, GWL_STYLE) And Not WS_CAPTION);
  SetWindowPos(NewHandle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED Or
    SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOZORDER);

  { Assigne et maximise Notepad au conteneur }
  Windows.SetParent(NewHandle, FrmUtilitaire.Handle);
  SetForeGroundWindow(NewHandle);
  ShowWindow(NewHandle, SW_MAXIMIZE);

End;

{----------------------------------------------------------------}
Procedure TFrmUtilitaire.FormResize(Sender: TObject);
Begin
  If (IsZoomed(NewHandle)) Then
    SetWindowPos(NewHandle, 0, 0, 0, ClientWidth, ClientHeight, SWP_NOACTIVATE);
End;
{----------------------------------------------------------------}
Procedure TFrmUtilitaire.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Begin
  PostMessage(NewHandle, WM_CLOSE, 0, 0);
  Repeat
    Application.ProcessMessages;
    Sleep(250);
  Until(GetWindow(NewHandle, GW_HWNDFIRST) <> NewHandle);
End; 
{----------------------------------------------------------------}
End.

