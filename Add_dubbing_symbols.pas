program AddDubbingSymbols;
{
  VERSION 1.0
  DESCRIPTION
    Add the respective line endings (described in SYMBOLS) if the pause between two subtitles in milliseconds falls in between the described values (described in BOUNDARIES). i.e. >= value1 and < value2.
    This is useful for the dubbers of a movie who would use the subtitle text to know if they can take a short break speaking.
}

const MAX_INT = 2147483647;

var
  subNumber, subEnd, nextSubStart, pause, i  : Integer;
  subtitleText : string;
  symbol : string;
  SYMBOLS : array of string;
  BOUNDARIES : array of integer;
begin
  SYMBOLS := ['...;', 'V', 'VV'];
  BOUNDARIES := [500, 1000, 3800, MAX_INT]

  for subNumber := 0 to GetSubtitleCount - 2 do
  begin
		subEnd := GetSubtitleFinalTime(subNumber);
    nextSubStart := GetSubtitleInitialTime(subNumber + 1); // ?????? ?? ????????? ????????
    pause := nextSubStart - subEnd;

    subtitleText := GetSubtitleText(subNumber);
    symbol := '';
    for i := 0 to 2 do {must be to Length(BOUNDARIES) - 2, but that does not work for some reason}
    begin
      if (pause >= BOUNDARIES[i]) and (pause < BOUNDARIES[i + 1]) then
      begin
        symbol := SYMBOLS[i];
        break;
      end;
    end
    
    if symbol <> '' then
      SetSubtitleText(subNumber, subtitleText + symbol)
  end
end.
