program SemoviSMSsender;

uses
  Windows,
  Forms,
  UPrincipale in 'UPrincipale.pas' {FrmSMS},
  Uutilitaires in 'Uutilitaires.pas' {FrmUtilitaire},
  Myshell in 'Myshell.pas';

{$R *.res}

var
H : THandle;
Erreur: Integer;
begin
  SetLastError(NO_ERROR);
  H := CreateMutex (nil, False, 'SemoviSMSsender.exe');
  Erreur := GetLastError;
  if ( Erreur = ERROR_ALREADY_EXISTS ) or ( Erreur = ERROR_ACCESS_DENIED )
  then    Exit;
  
  Application.Initialize;
  Application.CreateForm(TFrmSMS, FrmSMS);
  Application.CreateForm(TFrmUtilitaire, FrmUtilitaire);
  Application.Run;
  CloseHandle(H);

end.


