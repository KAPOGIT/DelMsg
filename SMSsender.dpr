program SMSsender;

uses
  Forms,
  UPrincipale in 'UPrincipale.pas' {FrmSMS};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSMS, FrmSMS);
  Application.Run;
end.
