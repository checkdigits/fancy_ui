unit modules.uihelper;

interface
uses
  System.UITypes;


  function GetAccentColor(const TheDefault: TColor): TColor;

implementation
uses
  Winapi.Windows,       // for the pre-defined registry key constants
  System.Win.Registry,
  System.SysUtils;      // for the registry read access


function GetAccentColor(const TheDefault: TColor): TColor;
const
  TheKey   = 'SOFTWARE\Microsoft\Windows\DWM\';
  TheValue = 'AccentColor';
var
  Reg: TRegistry;
  AccentCol: DWord;
  sStr:     string;
begin
  // The 'undocumented' Desktop Window Manager values are found
  // in the following area:
  // \\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM\
  //
  // We then look for a DWORD value for the "AccentColor" which is
  // the color of things like the Window border, tabs in MS Edge
  // and so on.
  //
  // So the final key looks like this:
  //   \\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM\AccentColor
  //
  Result := TheDefault;
  Reg    := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.KeyExists(TheKey) then
      if Reg.OpenKey(TheKey, False) then
      try
        if Reg.ValueExists(TheValue) then
        begin
          AccentCol := Reg.ReadInteger(TheValue);
          // Read that AccentColor and convert it to an eight digit Hex value
          sStr := IntToHex(AccentCol, 8);
          // Strip out the top two digits
          sStr := Copy(sStr, 3, Length(sStr) - 2);
          // Now we make a new string from that value by prepending "$FF" to the
          // start of the string and reversing the order of the RGB bytes
          // so it's compatible with Delphi's TColor and palette
          //
          // NOTE that there are MUCH better ways of getting the RGB values
          // such as GetRValue(), GetGValue() and so on but this (truly naughty) hexstring
          // hack works too and needs no additional units..
          Result := TColor(StrToIntDef('$ff'  + Copy(sStr, 5, 2) + Copy(sStr, 3, 2) + Copy(sStr, 1, 2), TheDefault));
        end;
      finally
        Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
end;


end.
