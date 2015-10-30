program KillProcess;

uses
  Forms,
  KillProcessForm in 'KillProcessForm.pas' {Form1};


{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Kill Process par DelphiCool';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
