{$V+,B+,X+,T+,P+,H+,J+}
{----------------------------------------------------------------}
Program Project1;
Uses
  Forms,
  Unit1 In 'Unit1.pas' {Form1},
  Myshell In 'Myshell.pas';

{$R *.RES}
Begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
End.

