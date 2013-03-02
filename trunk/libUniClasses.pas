unit libUniClasses;

interface
uses Classes;

Type
  TStringListW
   = Class(TStringList)
      protected
       Function GetText: widestring; reintroduce;
       Procedure SetText(s: widestring); reintroduce;
       Function GetLine(index: cardinal): widestring;
       Procedure SetLine(index: cardinal; s: widestring);
      private
      public
       Property Text: widestring read GetText write SetText;
       Property UniLines[index: cardinal]: widestring read GetLine write SetLine; default;
     End;

implementation

Function TStringListW.GetText: widestring;
 begin
  Result:=Utf8Decode(inherited Text);
 end;

Procedure TStringListW.SetText(s: WideString);
 begin
  inherited Text := Utf8Encode(s);
 end;

Function TStringListW.GetLine(index: Cardinal): widestring;
 begin
  Result := UTF8Decode(self.Strings[index]);
 end;

Procedure TStringListW.SetLine(index: Cardinal; s: WideString);
 begin
  if(index>=Cardinal(self.Count))then exit;
  self.Strings[index]:=Utf8Encode(s);
 end;

end.
