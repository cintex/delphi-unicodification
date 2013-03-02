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
       Function Add(s: widestring): integer; reintroduce;
       Function AddObject(S: widestring; AObject: TObject): integer; reintroduce;
       Function Find(S: widestring; var Index: integer): Boolean; reintroduce;
       Function IndexOf(S: widestring): integer; reintroduce;
       Procedure Insert(index: integer; s: widestring); reintroduce;
       Procedure InsertObject(index: integer; s: widestring; AObject: TObject); reintroduce;
       Procedure Append(s: widestring); reintroduce;

       Property Text: widestring read GetText write SetText;
       Property Strings[index: cardinal]: widestring read GetLine write SetLine; default;
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
  Result := UTF8Decode(inherited Strings[index]);
 end;

Procedure TStringListW.SetLine(index: Cardinal; s: WideString);
 begin
  if(index>=Cardinal(self.Count))then exit;
  inherited Strings[index]:=Utf8Encode(s);
 end;

Function TStringListW.Add(s: WideString): integer;
 begin
  Result := inherited Add(Utf8Encode(s));
 end;

Function TStringListW.AddObject(S: WideString; AObject: TObject): integer;
 begin
  Result := inherited AddObject(UTF8Encode(s),AObject);
 end;

Function TStringListW.Find(S: WideString; var Index: Integer): Boolean;
 begin
  Result := inherited Find(UTF8Encode(s),Index);
 end;

Function TStringListW.IndexOf(S: WideString): integer;
 begin
  Result := inherited IndexOf(UTF8Encode(s));
 end;

Procedure TStringListW.Insert(index: Integer; s: WideString);
 begin
  inherited Insert(index,UTF8Encode(s));
 end;

Procedure TStringListW.InsertObject(index: Integer; s: WideString; AObject: TObject);
 begin
  inherited InsertObject(index,UTF8Encode(s), AObject);
 end;

Procedure TStringListW.Append(s: WideString);
 begin
  inherited Append(UTF8Encode(s));
 end;

end.
