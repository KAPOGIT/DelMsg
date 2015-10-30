{----------------------------------------------------------------}
{ MYSHELL EXE - SubØ - 08/03/05                                  }
{----------------------------------------------------------------}
{ Pour tester ce programme directement dans l'EDI, il faudra     }
{ désactiver le débogueur intégré de Delphi :                    }
{ Menu Outils/Options du débogueur/Débogage intégré.             }
{----------------------------------------------------------------}
{ Il est possible dans certains cas d'utiliser directement       }
{ ShellExecute et GetForeGroundWindow ou GetActiveWindow pour    }
{ obtenir l'handle de la fenêtre du programme éxécuté.           }
{----------------------------------------------------------------}
Unit Unit1;
Interface
Uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, ExtCtrls, StdCtrls;

Type
  TForm1 = Class(TForm)
    Procedure FormCreate(Sender: TObject);
    Procedure FormResize(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  End;

Var
  Form1: TForm1;


{----------------------------------------------------------------}
{                       }Implementation{                         }
{----------------------------------------------------------------}
{$R *.DFM}
Uses MyShell;

Var
  NewHandle: Cardinal;


{----------------------------------------------------------------}
Procedure TForm1.FormCreate(Sender: TObject);
Begin
  Form1.DoubleBuffered := True;

  { Exécution de Notepad (réduit), timeOut = 5 sec }
  NewHandle := MyShellExecute('Notepad', '', 0, 5000);
  If (NewHandle = 0) Then
  Begin
    ShowMessage('Erreur d''éxécution du programme !');
    Application.Terminate;
  End;

  { Supprime la barre de titre de Notepad }
  SetWindowLong(NewHandle, GWL_STYLE,
    GetWindowLong(NewHandle, GWL_STYLE) And Not WS_CAPTION);
  SetWindowPos(NewHandle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED Or
    SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOZORDER);

  { Assigne et maximise Notepad au conteneur }
  Windows.SetParent(NewHandle, Form1.Handle);
  SetForeGroundWindow(NewHandle);
  ShowWindow(NewHandle, SW_MAXIMIZE);

End;


{----------------------------------------------------------------}
Procedure TForm1.FormResize(Sender: TObject);
Begin
  If (IsZoomed(NewHandle)) Then
    SetWindowPos(NewHandle, 0, 0, 0, ClientWidth, ClientHeight, SWP_NOACTIVATE);
End;


{----------------------------------------------------------------}
Procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Begin
  PostMessage(NewHandle, WM_CLOSE, 0, 0);
  Repeat
    Application.ProcessMessages;
    Sleep(250);
  Until(GetWindow(NewHandle, GW_HWNDFIRST) <> NewHandle);
End;


{----------------------------------------------------------------}
End.

