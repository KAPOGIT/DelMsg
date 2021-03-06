{----------------------------------------------------------------}
{ MyShell unit - sub� - 08/03/05                                 }
{----------------------------------------------------------------}
Unit Myshell;
Interface Uses Windows, Forms, ShellApi;

Function MyShellExecute(Appli, Param: String; ShowMode, TimeOut: Integer): Cardinal;


{----------------------------------------------------------------}
{                       }Implementation{                         }
{----------------------------------------------------------------}
Var
  TabIndex: Integer;
  Lst: Array[1..2] Of Array Of HWND; // 2 listes des applications en cours
  Nbr: Array[1..2] Of Integer;       // 2 compteurs d'application en cours

{----------------------------------------------------------------}
{ R�cup�ration des handles du syst�me                            }
{----------------------------------------------------------------}
Procedure EnumWindowsCallback(H: HWND; L: LPARAM); STDCALL;
Begin
  Nbr[TabIndex] := Nbr[TabIndex] + 1;
  SetLength(Lst[TabIndex], Nbr[TabIndex] + 1);
  Lst[TabIndex, Nbr[TabIndex]] := H;
End;


{----------------------------------------------------------------}
{ Test si le handle H se trouve dans la liste n�1                }
{----------------------------------------------------------------}
Function IsNotInListe1(H: HWND): Boolean;
Var
  x: Integer;
Begin
  Result := False;
  For x := 1 To High(Lst[1]) Do
    If (H = Lst[1, x]) Then Exit;
  Result := True;
End;                                   

{----------------------------------------------------------------}
{ Compare les 2 listes pour retourner le nouvel handle           }
{----------------------------------------------------------------}
Function GetNewHandle: HWND;
Var
  x: Integer;
Begin
  Result := 0;
  For x := 1 To High(Lst[2]) Do
    If (IsNotInListe1(Lst[2, x])) Then
    Begin
      Result := Lst[2, x];
      Exit;
    End;
End;


{----------------------------------------------------------------}
{ Creation de la liste n� i des applications en cours            }
{----------------------------------------------------------------}
Procedure CreerListe(i: Integer);
Begin
  TabIndex := i;
  Nbr[TabIndex] := 1;
  FillChar(Lst[TabIndex], High(Lst[TabIndex]), 0);
  EnumWindows(@EnumWindowsCallback, 0);
End;


{----------------------------------------------------------------}
{ Ex�cution du programme - Retourne l'handle de cette appli      }
{----------------------------------------------------------------}
Function MyShellExecute(Appli, Param: String; ShowMode, TimeOut: Integer): Cardinal;
Var
  Ticks: DWord;
Begin
  Result := 0;
  CreerListe(1);
  If (ShellExecute(Application.Handle, '',
    pchar(Appli), pchar(Param), '', ShowMode) <= 32) Then Exit;
  Sleep(500);
  Ticks := GetTickCount;
  Repeat
    Application.ProcessMessages;
    CreerListe(2);
  Until (Nbr[2] > Nbr[1]) Or (GetTickCount - Ticks > TimeOut);
  If (Nbr[2] <= Nbr[1]) Then Exit;
  Result := GetNewHandle;
  Lst[1] := Nil;
  Lst[2] := Nil;
End;


{----------------------------------------------------------------}
End.

